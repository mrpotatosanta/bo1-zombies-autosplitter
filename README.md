# LiveSplit Autosplitter for Call of Duty: Black Ops 1 Zombies

This repository contains a LiveSplit Autosplitter designed for Call of Duty: Black Ops 1 Zombies speedruns and high round attempts.

Developed and maintained by [mrpotatosanta](https://www.twitch.tv/mrpotatosanta)

> [!WARNING]
> Sometimes, although rarely, splitting may fail on initial map load due to a memory issue.
>
> **Perform a "Fast Restart" immediately after map load to guarantee functionality.**

> [!NOTE]
> Current version does **NOT** split correctly on the map **Moon**. Teleporting to and from No Man's Land breaks the round transition logic.

---

## Features
- **Full Automation:** Provides automatic **START, PAUSE, SPLIT, and RESET** functionality
- **Game Support:** Supports Steam, BGamer, and Plutonium versions of T5 (Black Ops 1)
- **Accurate Timing:** Utilizes game time tied directly to game ticks (identical to hooked WSplit) for maximum accuracy
- **Configurable Splits:** Automatically splits for all rounds and offers two configurable split modes:
    - **White Mode:** Splits as soon as the new round number appears on screen
    - **Red Mode (Default):** Splits when the round officially begins and zombies start spawning

### Included Files
- `bo1 autosplitter.asl`: The core script for timer control
- `bo1 subsplits.lss`: Split configuration file with splits every round. Includes main splits at 10-round intervals and round 163, **plus reference split times for comparison**
- `bo1 layout - classic wsplit style.lsl`
- `bo1 layout - full splits info.lsl`
- `bo1 layout - main split deltas.lsl`

---

## Layout Previews

> [!IMPORTANT]
> Feel free to build your own custom layout. When doing so, ensure:
> 
> 1. The **Scriptable Auto Splitter** component is included (path: `bo1 autosplitter.asl`)
> 2. You always use **Game Time** (not Real Time)

<table>
  <tr>
    <th style="text-align:center;">Classic WSplit Style</th>
    <th style="text-align:center;">Full Splits Info</th>
    <th style="text-align:center;">Main Split Deltas</th>
  </tr>
  <tr>
    <td>
      <div align="center">
        <img src="https://github.com/user-attachments/assets/cdeb8d6f-f1cd-48e2-ae5e-99fe11add9e4" width="250" />
      </div>
    </td>
    <td>
      <div align="center">
        <img src="https://github.com/user-attachments/assets/1ca65df0-5f05-4f0f-a333-699dd0affa8e" width="250" />
      </div>
    </td>
    <td>
      <div align="center">
        <img src="https://github.com/user-attachments/assets/58ece1b1-f951-46f1-9c1f-a21de513e641" width="250" />
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <ul>
        <li>Minimalist timer-only layout</li>
        <li>Styled to mimic the original WSplit colors</li>
      </ul>
    </td>
    <td>
      <ul>
        <li>Displays every split (all rounds) for the current game</li>
        <li>Column 1: Total game time (Split time)</li>
        <li>Column 2: Round time (Segment time)</li>
      </ul>
    </td>
    <td>
      <ul>
        <li>Displays main splits at every 10-round interval, plus round 163</li>
        <li>Compares the current run against a reference game</li>
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
   - Unzip, then double-click on `digital-7 (mono).ttf` to preview and install
3. Download the [Latest Release](https://github.com/mrpotatosanta/bo1-zombies-autosplitter/releases/latest) and unzip the contents
4. Load your splits:
   - Double-click `bo1 subsplits.lss`
   - *Or* in LiveSplit > Right-click > Open Splits > From File... > `bo1 subsplits.lss`
5. Load your layout:
   - Drag-and-drop `bo1 layout.lsl` onto the LiveSplit window
   - *Or* in LiveSplit > Right-click > Open Layout > From File... > `bo1 layout.lsl`
6. Configure the autosplitter:
   - Right-click LiveSplit > Edit Layout...
   - Double-click Scriptable Auto Splitter
   - Click Browse... next to "Script Path" and select `bo1 autosplitter.asl`
   - Confirm "Start," "Split," and "Reset" boxes are all checked
   - Under Advanced, choose your preferred split timing (hover over the checkbox for more info)
   - Click OK on both dialogs and Save Layout
7. Link the layout to your splits:
   - Right-click > Edit Splits...
   - Check "Use Layout" box > Browse... > select `bo1 layout.lsl`
   - Click OK and Save Splits

---

## Usage & Tips
- Launch LiveSplit before Black Ops 1 or while at the main menu.
- **Not working?** Try running LiveSplit as administrator
   - *To always run as admin. Right click `LiveSplit.exe` > Properties > Compatibility tab > Check "Run this program as an administrator" box > Apply*
- **Customization:** LiveSplit is highly customizable.
   - Customize fonts, colors, and more in Edit Layout > Layout Settings.
   - Feel free to add, remove, edit, re-order components to fit your needs.
   - You could even add other tools like [Strett's Velocity Graph](https://github.com/strett/LiveSplit-Velocity-Graph-For-BO1-BO2-WAW-MW2) to the same layout.
- LiveSplit automatically remembers your last used splits. If it doesn’t, simply open `bo1 subsplits.lss` to restore them
   - This will also open your preferred layout, assuming you linked the layout to `bo1 subsplits.lss`

---

## Included Split Reference Data
The included `bo1 subsplits.lss` file contains reference split times from the following notable games for comparison use, specifically with the `bo1 layout - main split deltas.lsl` layout.

- Kino 240 - Slewya
- Five 244 - Umesco
- Five 241 - [Jermaine](https://www.youtube.com/watch?v=pkglPf03vpY)
- Ascension 244 - [Furret](https://www.youtube.com/watch?v=Hg1MFl1p6LA&list=PL_hWedWbKNk5K9J6kfGahpy1K2K0foKZk)
- Call of the Dead 105 - Prompt
- Call of the Dead 94 - Tails
- Shangri-La 208 - HGMRICK
- Shangri-La 206 - Furret
- Moon 252 - Furret
- Nacht der Untoten 150 - hYPE
- Verruckt 212 - YYNot
- Verruckt 208 - [Slewya](https://www.youtube.com/watch?v=pvMx12CGACQ&list=PLWr9iFTeOsB7xdBLA6vK77r4JFI8nbfRu)
- Verruckt 208 - Nestor53
- Shi No Numa 237 - Mango
- Shi No Numa 235 - Tails
- Der Riese 250 - Slewya

> [!TIP]
> To change the reference comparison:
> - Right Click > Compare Against
>
> To add a new reference set:
> - Right Click > Edit Splits > Add Comparison
> - Enter split times in the new column under the **Game Time** tab and remember to Save Splits when done. You can paste on this page if it's the right format.

---

## Credits
- Big shoutout to [lveez](https://github.com/lveez/bo1-timers) and [5and5](https://github.com/5and5/LiveSplitAutoSplitterForBlackOpsZombies) for their code, which gave me a base understanding of ASL scripting and useful memory addresses to build off of.
- The main font used in my layout examples is [Digital 7 (Mono) by Style-7](https://www.dafont.com/digital-7.font)
