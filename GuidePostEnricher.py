#!/usr/bin/env python3
"""
GuidePost - Achievement Enricher
Reads guidepost_achievements.csv and fetches expansion + criteria
for each achievement from the Blizzard API, saving progress as it goes.

USAGE:
    python3 guidepost_enricher.py
    python3 guidepost_enricher.py --input guidepost_achievements.csv
    python3 guidepost_enricher.py --chunk 100

If interrupted, just run again -- it resumes from where it left off.
Output: guidepost_achievements_enriched.csv
"""

import requests
import csv
import sys
import os
import argparse
import time
import json

# ---------------------------------------------------------------------------
# Credentials
# ---------------------------------------------------------------------------

CLIENT_ID     = os.environ.get("BLIZZARD_CLIENT_ID",     "cd3c8ae69c6d4a0c85c73a8380f1b285")
CLIENT_SECRET = os.environ.get("BLIZZARD_CLIENT_SECRET", "mEMdD4NpeL4EUOGJgpn33wOghkHTuJA4")

REGION    = "us"
LOCALE    = "en_US"
NAMESPACE = f"static-{REGION}"
BASE_URL  = f"https://{REGION}.api.blizzard.com"
AUTH_URL  = "https://oauth.battle.net/token"

EXPANSIONS = {
    0:  "Classic",
    1:  "The Burning Crusade",
    2:  "Wrath of the Lich King",
    3:  "Cataclysm",
    4:  "Mists of Pandaria",
    5:  "Warlords of Draenor",
    6:  "Legion",
    7:  "Battle for Azeroth",
    8:  "Shadowlands",
    9:  "Dragonflight",
    10: "The War Within",
    11: "Midnight"
}

# ---------------------------------------------------------------------------
# Auth
# ---------------------------------------------------------------------------

def get_access_token():
    print("Authenticating...", file=sys.stderr)
    resp = requests.post(
        AUTH_URL,
        auth=(CLIENT_ID, CLIENT_SECRET),
        data={"grant_type": "client_credentials"},
        timeout=10,
    )
    resp.raise_for_status()
    print("  Auth OK", file=sys.stderr)
    return resp.json()["access_token"]

# ---------------------------------------------------------------------------
# API
# ---------------------------------------------------------------------------

def fetch_achievement(ach_id, token, retries=3):
    url = f"{BASE_URL}/data/wow/achievement/{ach_id}"
    params = {"namespace": NAMESPACE, "locale": LOCALE}
    headers = {"Authorization": f"Bearer {token}"}

    for attempt in range(retries):
        try:
            resp = requests.get(url, headers=headers, params=params, timeout=20)
            resp.raise_for_status()
            return resp.json()
        except requests.exceptions.Timeout:
            wait = 2 ** attempt
            print(f"  Timeout on {ach_id}, retrying in {wait}s...", file=sys.stderr)
            time.sleep(wait)
        except requests.exceptions.HTTPError as e:
            if resp.status_code == 404:
                return None  # Achievement doesn't exist, skip it
            raise

    print(f"  Gave up on {ach_id} after {retries} retries", file=sys.stderr)
    return None

# ---------------------------------------------------------------------------
# Progress tracking
# ---------------------------------------------------------------------------

def load_progress(progress_file):
    """Load already-fetched achievement IDs from progress file."""
    if not os.path.exists(progress_file):
        return {}
    with open(progress_file, "r", encoding="utf-8") as f:
        return json.load(f)


def save_progress(progress_file, progress):
    with open(progress_file, "w", encoding="utf-8") as f:
        json.dump(progress, f)

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(description="GuidePost Achievement Enricher")
    parser.add_argument("--input",  "-i", default="guidepost_achievements.csv")
    parser.add_argument("--output", "-o", default="guidepost_achievements_enriched.csv")
    parser.add_argument("--progress", "-p", default="guidepost_enricher_progress.json",
                        help="Progress file for resuming interrupted runs")
    parser.add_argument("--chunk", "-c", type=int, default=50,
                        help="Save progress every N achievements (default: 50)")
    parser.add_argument("--delay", "-d", type=float, default=0.15,
                        help="Seconds between API calls (default: 0.15)")
    args = parser.parse_args()

    # Read input CSV
    if not os.path.exists(args.input):
        print(f"Input file not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    with open(args.input, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        all_achievements = list(reader)

    print(f"Loaded {len(all_achievements)} achievements from {args.input}", file=sys.stderr)

    # Load existing progress
    progress = load_progress(args.progress)
    already_done = len(progress)
    if already_done:
        print(f"Resuming -- {already_done} already fetched, {len(all_achievements) - already_done} remaining", file=sys.stderr)

    # Auth
    try:
        token = get_access_token()
    except Exception as e:
        print(f"Auth failed: {e}", file=sys.stderr)
        sys.exit(1)

    # Enrich
    pending = [a for a in all_achievements if str(a["id"]) not in progress]
    total_pending = len(pending)
    print(f"Fetching details for {total_pending} achievements...", file=sys.stderr)

    for i, ach_ref in enumerate(pending):
        ach_id = str(ach_ref["id"])

        if i % 25 == 0:
            print(f"  {i}/{total_pending}...", file=sys.stderr)

        data = fetch_achievement(int(ach_id), token)

        if data is None:
            progress[ach_id] = {
                "expansion_id": -1,
                "expansion":    "Unknown",
                "points":       0,
                "criteria":     [],
            }
        else:
            # Expansion
            exp = data.get("expansion") or {}
            exp_id = exp.get("id", -1) if isinstance(exp, dict) else -1
            exp_name = EXPANSIONS.get(exp_id, f"Unknown ({exp_id})")

            # Criteria
            criteria_list = []
            criteria_data = data.get("criteria") or {}
            child_criteria = criteria_data.get("child_criteria", [])
            for j, crit in enumerate(child_criteria):
                desc = crit.get("description", "")
                if isinstance(desc, dict):
                    desc = desc.get("en_US", "")
                criteria_list.append({
                    "index": j + 1,
                    "id":    crit.get("id", 0),
                    "desc":  desc or "",
                })

            progress[ach_id] = {
                "expansion_id": exp_id,
                "expansion":    exp_name,
                "points":       data.get("achievement_points", 0),
                "criteria":     criteria_list,
            }

        # Save progress periodically
        if (i + 1) % args.chunk == 0:
            save_progress(args.progress, progress)
            print(f"  Progress saved ({i + 1}/{total_pending})", file=sys.stderr)

        time.sleep(args.delay)

    # Final save
    save_progress(args.progress, progress)

    # Write enriched CSV
    fieldnames = ["id", "name", "expansion_id", "expansion", "points", "criteria_count", "criteria"]
    with open(args.output, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()

        for ach in all_achievements:
            ach_id = str(ach["id"])
            extra = progress.get(ach_id, {})
            criteria = extra.get("criteria", [])

            # Flatten criteria to a readable string for the CSV
            criteria_str = " | ".join(
                f"[{c['index']}] {c['desc']}" for c in criteria if c["desc"]
            )

            writer.writerow({
                "id":             ach["id"],
                "name":           ach["name"],
                "expansion_id":   extra.get("expansion_id", ""),
                "expansion":      extra.get("expansion", ""),
                "points":         extra.get("points", ""),
                "criteria_count": len(criteria),
                "criteria":       criteria_str,
            })

    print(f"\nDone! Enriched CSV saved: {args.output}", file=sys.stderr)
    print(f"Progress file kept at: {args.progress} (delete it to start fresh)", file=sys.stderr)


if __name__ == "__main__":
    main()