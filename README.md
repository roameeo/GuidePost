# GuidePost — WoW Addon

Step-by-step achievement guidance with TomTom waypoints, progress tracking, and zone-based suggestions.

## Features

- 📋 Step-by-step guidance for each achievement
- 🗺️ TomTom waypoint integration (click any step to drop a waypoint arrow)
- 📊 Live progress bars per achievement
- 📍 "In This Zone" suggestions when you enter a new area
- 🔔 Tooltip hints when hovering related NPCs
- 🔵 Minimap button with tracked-count badge
- ⌨️ Slash commands for quick access

## Installation

1. Copy the `GuidePost/` folder into:
   ```
   World of Warcraft/_retail_/Interface/AddOns/
   ```
2. Make sure **TomTom** is also installed and enabled.
3. Log in and type `/gp` to open the window.

## Slash Commands

| Command | Effect |
|---|---|
| `/gp` | Open / close the main window |
| `/gp list` | Print all known achievements to chat |
| `/gp track <id>` | Track an achievement by its Blizzard ID |
| `/gp untrack <id>` | Stop tracking |
| `/gp zone` | List achievements for your current zone |

## Adding Achievements

Open `data/Achievements.lua` and follow the template at the bottom of the file.

1. Find the achievement ID on [Wowhead](https://www.wowhead.com) (it's in the URL).
2. Find coordinates by hovering the in-game world map, or using `/way` in TomTom.
3. Criteria IDs can be found on the Wowhead achievement page under "Criteria".

## Requirements

- World of Warcraft: The War Within Season 2 (Interface 120005+)
- [TomTom](https://www.curseforge.com/wow/addons/tomtom)

## Folder Structure

```
GuidePost/
├── GuidePost.toc              # Addon manifest
├── GuidePost.lua              # Entry point + slash commands
├── data/
│   └── Achievements.lua       # Achievement database (edit this to add more!)
├── core/
│   ├── Events.lua             # Blizzard event listeners
│   ├── AchievementData.lua    # Queries, filters, completion checks
│   ├── TomTomIntegration.lua  # Waypoint helpers
│   └── Progress.lua           # Tracking + saved state
└── ui/
    ├── MainFrame.lua          # Main window
    ├── ProgressBar.lua        # Reusable progress bar widget
    ├── MinimapButton.lua      # Minimap icon
    └── Tooltip.lua            # NPC tooltip hints
```
