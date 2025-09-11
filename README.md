# LiveSplit Autosplitter for Call of Duty: Black Ops 1 Zombies

This repository contains a LiveSplit Autosplitter designed for Call of Duty: Black Ops 1 Zombies speedruns and high-round attempts.

Developed and maintained by [mrpotatosanta](https://www.twitch.tv/mrpotatosanta)

> [!WARNING]
> Skipping the map loading screen using a controller (X/A Button) will often break splitting functionality for that game. **Use your mouse's Left Click to skip for best results.**

---

## Features
- Provides fully automatic **START, PAUSE, SPLIT, and RESET** functionality
- Supports Steam, BGamer, and Plutonium versions of T5 (Black Ops 1)
- Utilizes game time identical to popular hooked WSplit timers for accurate, lightweight timing
- Automatically splits for **ALL ROUNDS**
- Offers two configurable split modes to define when splits are triggered:
   - White Mode - Splits as soon as the new round number appears on screen
   - Red Mode - Splits when the round officially begins and zombies actually start spawning
- Includes:
   - `bo1 autosplitter.asl` - Core script that controls the timer
   - `bo1 subsplits.lss` - Splits config file that stores the segment names and split times
      - Main splits every 10 rounds and round 163
      - Subsplits for every round in between
      - Reference split times from notable runs, specifically for comparison use with the `bo1 layout - main split deltas.lsl` layout
         - **Verruckt 208** - Slewya
         - **Ascension 244** - Furret
         - **Der Riese 50 SR** - Oscar Otter
         - **Five 241** - Jermaine
         - More to come
   - `bo1 layout - classic wsplit style.lsl`
   - `bo1 layout - full splits info.lsl`
   - `bo1 layout - main split deltas.lsl`

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

### Classic WSplit Style

<img width="250" height="117" alt="Classic WSplit Style" src="https://github.com/user-attachments/assets/cdeb8d6f-f1cd-48e2-ae5e-99fe11add9e4" />

- Minimalist timer-only layout
- Styled to mimic the original WSplit colors

---

### Full Splits Info

<img width="250" height="247" alt="Full Splits Info" src="https://github.com/user-attachments/assets/1ca65df0-5f05-4f0f-a333-699dd0affa8e" />

- Displays every split (all rounds) for the current game
- Column 1: Total game time (Split time)
- Column 2: Round time (Segment time)

---

### Main Split Deltas

<img width="250" height="274" alt="Main Split Deltas" src="https://github.com/user-attachments/assets/3f061fd0-d362-4317-b7b7-cf527774aef3" />

- Displays main splits at every 10-round interval, plus round 163
- Compares your current run against a reference game
- Column 1: Time delta (+/-) vs reference
- Column 2: Subsplit times: white for reference, yellow for current run

> [!TIP]
> To change the reference comparison:
> - Right Click > **Compare Against**
>
> To add a new reference set:
> - Right Click > **Edit Splits > Add Comparison**
> - Enter split times in the new column under the **Game Time** tab and remember to Save Splits when done. You can paste on this page if it's the right format.

---

## Setup Instructions

1. Download and install **[LiveSplit](https://livesplit.org/)**
2. Download the **[Latest Release](https://github.com/mrpotatosanta/bo1-zombies-autosplitter/releases/latest)** and unzip the contents
3. Double-click `digital-7 (mono).ttf` to preview and install the main font
4. Launch `LiveSplit.exe` and right-click the window to open context menu
5. Open Splits > From File... > `bo1 subsplits.lss`
6. Open Layout > From File... > `bo1 layout.lsl`
7. Edit Layout:
   - Double-click "Scriptable Auto Splitter"
   - Browse... next to "Script Path" > `bo1 autosplitter.asl`
   - Confirm "Start," "Split," and "Reset" boxes are all checked
   - In the "Advanced" section, choose your preferred split timing (hover over the checkbox for more info)
   - Click OK on both windows
   - Save Layout
8. Edit Splits:
   - Check 'Use Layout' box > Browse... > `bo1 layout.lsl`
   - Click OK
   - Save Splits

---

## Usage & Tips
- For best results, launch LiveSplit before Black Ops 1 or while at the main menu.
- **Not working?** Try running LiveSplit as administrator
   - *To always run as admin. Right click `LiveSplit.exe` > Properties > Compatibility tab > Check "Run this program as an administrator" box > Apply*
- **Customization:** LiveSplit is highly customizable.
   - Customize fonts, colors, and more in **Edit Layout > Layout Settings**.
   - Feel free to add, remove, or re-order components to fit your needs.
   - You could even add other tools like **[Strett's Velocity Graph](https://github.com/strett/LiveSplit-Velocity-Graph-For-BO1-BO2-WAW-MW2)** to the same layout.
- LiveSplit automatically remembers your last used splits. If it doesn’t, simply open `bo1 subsplits.lss` to restore them
   - This will also open your preferred layout, assuming you told it what layout to use on Step 8 in the Setup Instructions

---

## Credits
- Big shoutout to [lveez](https://github.com/lveez/bo1-timers) and [5and5](https://github.com/5and5/LiveSplitAutoSplitterForBlackOpsZombies) for their code, which gave me a base understanding of ASL scripting and useful memory addresses to build off of.
- The main font used in my layout examples is **[Digital 7 (Mono) by Style-7](https://www.dafont.com/digital-7.font)**
