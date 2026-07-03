#!/usr/bin/env python3
"""
GuidePost - Lua Stub Generator
Reads an enriched achievement CSV (id, name, expansion_id, expansion,
points, criteria_count, criteria) and outputs Lua stub entries matching
Achievements.lua's structure.

Steps are pre-populated with the actual criteria description text pulled
from the Blizzard API, but npc/coords/mapID/criteriaIndex are left as
TODO since those require in-game verification (/gp criteria, /gp mapid)
per project convention. Do not treat criteriaIndex from the API as final.

USAGE:
    python3 guidepost_generator.py --input guidepost_midnight_enriched.csv --output guidepost_midnight_stubs.lua
"""

import csv
import sys
import argparse
import os


def parse_criteria(criteria_str):
    """
    Parses the enricher's flattened criteria string:
    "[1] Kill 5 rats | [2] Loot a chest"
    Returns a list of (index, desc) tuples. Falls back to a single
    unknown entry if the field is empty.
    """
    if not criteria_str or not criteria_str.strip():
        return [(1, None)]

    parts = [p.strip() for p in criteria_str.split(" | ") if p.strip()]
    parsed = []
    for p in parts:
        if p.startswith("[") and "]" in p:
            idx_str, _, desc = p.partition("]")
            idx_str = idx_str.lstrip("[").strip()
            desc = desc.strip()
            try:
                idx = int(idx_str)
            except ValueError:
                idx = len(parsed) + 1
            parsed.append((idx, desc if desc else None))
        else:
            parsed.append((len(parsed) + 1, p))

    return parsed if parsed else [(1, None)]


def lua_escape(s):
    if s is None:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def build_step_block(idx, desc, ach_id):
    desc_clean = lua_escape(desc) if desc else "TODO"
    desc_comment = "" if desc else ""  # placeholder for symmetry / future use
    return (
        f"            {{\n"
        f"                index         = {idx},\n"
        f"                desc          = \"{desc_clean}\", -- TODO: confirm wording matches in-game criteria text\n"
        f"                npc           = nil, -- TODO\n"
        f"                coords        = nil, -- TODO: {{x=0.0, y=0.0}}\n"
        f"                mapID         = nil, -- TODO: /gp mapid\n"
        f"                criteriaIndex = {idx}, -- TODO: verify with /gp criteria {ach_id} (unverified, from API)\n"
        f"            }},\n"
    )


def build_entry(row):
    ach_id = row["id"]
    name = lua_escape(row["name"])
    criteria_list = parse_criteria(row.get("criteria", ""))

    header = (
        f"    -- -------------------------------------------------------------------------\n"
        f"    -- \"{row['name']}\" (ID {ach_id})\n"
        f"    -- TODO: verify criteriaIndex in-game with /gp criteria {ach_id}\n"
        f"    -- TODO: verify zone/mapID with /gp scan and /gp mapid\n"
        f"    -- -------------------------------------------------------------------------\n"
    )

    steps = "".join(build_step_block(idx, desc, ach_id) for idx, desc in criteria_list)

    entry = (
        f"{header}"
        f"    [{ach_id}] = {{\n"
        f"        id       = {ach_id},\n"
        f"        name     = \"{name}\",\n"
        f"        category = nil, -- TODO\n"
        f"        zone     = nil, -- TODO\n"
        f"        mapID    = nil, -- TODO: /gp mapid\n"
        f"        steps = {{\n"
        f"{steps}"
        f"        }},\n"
        f"    }},\n"
    )
    return entry


def main():
    parser = argparse.ArgumentParser(description="Generate Lua stub entries from enriched achievement CSV")
    parser.add_argument("--input",  "-i", default="guidepost_midnight_enriched.csv")
    parser.add_argument("--output", "-o", default="guidepost_midnight_stubs.lua")
    parser.add_argument("--section-title", default="Midnight (Patch 12.0)",
                        help="Section header comment text (achievement count is appended automatically)")
    args = parser.parse_args()

    if not os.path.exists(args.input):
        print(f"File not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    with open(args.input, "r", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))

    print(f"Loaded {len(rows)} achievements from {args.input}", file=sys.stderr)

    section_header = (
        f"    -- =========================================================================\n"
        f"    -- {args.section_title} ({len(rows)} achievements)\n"
        f"    -- =========================================================================\n\n"
    )

    entries = [build_entry(row) for row in rows]

    with open(args.output, "w", newline="\r\n", encoding="utf-8") as f:
        f.write(section_header)
        f.write("\n".join(entries))

    print(f"Saved: {args.output}", file=sys.stderr)
    print(f"\nThis is a standalone snippet, not a full Achievements.lua replacement.", file=sys.stderr)
    print(f"Paste its contents into Achievements.lua wherever you want the Midnight section to live.", file=sys.stderr)


if __name__ == "__main__":
    main()
