state("BlackOps") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
}

state("BGamerT5") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
}

state("plutonium-bootstrapper-win32") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
}

isLoading { return true; }

gameTime { return TimeSpan.FromMilliseconds(current.ticks * 50); }

startup {
    refreshRate = 20; // Black Ops updates at 20Hz (50ms); higher values waste CPU usage. Adjust timer display refresh rate in LiveSplit settings, not here
    timer.CurrentTimingMethod = TimingMethod.GameTime;
    timer.CurrentComparison = "GameTime";
    timer.CurrentComparison = "None";
    settings.Add("red", true, "Split on round start (Red number)");
    settings.SetToolTip("red", "Choose when to split: \n \n- Checked: When the round officially begins (RED number)\n- Unchecked: As soon as the round appears (White number)");
}

init {
    vars.mode = settings["red"] ? 1 : 0; // Sets the mode offset: 1 for Red Mode / 0 for White Mode
    vars.step = current.ticks <= 0
        ? 0 // Main step init
        : current.roundchange == 0
            ? 2 // Step 2. Could also be Step 4 (~2.5s Round Transition)
            : 3; // Step 3. Could also be Step 1 (~1s Spawn In) or Step 5 (~2s Display)
}

start { return current.ticks > 0; }

update {
    if (current.roundchange != old.roundchange) {
        vars.step++; // Increments on every roundchange flip
    }
}

split {
    // White Mode (mode = 0) splits on Step 5
    // Red Mode (mode = 1) splits on Step 6
    if (vars.step == (5 + vars.mode)) {
        vars.step = (1 + vars.mode); // Resets the step for the next round's cycle. White Mode -> Step 1 / Red Mode -> Step 2
        return true; // Split
    }
}

reset {
    // Resets if ticks dropped
    if (current.ticks < old.ticks) {
        vars.step = 0;
        return true; // Reset
    }
}

// Roundchange Flow
//
// State                     / Step / Roundchange / Ticks (0/+) / Duration
// -----------------------------------------------------------------------
// 0. Load Screen            /   0  /      0      /     0       /         // Reset
// 1. Main Menu / Spawn In   /   1  /     255     /     +       / ~1s
// -----------------------------------------------------------------------
// 2. Round 1 Start          /   2  /      0      /     +       /
// 3. Round 1 End            /   3  /     255     /     +       / ~8s
// 4. Round Transition       /   4  /      0      /     +       / ~2.5s
// 5. Round 2 Display        /   5  /     255     /     +       / ~2s     // Split (White Mode)
// -----------------------------------------------------------------------

// 6. Round 2 Start          /   6  /      0      /     +       /         // Split (Red Mode) // Loop for Round N -> Round N+1
