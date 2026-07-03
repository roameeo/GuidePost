#!/usr/bin/env python3
"""
GuidePost - Midnight Achievement Check
Fetches the full Blizzard achievement index and diffs it against the
IDs already in guidepost_enricher_progress.json to find achievements
that are new since the last scrape (likely Midnight content).

USAGE:
    export BLIZZARD_CLIENT_ID=0df580081bba41f8b2bad0a596e745cf
    export BLIZZARD_CLIENT_SECRET=0kKtu0qd2kQ4uFguKZeLlIyrkLVbvS2S
    python3 guidepost_midnight_check.py

Output: guidepost_new_achievements.csv (id, name) for anything not
already in the progress file.
"""

import requests
import csv
import sys
import os
import json

REGION    = "us"
LOCALE    = "en_US"
NAMESPACE = f"static-{REGION}"
BASE_URL  = f"https://{REGION}.api.blizzard.com"
AUTH_URL  = "https://oauth.battle.net/token"

CLIENT_ID     = os.environ.get("BLIZZARD_CLIENT_ID",     "0df580081bba41f8b2bad0a596e745cf")
CLIENT_SECRET = os.environ.get("BLIZZARD_CLIENT_SECRET", "0kKtu0qd2kQ4uFguKZeLlIyrkLVbvS2S")


def get_access_token():
    if not CLIENT_ID or not CLIENT_SECRET:
        print("Set BLIZZARD_CLIENT_ID and BLIZZARD_CLIENT_SECRET env vars first.", file=sys.stderr)
        sys.exit(1)
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


def fetch_achievement_index(token):
    """Fetch the full list of achievements currently in the API."""
    url = f"{BASE_URL}/data/wow/achievement/index"
    params = {"namespace": NAMESPACE, "locale": LOCALE}
    headers = {"Authorization": f"Bearer {token}"}

    print("Fetching achievement index...", file=sys.stderr)
    resp = requests.get(url, headers=headers, params=params, timeout=30)
    resp.raise_for_status()
    data = resp.json()
    achievements = data.get("achievements", [])
    print(f"  Index returned {len(achievements)} achievements", file=sys.stderr)
    return achievements


def load_known_ids(progress_file):
    if not os.path.exists(progress_file):
        print(f"Progress file not found: {progress_file}", file=sys.stderr)
        sys.exit(1)
    with open(progress_file, "r", encoding="utf-8") as f:
        data = json.load(f)
    return set(int(k) for k in data.keys())


def main():
    progress_file = sys.argv[1] if len(sys.argv) > 1 else "guidepost_enricher_progress.json"
    output_file   = "guidepost_new_achievements.csv"

    known_ids = load_known_ids(progress_file)
    print(f"Loaded {len(known_ids)} known achievement IDs from {progress_file}", file=sys.stderr)

    token = get_access_token()
    current_achievements = fetch_achievement_index(token)

    new_achievements = [
        a for a in current_achievements
        if a.get("id") not in known_ids
    ]

    print(f"\nFound {len(new_achievements)} achievements not in your existing dataset.", file=sys.stderr)

    with open(output_file, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=["id", "name"])
        writer.writeheader()
        for a in sorted(new_achievements, key=lambda x: x.get("id", 0)):
            writer.writerow({"id": a.get("id"), "name": a.get("name", "")})

    print(f"Saved: {output_file}", file=sys.stderr)
    if new_achievements:
        print("\nSample of new IDs found:", file=sys.stderr)
        for a in sorted(new_achievements, key=lambda x: x.get("id", 0))[:10]:
            print(f"  {a.get('id')}: {a.get('name')}", file=sys.stderr)


if __name__ == "__main__":
    main()
