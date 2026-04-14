# GuidePost — Roadmap & Future Ideas

## Recently Completed ✓

### ✓ Min/Max Button (v2.2.0)

- Collapse the window to just the title bar to save screen space
- Remember collapsed state between sessions (saved to GuidePostDB)
- Show a summary line when collapsed (e.g. "3 tracked | 2 in this zone")

### ✓ Search Bar (v2.2.0)

- Search bar to find achievements by name, category, or zone
- Real-time filtering as you type
- Clear button to reset search quickly

### ✓ /gp next Command (v2.2.0)

- `/gp next` slash command — set waypoint for next incomplete step without opening UI
- Automatically finds first tracked achievement with incomplete steps
- Perfect for quick navigation while questing

### ✓ Faction Support (v2.1.0)

- Automatic faction detection (Alliance/Horde/Neutral)
- Faction-specific achievements filtered automatically
- Cross-faction achievements remain visible to all

### ✓ Custom Icon

- Custom minimap button icon (Media/Icon.png)
- Unique design to distinguish GuidePost from other addons

### ✓ Filter Options (v2.3.0)

- Filter by category (General, Exploration, PvP, Dungeons, etc.)
- Filter by status (All, In Progress, Not Started, Completed)
- Filter by zone (All, Current Zone)
- Low-Hanging Fruit sorting — show achievements closest to completion first
- All filters persist between sessions

---

## In Progress / Next Up

- **Achievement chains view** — show prerequisite chains visually (e.g. Loremaster)
- **Seasonal alerts** — warn when time-limited achievements are about to expire
- **Estimated completion** — rough time estimate based on step count

---

## Other Ideas (Backlog)

- **Party sync** — broadcast your current achievement goal to group members
- **WeakAuras export** — push current progress to a dynamic WA display
- **Per-character vs account-wide** — flag achievements that are account-wide
- **Sound + flash** on completion — something more satisfying than the default Blizzard ding
- **Smooth animation** on collapse/expand for minimize button

---

## Known Issues / Tech Debt

- **Pest Control mapIDs**: Best-effort values filled in (Ghostlands=647, Howling Fjord=491, Zul'Drak=496, Hellfire Peninsula=466, Durotar=1, Orgrimmar=1454, Dalaran≈502). Still need in-game verification with `/gp mapid` — especially Dalaran (502), Fire Beetle (Searing Gorge), and Gold Beetle (Badlands). Step comments note which are uncertain.
- **Pest Control Moccasin**: Resolved — "Moccasin" (NPC 4953) was renamed to "Water Snake" in a later patch. The Water Snake step is present at `criteriaIndex = 2`. Verify this index is correct with `/gp criteria 2556` if tracking appears broken.
- **Crystal Spider**: Updated to Winterspring (outdoor, no dungeon needed). MapID for Winterspring still needs in-game verification with `/gp mapid`.
- **Durotar Dart race mapIDs**: Set to `mapID = 1` (Durotar) for all 9 race achievements. Verify with `/gp mapid` while standing at the race start near Razor Hill.
- **criteriaIndex values for Durotar Dart races**: All still `nil` — run `/gp criteria <id>` in-game to fill these in.
- Sample achievements are placeholders — the real value comes from adding your own

---

## How to Contribute Data

The fastest way to expand GuidePost is to add achievements you're actually working on:

1. Find the achievement ID: `/gp scan <zone>` or look it up on Wowhead
2. Get the mapID: stand in the zone, run `/gp mapid`
3. Get criteria indexes: run `/gp criteria <id>`
4. Get coordinates: hover the in-game map or use TomTom's `/way` command
5. Add the entry to `data/Achievements.lua` using the template at the bottom of that file
