# UsefulStuff

Useful UI enhancements for World of Warcraft.

## Opening the addon

UsefulStuff runs in its own standalone, movable window instead of living inline in Blizzard's AddOns settings list. Open it with:

- `/usefulstuff` or `/us`
- The **Open UsefulStuff** button under `ESC > Options > AddOns > UsefulStuff`

The window has a sidebar on the left listing every module, each with its own **ON/OFF** toggle (disabled modules are greyed out) and a highlighted entry for whichever module's settings are shown on the right. Drag the title bar to move the window; click the X (or run the slash command again) to close it.

## Features

### Cursor Circle
- Displays a customizable circle around your cursor when holding right mouse button
- Configurable size, thickness, and color

### Combat Text
- Custom floating text when entering/leaving combat
- Fully customizable: text, size, and position (font comes from the global Font setting, see General below)
- Option to disable Blizzard's default combat text

### Action Bars
- Show on Mouseover functionality for all 8 action bars
- Bars remain hidden until you hover over them
- Master ON/OFF toggle in the sidebar, independent of the per-bar checkboxes in the module's own settings

### Combat Timer
- Displays elapsed time during combat
- Auto-anchors to player unit frame (supports ElvUI, SUF, default PlayerFrame)
- Configurable size, border, background texture, and anchor position

### Auto Combat Logging
- Automatically starts/stops advanced combat logging based on content type
- Supports: Mythic+ Dungeons, Raids (Mythic/Heroic/Normal/Finder), Arena, Scenarios
- Master ON/OFF toggle in the sidebar, independent of the per-content-type checkboxes

### Gateway Control Shard
- Shows a notification when Gateway Control Shard (spell 188152) is usable
- Displays a warning if the spell is not on any action bar
- Customizable text, size, and position

### Lust Tracker
- Detects Bloodlust/Heroism/Time Warp via haste change
- Displays an icon with remaining time countdown
- Configurable icon, size, and position

### Buff Tracker
- Track any buff's current stack count by Spell ID — just the number, no icon
- Only displayed from 2 stacks upward; at 0 or 1 stack nothing is shown (Blizzard reports a non-stacking buff as 0 stacks internally, which can't be told apart from "no extra stacks yet")
- Built on Blizzard's native `AuraContainer` widget (the same mechanism EllesmereUI's AuraBars use) rather than polling `C_UnitAuras` from addon Lua, so it keeps working in combat/Mythic+/encounters even while aura data is otherwise secret
- Optional **Duration** display per entry, with two layout templates: **Stacks - Duration** or **Duration - Stacks**
- Click **Unlock** on an entry, then drag its display anywhere on screen; click **Lock** when done
- **Test** button per entry prints the current lookup result (found/stacks/secret-state) to chat for troubleshooting

### General
- Option to hide Blizzard's bag bar
- **Font**: one font face used by every module above (Combat Text, Combat Timer, Gateway, Lust Tracker, Buff Tracker). Each module still has its own font *size* setting — only the face is shared from here.

## Installation

1. Download the latest release
2. Extract the `UsefulStuff` folder to `World of Warcraft\_retail_\Interface\AddOns\`
3. Restart World of Warcraft or reload UI (`/reload`)

## Configuration

Open the window with `/usefulstuff` (or `/us`), or via `ESC > Options > AddOns > UsefulStuff > Open UsefulStuff`.

## Requirements

- World of Warcraft Retail (Interface version 120000+, Buff Tracker requires 12.1's `AuraContainer` widget)
- Includes all required libraries (LibStub, LibSharedMedia-3.0, CallbackHandler-1.0)

## Compatibility

Works with SharedMediaAdditionalFonts and other LibSharedMedia-3.0 compatible addons.

## Version

Current version: 1.0.0

## License

All rights reserved.
