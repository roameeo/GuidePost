#!/usr/bin/env python3
"""
GuidePost - Merge Midnight Achievements
Merges guidepost_midnight_enriched.csv into the main enriched dataset,
skipping any IDs that already exist in the main file.

USAGE:
    python3 guidepost_merge_midnight.py
    python3 guidepost_merge_midnight.py --main guidepost_achievements_enriched.csv --midnight guidepost_midnight_enriched.csv --output guidepost_achievements_enriched.csv
"""

import csv
import sys
import os
import argparse
import shutil
from datetime import datetime


def load_rows(path):
    if not os.path.exists(path):
        print(f"File not found: {path}", file=sys.stderr)
        sys.exit(1)
    with open(path, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        return list(reader), reader.fieldnames


def main():
    parser = argparse.ArgumentParser(description="Merge Midnight achievements into main dataset")
    parser.add_argument("--main",     default="guidepost_achievements_enriched.csv")
    parser.add_argument("--midnight", default="guidepost_midnight_enriched.csv")
    parser.add_argument("--output",   default=None,
                        help="Defaults to overwriting --main. A timestamped backup is made first.")
    args = parser.parse_args()

    output_path = args.output or args.main

    main_rows, main_fields = load_rows(args.main)
    midnight_rows, midnight_fields = load_rows(args.midnight)

    if main_fields != midnight_fields:
        print("Warning: column headers don't match between files.", file=sys.stderr)
        print(f"  Main:     {main_fields}", file=sys.stderr)
        print(f"  Midnight: {midnight_fields}", file=sys.stderr)
        print("Proceeding using the main file's column order; mismatched fields will be blank.", file=sys.stderr)

    existing_ids = set(str(r["id"]) for r in main_rows)
    new_rows = [r for r in midnight_rows if str(r["id"]) not in existing_ids]
    skipped = len(midnight_rows) - len(new_rows)

    print(f"Main dataset:     {len(main_rows)} achievements", file=sys.stderr)
    print(f"Midnight dataset: {len(midnight_rows)} achievements", file=sys.stderr)
    print(f"New to merge:     {len(new_rows)} achievements", file=sys.stderr)
    if skipped:
        print(f"Skipped (already present): {skipped} achievements", file=sys.stderr)

    if not new_rows:
        print("Nothing new to merge. Exiting without changes.", file=sys.stderr)
        return

    # Back up the main file before writing, since output defaults to overwriting it
    if output_path == args.main and os.path.exists(args.main):
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_path = f"{args.main}.bak_{timestamp}"
        shutil.copy2(args.main, backup_path)
        print(f"Backup saved: {backup_path}", file=sys.stderr)

    merged_rows = main_rows + new_rows

    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=main_fields)
        writer.writeheader()
        for row in merged_rows:
            writer.writerow({field: row.get(field, "") for field in main_fields})

    print(f"\nDone! Merged dataset saved: {output_path}", file=sys.stderr)
    print(f"Total achievements: {len(merged_rows)}", file=sys.stderr)


if __name__ == "__main__":
    main()