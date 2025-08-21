## LiveSplit Autosplitter for Call of Duty: Black Ops 1 Zombies 

> [!WARNING]  
> Skipping the map loading screen using a controller (X/A Button) will often break splitting functionality entirely for that game. Use Left Click skip for best results.

> [!NOTE]  
> Current version does **NOT** split correctly on Moon. Teleporting to and from No Man's Land breaks the round transition logic.

### Overview
- A hooked LiveSplit timer with fully automatic **START, PAUSE, SPLIT, and RESET** for Call of Duty: Black Ops 1 Zombies
- Compatible with Steam, BGamer, and Plutonium versions of Black Ops 1
- Game time is identical to the hooked WSplit timers
- Automatically splits for **ALL ROUNDS** (2 - 260)
- The included layout shows
    - Game Time
    - Round Time
    - The 5 most recent splits (game and round times)

<img width="250" height="238" alt="Showcase" src="https://github.com/user-attachments/assets/367225c5-1130-4807-a662-e213ebc8bb41" />

### Setup
1. Download the [Latest Release](https://github.com/mrpotatosanta/bo1-zombies-autosplitter/releases/latest)
2. Download [LiveSplit](https://livesplit.org/)
3. Right-click the timer to open context menu
4. Open Splits > From File... > `bo1 splits.lss`
5. Open Layout > From File... > `bo1 layout.lsl`
6. Edit Layout:
   - Double-click "Scriptable Auto Splitter"
   - Browse... next to "Script Path" > `bo1 autosplitter.asl`
   - Confirm "Start," "Split," and "Reset" boxes are all checked
   - Choose when splits occur in the Advanced section (Hover over the checkbox for more info)
   - Click OK on both windows
   - Save Layout
7. Edit Splits:
   - Check 'Use Layout' box > Browse... > `bo1 layout.lsl`
   - Click OK
   - Save Splits

> [!TIP]  
> The font used for both the Timer and Times in my layout template is [Digital 7 Mono Regular](https://www.dafont.com/digital-7.font), the same font used in WSplit. If it's missing, LiveSplit will substitute another font.

### Usage
- Launch LiveSplit before Black Ops 1, or while at the main menu for best results
- Not working? Try running LiveSplit as administrator
  - To always run as admin. Right click LiveSplit.exe > Properties > Compatibility tab > Check "Run this program as an administrator" box > Apply
- LiveSplit is highly customizable
  - Edit layout > Layout Settings to change just about anything
  - Add, remove, or adjust layout components to fit your needs
  - You could even add [Strett's Velocity Graph](https://github.com/strett/LiveSplit-Velocity-Graph-For-BO1-BO2-WAW-MW2) to the same layout if you wanted
- To reduce clutter on stream/recordings, crop the OBS source to only show the Detailed Timer layout component
  - Or just remove the Splits layout component entirely
- LiveSplit automatically remembers your last used splits and keeps them open. If it doesn’t, simply open `bo1 splits.lss` to restore them

### Credits
- Big shoutout to [lveez](https://github.com/lveez/bo1-timers) and [5and5](https://github.com/5and5/LiveSplitAutoSplitterForBlackOpsZombies) for their code, which gave me a base understanding of ASL scripting and useful memory addresses to build off of.
