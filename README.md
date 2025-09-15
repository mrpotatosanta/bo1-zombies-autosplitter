# LiveSplit Autosplitter for Call of Duty: Black Ops 1 Zombies

This repository contains a LiveSplit Autosplitter designed for Call of Duty: Black Ops 1 Zombies speedruns and high-round attempts.

Developed and maintained by [mrpotatosanta](https://www.twitch.tv/mrpotatosanta)

> [!WARNING]
> Skipping the map loading screen using a controller (X/A Button) will often break splitting functionality for that game. **Use your mouse's Left Click to skip for best results.**

---

## Features
- Provides fully automatic **START, PAUSE, SPLIT, and RESET** functionality
- Supports Steam, BGamer, and Plutonium versions of T5 (Black Ops 1)
- Utilizes game time identical to popular hooked WSplit timers for accurate timing tied directly to game ticks
- Automatically splits for **ALL ROUNDS**
- Offers two configurable split modes to define when splits are triggered:
   - White Mode - Splits as soon as the new round number appears on screen
   - Red Mode - Splits when the round officially begins and zombies actually start spawning
- Includes:
   - `bo1 autosplitter.asl` - Core script that controls the timer 
   - `bo1 subsplits.lss` - Splits config file that stores the segment names and split times
      - Main splits every 10 rounds and round 163
      - Subsplits for every round in between
      - Reference split times from notable games, specifically for comparison use with `bo1 layout - main split deltas.lsl`
         - Verruckt 208 - [Slewya](https://www.youtube.com/watch?v=pvMx12CGACQ&list=PLWr9iFTeOsB7xdBLA6vK77r4JFI8nbfRu)
         - Ascension 244 - [FurretCanWalk](https://www.youtube.com/watch?v=Hg1MFl1p6LA&list=PL_hWedWbKNk5K9J6kfGahpy1K2K0foKZk)
         - Der Riese 50 SR (59:14) - [Oscar Otter](https://www.youtube.com/watch?v=LP3Hal-RNZI)
         - Five 241 - [Jermaine Cubes](https://www.youtube.com/watch?v=pkglPf03vpY)
         - More to come
   - `bo1 layout - classic wsplit style.lsl`
   - `bo1 layout - full splits info.lsl`
   - `bo1 layout - main split deltas.lsl`
   - `digital-7 (mono).ttf` - TrueType Font by [Style-7](https://www.dafont.com/digital-7.font)

> [!NOTE]  
> Current version does **NOT** split correctly on the map **Moon**. Teleporting to and from No Man's Land breaks the round transition logic.

---

## Layout Previews

> [!IMPORTANT]  
> The layouts shown below are just a few examples to highlight how insanely customizable LiveSplit can be. I highly encourage you to explore its settings and components to build a layout that fits your own style and needs.
>
> When creating your own layout, keep two things in mind:
> 1. You must include the Scriptable Auto Splitter component and point the path to `bo1 autosplitter.asl`
> 2. Always use Game Time wherever applicable (not Real Time)

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
        <li>Column 2: Subsplit times: white for reference, yellow for current run</li>
      </ul>
    </td>
  </tr>
</table>

> [!TIP]
> To change the reference comparison:
> - Right Click > Compare Against
>
> To add a new reference set:
> - Right Click > Edit Splits > Add Comparison
> - Enter split times in the new column under the **Game Time** tab and remember to Save Splits when done. You can paste on this page if it's the right format.

---

## Setup Instructions

1. Download and install [LiveSplit](https://livesplit.org/)
2. Download the [Latest Release](https://github.com/mrpotatosanta/bo1-zombies-autosplitter/releases/latest) and unzip the contents
3. Double-click `digital-7 (mono).ttf` to preview and install the main font
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

## Credits
- Big shoutout to [lveez](https://github.com/lveez/bo1-timers) and [5and5](https://github.com/5and5/LiveSplitAutoSplitterForBlackOpsZombies) for their code, which gave me a base understanding of ASL scripting and useful memory addresses to build off of.
- The main font used in my layout examples is [Digital 7 (Mono) by Style-7](https://www.dafont.com/digital-7.font)
