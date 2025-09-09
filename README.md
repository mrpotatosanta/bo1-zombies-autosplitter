# LiveSplit Autosplitter for Call of Duty: Black Ops 1 Zombies

This repository contains a LiveSplit Autosplitter designed for Call of Duty: Black Ops 1 Zombies speedruns and high-round attempts.

> [!WARNING]  
> Skipping the map loading screen using a controller (X/A Button) will often break splitting functionality for that game. **Use your mouse's Left Click to skip for best results.**

> [!NOTE]  
> Current version does **NOT** split correctly on the map **Moon**. Teleporting to and from No Man's Land breaks the round transition logic.

---

## Features
- Provides fully automatic **START, PAUSE, SPLIT, and RESET** functionality
- Supports Steam, BGamer, and Plutonium versions of T5 (Black Ops 1)
- Utilizes game time identical to hooked WSplit timers for accurate, lightweight timing
- Automatically splits for **ALL ROUNDS**
- `bo1 subsplits.lss` includes a full list of rounds (2 - 260)
   - Main splits every 10 rounds and round 163
   - Subsplits for every round in between
- Some reference split times from notable runs, to be used as the current comparison in the `bo1 layout - subsplit deltas.lsl` layout specifically
  - *Verruckt 208 (Slewya)*
  - *Ascension 244 (Furret)*
  - *Der Riese 50 SR (Oscar Otter)*
  - *Five 241 (Jermaine)*

---

## Layout Previews

### Classic WSplit Style

<img width="250" height="106" alt="Classic WSplit Style" src="https://github.com/user-attachments/assets/4105bbc3-e7dd-43a8-890d-49ccc45a775c" />

- Minimalist timer-only layout
- Styled to mimic the original WSplit colors

---

### Full Splits Info

<img width="250" height="245" alt="Full Splits Info" src="https://github.com/user-attachments/assets/60d762bf-ca7d-4130-bd8e-53b91a4f0945" />

- Displays every split and subsplit (all rounds) for the current game
- Column 1: Total game time (Split time)
- Column 2: Round time (Segment time)

---

### Subsplit Deltas

<img width="250" height="272" alt="Subsplit Deltas" src="https://github.com/user-attachments/assets/0d9e2937-74e3-4b91-9f22-918a2e337bb4" />

- Displays only main splits (every 10 rounds and 163)
- Compares current run to a reference game
- Column 1: Delta vs reference
- Column 2: Reference subsplits (white) or current subsplits (yellow)

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
