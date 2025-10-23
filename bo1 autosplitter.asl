// https://github.com/mrpotatosanta/bo1-zombies-autosplitter

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
    settings.Add("moon", false, "Moon Mode (Semi Automatic)");
    settings.SetToolTip("moon",
        "Check this box ONLY for Moon. Leave unchecked for all other maps.\n\n" +
        "WARNING: Teleporting to/from No Man's Land causes 2 false round splits.\n" +
        "You MUST manually undo these 2 splits after returning to the Moon to resync."
    );
}

init {
    vars.offset = settings["moon"] ? 2 : 0; // Sets the mode offset to 0 (Normal) or 2 (Moon)
    vars.step = current.ticks <= 0
        ? 0 // Case 1: Fresh start. Set to Step 0
        : current.roundchange == 0
            ? (2 + vars.offset) // Case 2: Mid-game, mid-round. Set to Step 2 (Normal) or 4 (Moon)
            : (3 + vars.offset); // Case 3: Mid-game, between rounds. Set to Step 3 (Normal) or 5 (Moon)
}

start { return current.ticks > 0; }

update {
    if (current.roundchange != old.roundchange) {
        vars.step++; // Increments on every roundchange flip
    }
}

split {
    if (vars.step == (6 + vars.offset)) {
        return true; // Splits on Step 6 (Normal) or Step 8 (Moon)
    }
}

reset {
    if (current.ticks < old.ticks) {
        return true; // Resets if ticks dropped
    }
}

onSplit {
    vars.step = (2 + vars.offset); // Loops back to Step 2 (Normal) or Step 4 (Moon)
}

onReset {
    vars.offset = settings["moon"] ? 2 : 0;
    vars.step = 0;
}

// Normal Flow
//
// State                          / Step / Roundchange / Ticks (0/+) / Duration
// ----------------------------------------------------------------------------
// 0. Load Screen                 /  0   /      0      /      0      /         // Reset
// 1. Main Menu / Round 1 Display /  1   /     255     /      +      / ~1s
// ----------------------------------------------------------------------------
// 2. Round 1 Start               /  2   /      0      /      +      /
// 3. Round 1 End                 /  3   /     255     /      +      / ~8s
// 4. Round Transition            /  4   /      0      /      +      / ~2.5s
// 5. Round 2 Display             /  5   /     255     /      +      / ~2s
// ----------------------------------------------------------------------------
// 6. Round 2 Start               /  6   /      0      /      +      /         // Split // Loop for Round N -> Round N+1

// Moon Flow
//
// State                          / Step / Roundchange / Ticks (0/+) / Duration
// ----------------------------------------------------------------------------
// 0. Load Screen / No Man's Land /  0   /      0      /     0/+     /         // Reset
// 1. Main Menu / Teleport        /  1   /     255     /      +      / ~8s
// 2. Pre Round Display           /  2   /      0      /      +      / ~2.5s
// 3. Round 1 Display             /  3   /     255     /      +      / ~2s
// ----------------------------------------------------------------------------
// 4. Round 1 Start               /  4   /      0      /      +      /
// 5. Round 1 End                 /  5   /     255     /      +      / ~8s
// 6. Round Transition            /  6   /      0      /      +      / ~2.5s
// 7. Round 2 Display             /  7   /     255     /      +      / ~2s
// ----------------------------------------------------------------------------
// 8. Round 2 Start               /  8   /      0      /      +      /         // Split // Loop for Round N -> Round N+1
