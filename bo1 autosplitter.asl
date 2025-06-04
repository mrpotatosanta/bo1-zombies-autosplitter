state("BlackOps") {
    int timer : 0x1679870;
    byte roundchange : 0x165695D;
}

state("BGamerT5") {
    int timer : 0x1679870;
    byte roundchange : 0x165695D;
}

isLoading { return true; }

gameTime { return TimeSpan.FromMilliseconds(current.timer * 50); }

startup{
    refreshRate = 20; // Black Ops updates at 20Hz (50ms); higher values waste CPU usage. Adjust timer display hz in LiveSplit settings, not here.
    timer.CurrentTimingMethod = TimingMethod.GameTime;
    vars.loop = 0;
}

start { return true; }

reset {
    if (current.timer < old.timer) {
        vars.loop = 0;
        return true;
    }
}


split {
    if (current.roundchange == 255 && current.roundchange != old.roundchange && vars.loop == 2) {
        return true;  // Splits on new round display for Rounds 2+ ; Skips Round 0 -> Round 1 setup;
    }
    
    if (current.roundchange == 0 && current.roundchange != old.roundchange) {
        vars.loop++;

        if (vars.loop == 3) {
            vars.loop = 1;
        }
    }
}

// Roundchange Flow
//
// State               Roundchange / Loop
// --------------------------------------
//  1. Main Menu        255 / 0
//  2. Load Screen       0  / 0
//  3. Spawn In         255 / 0
// --------------------------------------
//  4. Round 1 Start     0  / 1
//  5. Round 1 End     255 / 1
//  6. Round Switch      0  / 2
//  7. Round 2 Display 255 / 2  // Split 
// --------------------------------------
//  8. Round 2 Start     0  / 3 // Loop starts: Set loop = 1 to repeat steps 4–7 for Round N -> Round N+1