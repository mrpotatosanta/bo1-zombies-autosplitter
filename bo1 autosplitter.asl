// https://github.com/mrpotatosanta/bo1-zombies-autosplitter

state("BlackOps") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
    int map : 0x2B67B6C;
    float x : 0x1679710;
}

state("BGamerT5") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
    int map : 0x2B67B6C;
    float x : 0x1679710;
}

state("plutonium-bootstrapper-win32") {
    int ticks : 0x1679870;
    byte roundchange : 0x165695D;
    int map : 0x2B67B6C;
    float x : 0x1679710;
}

isLoading { return true; }

gameTime { return TimeSpan.FromMilliseconds(current.ticks * 50); }

startup {
    refreshRate = 20; // Black Ops updates at 20Hz (50ms); higher values waste CPU usage
    timer.CurrentTimingMethod = TimingMethod.GameTime;
}

init {
    vars.offset = (current.map == 163) ? 2 : 0;
    vars.step = (current.ticks <= 0)
        ? 0
        : (current.roundchange == 0 ? 2 + vars.offset : 3 + vars.offset);
}

start { return current.ticks > 0; }

update {
    if (current.roundchange != old.roundchange) {
        vars.step++; // Increment on every roundchange flip

        if (vars.step == 1) {
            vars.offset = (current.map == 163) ? 2 : 0; // Set offset
        }
    }
}

split {
    if (vars.step == (6 + vars.offset)) {

        if (vars.offset == 2 && current.x > 13000) {
            vars.step = 0; // Bypass two false NML splits by resetting step
            return false;
        }

        return true; // Split on Step 6 (Normal) or Step 8 (Moon)
    }
}

onSplit { vars.step = (2 + vars.offset); } // Loop back to Step 2 (Normal) or Step 4 (Moon)

reset { return current.ticks < old.ticks; } // Reset if ticks dropped

onReset {
    vars.offset = 0;
    vars.step = 0;
}

// Normal Flow
//
//   Step | State                           | Roundchange | Ticks | Duration |
// ---------------------------------------------------------------------------
//     0  | Load Screen / Pre Round Display |      0      |  0/+  |  <20s    | Reset
//     1  | Main Menu / Round 1 Display     |    255      |   +   |  ~1s     | Check Map, Set Offset
// ---------------------------------------------------------------------------
//     2  | Round 1 Start                   |      0      |   +   |          |
//     3  | Round 1 End                     |    255      |   +   |  ~8s     |
//     4  | Round Transition                |      0      |   +   |  ~2.5s   |
//     5  | Round 2 Display                 |    255      |   +   |  ~2s     |
// ---------------------------------------------------------------------------
//     6  | Round 2 Start                   |      0      |   +   |          | Split, Loop for Round N -> Round N+1


// Moon Flow
//
//   Step | State                           | Roundchange | Ticks | Duration |
// ---------------------------------------------------------------------------
//     0  | Load Screen / No Man's Land     |      0      |  0/+  |  >20s    | Reset
//     1  | Main Menu / Teleport            |    255      |   +   |  ~8s     | Check Map, Set Offset
//     2  | Pre Round Display               |      0      |   +   |  ~2.5s   |
//     3  | Round 1 Display                 |    255      |   +   |  ~2s     |
// ---------------------------------------------------------------------------
//     4  | Round 1 Start                   |      0      |   +   |          |
//     5  | Round 1 End                     |    255      |   +   |  ~8s     |
//     6  | Round Transition                |      0      |   +   |  ~2.5s   |
//     7  | Round 2 Display                 |    255      |   +   |  ~2s     |
// ---------------------------------------------------------------------------
//     8  | Round 2 Start                   |      0      |   +   |          | Split, Loop for Round N -> Round N+1


// Map IDs
//
// Main Menu         |   5
// Kino der Toten    |  37
// Five              |  77
// Dead Ops Arcade   |  35
// Ascension         | 189
// Call of the Dead  |  85
// Shangri-La        | 129
// Moon              | 163
// Nacht der Untoten |   3
// Verruckt          |  50
// Shi No Numa       |  99
// Der Riese         |  90
