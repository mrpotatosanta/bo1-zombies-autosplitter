# LiveSplit Autosplitter for Call of Duty: Black Ops 1 Zombies

This repository contains a LiveSplit Autosplitter designed for Call of Duty: Black Ops 1 Zombies speedrunning and high round attempts.

Developed and maintained by [mrpotatosanta](https://www.twitch.tv/mrpotatosanta)

# Download

> [!IMPORTANT]
> **Now supports full automation on Moon!**

---

> [!WARNING]
> Sometimes, although rarely, splitting may fail on initial map load, due to a memory offset issue.
>
> **Perform a "Fast Restart" immediately after map load to guarantee functionality.**

---

- [Features](#features)
- [Layout Previews](#layout-previews)
- [Setup Instructions](#setup-instructions)
- [Usage & Tips](#usage--tips)
- [Split Times](#split-times)
- [Credits](#credits)

---

## Features

- **Full Automation:** Provides automatic **START, PAUSE, SPLIT**, and **RESET** functionality for all maps, including Moon

- **Game Support:** Compatible with Steam, BGamer, and Plutonium versions of T5 (Black Ops 1)

- **Accurate Timing:** Uses game time tied directly to game ticks (identical to hooked WSplit) for maximum precision

- **Round Timer:** Splits automatically at the start of each round (as zombies begin spawning)

- **Read-Only Script:** Interprets current game state by using static memory offsets. It never injects code, modifies game files, or alters memory.

### Included Files

- `bo1 autosplitter.asl`: The core script for automatic timer control
- `bo1 subsplits.lss`: Split config file with segments for every round, and [split times](#split-times) for comparison use
- `bo1 layout - classic wsplit style.lsl`
- `bo1 layout - full splits info.lsl`
- `bo1 layout - main split deltas.lsl`

---

## Layout Previews

> [!NOTE]
> Feel free to build your own custom layout.
>
> When doing so, ensure:
>
> 1. The **Scriptable Auto Splitter** component is included (path: `bo1 autosplitter.asl`)
> 2. You always use **Game Time** (not Real Time)

<table>
  <tr>
    <th width="250" align="center">Classic WSplit Style</th>
    <th width="250" align="center">Full Splits Info</th>
    <th width="250" align="center">Main Split Deltas</th>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/cdeb8d6f-f1cd-48e2-ae5e-99fe11add9e4" width="250" alt="Classic WSplit Style" />
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/1ca65df0-5f05-4f0f-a333-699dd0affa8e" width="250" alt="Full Splits Info" />
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/58ece1b1-f951-46f1-9c1f-a21de513e641" width="250" alt="Main Split Deltas" />
    </td>
  </tr>
  <tr>
    <td valign="top">
      <ul>
        <li>Minimalist timer-only layout</li>
        <li>Styled to mimic the original WSplit colors</li>
      </ul>
    </td>
    <td valign="top">
      <ul>
        <li>Displays all round splits</li>
        <li>Column 1: Total game time (Split time)</li>
        <li>Column 2: Round time (Segment time)</li>
      </ul>
    </td>
    <td valign="top">
      <ul>
        <li>Displays main splits at every 10-round interval, plus round 163</li>
        <li>Compares current run against reference splits</li>
        <li>Column 1: Time delta (+/-) vs reference</li>
        <li>Column 2: Split times: white for reference, yellow for current run</li>
      </ul>
    </td>
  </tr>
</table>

---

## Setup Instructions

1. Download and install [LiveSplit](https://livesplit.org/)
2. Download the [Digital 7 Font](https://www.dafont.com/digital-7.font) (Optional):
   - Unzip, then Double-click on `digital-7 (mono).ttf` to preview and install
3. Download and unzip the Latest Release
   - Download the latest release ZIP from the main download link at the top of this README page (or the [Latest Release](https://github.com/mrpotatosanta/bo1-zombies-autosplitter/releases/latest) page)
   - Unzip the contents, which include the `.asl` script, the `.lss` splits file, and various `.lsl` layout options
4. Load your splits:
   - Double-click `bo1 subsplits.lss`
   - *Or* in LiveSplit > Right-click > Open Splits > From File... > `bo1 subsplits.lss`
5. Load your layout:
   - Drag-and-drop `bo1 layout.lsl` onto the LiveSplit window
   - *Or* in LiveSplit > Right-click > Open Layout > From File... > `bo1 layout.lsl`
6. Configure the autosplitter:
   - Right-click > Edit Layout...
   - Double-click Scriptable Auto Splitter
   - Click Browse... next to "Script Path" and select `bo1 autosplitter.asl`
   - Confirm "Start", "Split", and "Reset" boxes are all checked
   - Click OK on both dialogs
   - Right-click > Save Layout
7. Link the layout to your splits:
   - Right-click > Edit Splits...
   - Check "Use Layout" box > Browse... > select `bo1 layout.lsl`
   - Click OK
   - Right-click > Save Splits

---

## Usage & Tips

- **Launch Order:** Open LiveSplit either before Black Ops 1 or while at the main menu. Ensure LiveSplit is open before loading into a map.

- **Restoring Configuration:** LiveSplit should automatically remember your previous setup on next launch. If it doesn't, simply open `bo1 subsplits.lss` to instantly restore your splits, linked layout, and the necessary autosplitter component path.

- **Troubleshooting (Admin Rights):** If the timer fails to start, LiveSplit may require administrator privileges. Rule of thumb: If your game runs as admin, LiveSplit must also run as admin.

  - To always run as admin: Right-click `LiveSplit.exe` > Properties > Compatibility tab > Check "Run this program as an administrator."

- **Layout Customization:** Customize fonts, colors, components, and other settings via the Layout Settings.

  - You can even add other useful components, such as [Strett's Velocity Graph](https://github.com/strett/LiveSplit-Velocity-Graph-For-BO1-BO2-WAW-MW2), to your layout.

---

## Split Times

The included `bo1 subsplits.lss` file contains reference split times from the following notable games for comparison use, specifically with `bo1 layout - main split deltas.lsl` and similar layout setups. View the [reference split times spreadsheet](https://docs.google.com/spreadsheets/d/1yKfvpefzI0toYkNBr74GwTHPvL6xY-5IRnMclEkB2aE/edit?usp=sharing).

- Kino der Toten 240 - [Slewya](https://www.youtube.com/playlist?list=PLWr9iFTeOsB7SkXt0w49eMK9_onTjo54G)
- Kino der Toten 50 (1:03:19) - [oscar_otter1](https://www.youtube.com/watch?v=Y3TCJs5eWew)
- Five 244 - [Umesco](https://www.youtube.com/watch?v=MvTyAw3vkwk)
- Five 241 - [Jermaine](https://www.youtube.com/watch?v=pkglPf03vpY)
- Five 50 (1:06:19) - [Umesco](https://www.youtube.com/watch?v=4kJ0KP_ZlcM)
- Five 50 (1:06:49) - [Jermaine](https://www.youtube.com/watch?v=x09yOfyclus)
- Ascension 244 - [Furret](https://www.youtube.com/playlist?list=PL_hWedWbKNk5K9J6kfGahpy1K2K0foKZk)
- Ascension 240 - [Zomba](https://www.youtube.com/playlist?list=PLiREKVZDAaDoiHeV7rsjSGXk9ArPw-XGJ)
- Ascension 50 (1:00:13) - [oscar_otter1](https://www.youtube.com/watch?v=gdYLi5FbkXI)
- Call of the Dead 105 - [Prompt](https://www.youtube.com/watch?v=FvTgTl8p990)
- Call of the Dead 94 - [Tails](https://www.youtube.com/playlist?list=PLCarQI8WPOf_jekCCzJ-iGNaF3Sp1isoo)
- Call of the Dead 50 (1:25:30) - [Prompt](https://www.twitch.tv/videos/2544912230?t=01h04m58s)
- Shangri-La 208 - [HGMRICK](https://www.youtube.com/watch?v=zxe3-SUz6-8)
- Shangri-La 206 - [Furret](https://www.youtube.com/playlist?list=PL_hWedWbKNk5CXcZIaW_wVe6-uDUohwAf)
- Shangri-La 50 (1:10:45) - [Furret](https://www.youtube.com/watch?v=UktKeTPdkxM&t=1453s)
- Moon 252 - [Furret](https://www.youtube.com/playlist?list=PL_hWedWbKNk5RwFpeZHKKOlGTPDstUky3)
- Moon 50 (1:06:49) - [Furret](https://www.youtube.com/watch?v=McJV1GIhu1A&t=1309s)
- Nacht der Untoten 150 - [hYPE](https://www.youtube.com/watch?v=4aRSc2i9xF0)
- Nacht der Untoten 50 (2:16:00) - [Cruppz](https://www.youtube.com/watch?v=94msvOb_L44)
- Verruckt 212 - YYNot
- Verruckt 208 - [Slewya](https://www.youtube.com/playlist?list=PLWr9iFTeOsB7xdBLA6vK77r4JFI8nbfRu)
- Verruckt 208 - [Nestor53](https://www.youtube.com/watch?v=2AxJcFAZ_Wo)
- Verruckt 50 (1:17:07) - [Trikkiez](https://www.twitch.tv/videos/2140825512?t=00h04m20s)
- Verruckt 50 (1:18:31) - [Slewya](https://www.youtube.com/watch?v=2DgmaTfb0sU&t=48s)
- Shi No Numa 237 - [Mango](https://www.youtube.com/playlist?list=PLC1OcLOAJdHBD_w274LCmOF4iCEUreDJX)
- Shi No Numa 235 - [Tails](https://www.youtube.com/playlist?list=PLCarQI8WPOf91mjmsok45EaoxITjS2ahD)
- Shi No Numa 50 (1:16:25) - [Slewya](https://www.youtube.com/watch?v=swtrZKil39Q&t=7204s)
- Der Riese 250 - [Slewya](https://www.youtube.com/playlist?list=PLWr9iFTeOsB6417HfAeNQnSYeXPy6eaE8)
- Der Riese 50 (58:41) - [itzxil](https://www.youtube.com/watch?v=GShKDZy67pc)

> [!TIP]
> To change the reference comparison:
>
> - Right-click > Compare Against
>
> To add a new reference set:
>
> - Right-click > Edit Splits... > Add Comparison
> - Enter split times in the new column under the **Game Time** tab
> - You can paste times on this page if it's the correct duration format
> - Right-click > Save Splits

> [!NOTE]
> **The included round 50 speedruns have splits for every round.**
>
> To display all round splits on `bo1 layout - main split deltas.lsl`:
>
> - Right-click > Edit Layout... > Double-click Subsplits
> - Change the setting from the default "Always Hide Subsplits" to "Always Show Subsplits"

---

## Credits

- Big shoutout to [lveez](https://github.com/lveez/bo1-timers) and [5and5](https://github.com/5and5/LiveSplitAutoSplitterForBlackOpsZombies) for their code, which gave me a base understanding of ASL scripting and useful memory addresses to build off of.
- The main font used in my layout examples is [Digital 7 (Mono) by Style-7](https://www.dafont.com/digital-7.font).
- I pulled most of the high round split times from the [Game Stats Archive by TailsCanFly](https://docs.google.com/spreadsheets/d/1O05W14n6CZezorPmM6Ott-bjdnQxXPFeizN6f4OGNPU/edit?usp=sharing).

---
