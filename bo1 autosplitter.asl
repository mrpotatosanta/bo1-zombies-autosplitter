// https://github.com/mrpotatosanta/bo1-zombies-autosplitter

state("BlackOps") {
    int ticks : 0x1679870;
    bool roundchange : 0x165695D;
    string32 map : 0x2162950;
    float x : 0x1679710;
}

state("BGamerT5") {
    int ticks : 0x1679870;
    bool roundchange : 0x165695D;
    string32 map : 0x2162950;
    float x : 0x1679710;
}

state("plutonium-bootstrapper-win32") {
    int ticks : 0x1679870;
    bool roundchange : 0x165695D;
    string32 map : 0x2162950;
    float x : 0x1679710;
}

isLoading { return true; }

gameTime { return TimeSpan.FromMilliseconds(current.ticks * 50); }

startup {
    refreshRate = 20; // Black Ops updates at 20Hz (50ms); higher values waste CPU usage
    timer.CurrentTimingMethod = TimingMethod.GameTime;
}

init {
    vars.offset = (current.map == "zombie_moon") ? 2 : 0;
    vars.delay = (current.map == "zombie_moon") ? 0 : 145;
    vars.intro = current.ticks > 0;
    vars.r1 = 0;
    vars.step = (current.ticks <= 0)
        ? 0
        : (!current.roundchange ? 2 + vars.offset : 3 + vars.offset);
}

start { return current.ticks > 0; }

update {
    if (current.roundchange != old.roundchange) {
        vars.step++; // Increment on every roundchange flip

        if (vars.step == 1) {
            vars.offset = (current.map == "zombie_moon") ? 2 : 0;
            vars.delay = (current.map == "zombie_moon") ? 0 : 145;
        }

        if (!vars.intro && vars.step == (2 + vars.offset)) {
            vars.r1 = current.ticks + vars.delay; // Set true round 1 start
        }
    }
}

split {
    if (!vars.intro && vars.r1 > 0 && current.ticks >= vars.r1) {
        vars.intro = true;
        return true; // Intro split
    }

    if (vars.intro && vars.step == (6 + vars.offset)) {

        if (vars.offset == 2 && current.x > 13000) {
            vars.step = 0; // Bypass two false NML splits by resetting step
            return false;
        }

        return true; // Split on Step 6 (Normal) or Step 8 (Moon)
    }

    return false;
}

onSplit { vars.step = (2 + vars.offset); } // Loop back to Step 2 (Normal) or Step 4 (Moon)

reset { return current.ticks < old.ticks; } // Reset if ticks dropped

onReset {
    vars.offset = 0;
    vars.delay = 145;
    vars.intro = false;
    vars.r1 = 0;
    vars.step = 0;
}

// Normal Flow
//
//   Step | State                           | Roundchange | Ticks | Duration |
// ---------------------------------------------------------------------------
//     0  | Load Screen / Pre Round Display |    False    |  0/+  |  <20s    | Reset
//     1  | Main Menu / Round 1 Display     |    True     |   +   |  ~1s     | Check Map, Set Offset/Delay
// ---------------------------------------------------------------------------
//     2  | Round 1 Start                   |    False    |   +   |          | Wait 7.25s (145 ticks), Intro Split
//     3  | Round 1 End                     |    True     |   +   |  ~8s     |
//     4  | Round Transition                |    False    |   +   |  ~2.5s   |
//     5  | Round 2 Display                 |    True     |   +   |  ~2s     |
// ---------------------------------------------------------------------------
//     6  | Round 2 Start                   |    False    |   +   |          | Split, Loop for Round N -> Round N+1


// Moon Flow
//
//   Step | State                           | Roundchange | Ticks | Duration |
// ---------------------------------------------------------------------------
//     0  | Load Screen / No Man's Land     |    False    |  0/+  |  >20s    | Reset
//     1  | Main Menu / Teleport            |    True     |   +   |  ~8s     | Check Map, Set Offset/Delay
//     2  | Pre Round Display               |    False    |   +   |  ~2.5s   |
//     3  | Round 1 Display                 |    True     |   +   |  ~2s     |
// ---------------------------------------------------------------------------
//     4  | Round 1 Start                   |    False    |   +   |          | Intro Split
//     5  | Round 1 End                     |    True     |   +   |  ~8s     |
//     6  | Round Transition                |    False    |   +   |  ~2.5s   |
//     7  | Round 2 Display                 |    True     |   +   |  ~2s     |
// ---------------------------------------------------------------------------
//     8  | Round 2 Start                   |    False    |   +   |          | Split, Loop for Round N -> Round N+1
