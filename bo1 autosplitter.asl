// https://github.com/mrpotatosanta/bo1-zombies-autosplitter

state("BlackOps") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
    float x : 0x1679710;
}

state("BGamerT5") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
    float x : 0x1679710;
}

state("plutonium-bootstrapper-win32") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
    float x : 0x1679710;
}

isLoading { return true; }

gameTime { return TimeSpan.FromMilliseconds(current.ticks * 50); }

startup {
    refreshRate = 20; // Black Ops updates at 20Hz (50ms); higher values waste CPU usage. Adjust timer display refresh rate in LiveSplit settings, not here
    timer.CurrentTimingMethod = TimingMethod.GameTime;
}

init {
    vars.offset = (current.ticks > 0 && current.x > 13000) ? 2 : 0;
    vars.step = (vars.offset == 2)
        ? 0
        : (current.ticks <= 0)
            ? 0
            : (current.roundchange == 0)
                ? 2
                : 3;
}

start { return current.ticks > 0; }

update {
    if (current.roundchange != old.roundchange) {
        vars.step++; // Increments on every roundchange flip

        if (vars.step == 1) {
            vars.offset = (current.ticks > 400) ? 2 : 0; // Determines offset based on time taken to reach Step 1
        }
    }
}

split {
    if (vars.step == (6 + vars.offset)) {

        if (vars.offset == 2 && current.x > 13000) {
            vars.step = 0; // If on Moon and at NML, set to Step 0 to bypass the two false splits
            return false;
        }

        return true; // Splits on Step 6 (Normal) or Step 8 (Moon)
    }
}

onSplit {
    vars.step = (2 + vars.offset); // Loops back to Step 2 (Normal) or Step 4 (Moon)
}

reset {
    if (current.ticks < old.ticks) {
        return true; // Resets if ticks dropped
    }
}

onReset {
    vars.offset = 0;
    vars.step = 0;
}

// Normal Flow
//
// State                              / Step / Roundchange / Ticks (0/+) / Duration
// --------------------------------------------------------------------------------
// 0. Load Screen / Pre Round Display /  0   /      0      /     0/+     / <20s    // Reset // Use normal offset (0) if <20s to reach Step 1
// 1. Main Menu / Round 1 Display     /  1   /     255     /      +      / ~1s
// --------------------------------------------------------------------------------
// 2. Round 1 Start                   /  2   /      0      /      +      /
// 3. Round 1 End                     /  3   /     255     /      +      / ~8s
// 4. Round Transition                /  4   /      0      /      +      / ~2.5s
// 5. Round 2 Display                 /  5   /     255     /      +      / ~2s
// --------------------------------------------------------------------------------
// 6. Round 2 Start                   /  6   /      0      /      +      /         // Split // Loop for Round N -> Round N+1

// Moon Flow
//
// State                              / Step / Roundchange / Ticks (0/+) / Duration
// --------------------------------------------------------------------------------
// 0. Load Screen / No Man's Land     /  0   /      0      /     0/+     / >20s    // Reset // Use moon offset (2) if >20s to reach Step 1
// 1. Main Menu / Teleport            /  1   /     255     /      +      / ~8s
// 2. Pre Round Display               /  2   /      0      /      +      / ~2.5s
// 3. Round 1 Display                 /  3   /     255     /      +      / ~2s
// --------------------------------------------------------------------------------
// 4. Round 1 Start                   /  4   /      0      /      +      /
// 5. Round 1 End                     /  5   /     255     /      +      / ~8s
// 6. Round Transition                /  6   /      0      /      +      / ~2.5s
// 7. Round 2 Display                 /  7   /     255     /      +      / ~2s
// --------------------------------------------------------------------------------
// 8. Round 2 Start                   /  8   /      0      /      +      /         // Split // Loop for Round N -> Round N+1
