# LiveSplit Autosplitter for Call of Duty: Black Ops 1 Zombies

This repository contains a LiveSplit Autosplitter designed for Call of Duty: Black Ops 1 Zombies speedruns and high-round attempts.

# [Download v1.4.0 (Latest Release)](https://github.com/mrpotatosanta/bo1-zombies-autosplitter/releases/download/v1.4.0/bo1-zombies-autosplitter-1.4.0.zip)

> [!WARNING]  
> Skipping the map loading screen using a controller (X/A Button) will often break splitting functionality for that game. **Use your mouse's Left Click to skip for best results.**

> [!NOTE]  
> Current version does **NOT** split correctly on the map **Moon**. Teleporting to and from No Man's Land breaks the round transition logic.

---

## Features
- Provides fully automatic **START, PAUSE, SPLIT, and RESET** functionality
- Supports Steam, BGamer, and Plutonium versions of T5 (Black Ops 1)
- Utilizes game time identical to popular hooked WSplit timers for accurate, loadless timing
- Automatically splits for **ALL ROUNDS** (2 - 260)
- Includes a pre-configured layout that displays total Game Time, current Round Time, and your 5 most recent splits

<img width="250" height="238" alt="Showcase" src="https://github.com/user-attachments/assets/367225c5-1130-4807-a662-e213ebc8bb41" />

---

## Setup Instructions
1. Download the **[Latest Release](https://github.com/mrpotatosanta/bo1-zombies-autosplitter/releases/latest)** and unzip the contents
2. Download and install **[LiveSplit](https://livesplit.org/)**
3. In LiveSplit, right-click the window to open context menu
4. Open Splits > From File... > `bo1 splits.lss`
5. Open Layout > From File... > `bo1 layout.lsl`
6. Edit Layout:
   - Double-click "Scriptable Auto Splitter"
   - Browse... next to "Script Path" > `bo1 autosplitter.asl`
   - Confirm "Start," "Split," and "Reset" boxes are all checked
   - In the "Advanced" section, choose your preferred split timing (hover over the checkbox for more info)
   - Click OK on both windows
   - Save Layout
7. Edit Splits:
   - Check 'Use Layout' box > Browse... > `bo1 layout.lsl`
   - Click OK
   - Save Splits

> [!TIP]
> The font used in my layout template is **[Digital 7 Mono Regular](https://www.dafont.com/digital-7.font)**, which is the same font used in WSplit. If you don't have it installed, LiveSplit will substitute a default font.

---

## Usage & Tips
- For best results, launch LiveSplit before Black Ops 1 or while at the main menu.
- **Not working?** Try running LiveSplit as administrator
  - *To always run as admin. Right click LiveSplit.exe > Properties > Compatibility tab > Check "Run this program as an administrator" box > Apply*
- **Customization:** LiveSplit is highly customizable.
    - Customize fonts, colors, and more in **Edit Layout > Layout Settings**.
    - Feel free to add, remove, or re-order components to fit your needs.
    - You could even add other tools like **[Strett's Velocity Graph](https://github.com/strett/LiveSplit-Velocity-Graph-For-BO1-BO2-WAW-MW2)** to the same layout.
- **Streaming:** To reduce clutter on stream, you can either remove the "Splits" component from the layout entirely or crop the window capture in OBS to only show the timers.
- LiveSplit automatically remembers your last used splits. If it doesn’t, simply open `bo1 splits.lss` to restore them

---

## Credits
- Big shoutout to [lveez](https://github.com/lveez/bo1-timers) and [5and5](https://github.com/5and5/LiveSplitAutoSplitterForBlackOpsZombies) for their code, which gave me a base understanding of ASL scripting and useful memory addresses to build off of.
