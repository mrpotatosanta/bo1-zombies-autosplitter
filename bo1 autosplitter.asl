state("BlackOps") {
    int timer : 0x1679870;
    byte roundchange : 0x165695D;
}

state("BGamerT5") {
    int timer : 0x1679870;
    byte roundchange : 0x165695D;
}

state("plutonium-bootstrapper-win32") {
    int timer : 0x1679870;
    byte roundchange : 0x165695D;
}

isLoading { return true; }

gameTime { return TimeSpan.FromMilliseconds(current.timer * 50); }

startup {
    refreshRate = 20; // Black Ops updates at 20Hz (50ms); higher values waste CPU usage. Adjust timer display refresh rate in LiveSplit settings, not here
    timer.CurrentTimingMethod = TimingMethod.GameTime;
}

init {
    vars.canSplit = false;
    if (current.timer <= 0) {
        vars.step = 0; // Main vars.step init
    }
    else {
        // Mid-game init: vars.step set to most probable current state
        // Will cause split errors or desyncs if LiveSplit is launched during a few brief mid-game windows
        if (current.roundchange == 0) {
            vars.step = 2; // Step 2. Could also be Step 4 (~2.5s Round Transition)
        }
        else {
            vars.step = 3; // Step 3. Could also be Step 1 (~1s Spawn In) or Step 5 (~2s Display)
        }
    }
}

start { return true; }

update {
    if (current.roundchange != old.roundchange) {
        vars.step++; // Increments on roundchange flip
        vars.canSplit = true;
    }
}

split {
    if (vars.step == 5) {
        vars.canSplit = false; // Flag to prevent duplicate split triggers
        vars.step = 1; // Resets to Step 1 so next roundchange flip syncs with Step 2
        return true; // Splits on new round display
    }
}

reset {
    // Resets if timer dropped between frames
    // Also resets during first 0.25s in case inital timer drop was missed
    if (current.timer < old.timer || (current.timer >= 1 && current.timer <= 5)) {
        vars.step = 0;
        return true;
    }
}

// Roundchange Flow

// State                        Step / Roundchange / Timer (0/+) / Duration
// -------------------------------------------------------------------------
// 0. Load Screen               0    / 0          / 0                       // Reset
// 1. Main Menu / Spawn In      1    / 255        / +            ~1s
// -------------------------------------------------------------------------
// 2. Round 1 Start             2    / 0          / +
// 3. Round 1 End               3    / 255        / +            ~8s
// 4. Round Transition          4    / 0          / +            ~2.5s
// 5. Round 2 Display           5    / 255        / +            ~2s        // Split
// -------------------------------------------------------------------------
// 6. Round 2 Start             6    / 0          / +                       // Loop starts: Set Step = 2 to repeat steps 2–5 for Round N -> Round N+1