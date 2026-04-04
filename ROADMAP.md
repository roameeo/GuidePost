# GuidePost — Roadmap & Future Ideas

## In Progress / Next Up

### Filter Options
- Filter the achievement list by category (General, Exploration, PvP, Dungeons, etc.)
- Filter by status: All / In Progress / Not Started / Completed
- Filter by zone: only show achievements for the current zone
- Search bar to find achievements by name
- "Low-hanging fruit" filter — show achievements closest to completion first

### Min/Max Button
- Collapse the window to just the title bar to save screen space
- Remember collapsed state between sessions (save to GuidePostDB)
- Show a summary line when collapsed (e.g. "3 tracked | 2 in this zone")
- Smooth animation on collapse/expand would be nice

### Custom Icon
- Design a unique minimap button icon (compass + achievement star concept?)
- Replace the current repurposed Blizzard texture
- Consider a small badge overlay showing tracked achievement count
- Possible tool: export from Photoshop/GIMP as 64x64 .tga file, reference in .toc

---

## Other Ideas (Backlog)

- **Achievement chains view** — show prerequisite chains visually (e.g. Loremaster)
- **Seasonal alerts** — warn when time-limited achievements are about to expire
- **Party sync** — broadcast your current achievement goal to group members
- **Estimated completion** — rough time estimate based on step count
- **WeakAuras export** — push current progress to a dynamic WA display
- **`/gp next`** slash command — set waypoint for next incomplete step without opening UI
- **Per-character vs account-wide** — flag achievements that are account-wide
- **Sound + flash** on completion — something more satisfying than the default Blizzard ding

---

## Known Issues / Tech Debt

- mapIDs for most Pest Control steps still need to be verified in-game with `/gp mapid`
- Pest Control Moccasin step is missing its criteriaIndex — verify with `/gp criteria 2556`
- Explore Durotar mapID needs verification with `/gp mapid` while in Durotar
- Sample achievements are placeholders — the real value comes from adding your own

---

## How to Contribute Data

The fastest way to expand GuidePost is to add achievements you're actually working on:

1. Find the achievement ID: `/gp scan <zone>` or look it up on Wowhead
2. Get the mapID: stand in the zone, run `/gp mapid`
3. Get criteria indexes: run `/gp criteria <id>`
4. Get coordinates: hover the in-game map or use TomTom's `/way` command
5. Add the entry to `data/Achievements.lua` using the template at the bottom of that file
