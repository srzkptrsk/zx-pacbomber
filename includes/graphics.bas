SUB graphicsBank (bank AS uByte)
    IF bank = 0 THEN
        POKE UINTEGER 23675, @graphicsBank1
    ELSEIF bank = 1 THEN
        POKE UINTEGER 23675, @graphicsBank2
    ELSEIF bank = 2 THEN
        POKE UINTEGER 23675, @graphicsBank3
    ELSE
        POKE UINTEGER 23675, @graphicsBank1
    END IF
    RETURN

    graphicsBank1:
    ASM
    DEFB 000,000,000,024,024,000,000,000 ; A - Dot
    DEFB 064,176,152,060,126,126,060,024 ; B - Bomb
    DEFB 000,255,255,000,000,255,255,000 ; C - Horizontal Wall
    DEFB 102,102,102,102,102,102,102,102 ; D - Vertical Wall
    DEFB 102,103,099,096,096,127,063,000 ; E - Bottom Left Corner
    DEFB 102,230,198,006,006,254,252,000 ; F - Bottom Right Corner
    DEFB 000,063,127,096,096,099,103,102 ; G - Top Left Corner
    DEFB 000,252,254,006,006,198,230,102 ; H - Top Right Corner
    DEFB 000,063,127,096,096,127,063,000 ; I - Left Wall End
    DEFB 000,252,254,006,006,254,252,000 ; J - Right Wall End
    DEFB 000,060,126,102,102,102,102,102 ; K - Wall Top End
    DEFB 102,102,102,102,102,126,060,000 ; L - Wall Bottom End
    DEFB 102,230,198,006,006,198,230,102 ; M - T Junction left
    DEFB 102,103,099,096,096,099,103,102 ; N - T Junction Right
    DEFB 102,231,195,000,000,255,255,000 ; O - T Junction Up
    DEFB 000,255,255,000,000,195,231,102 ; P - T Junction Down
    DEFB 000,000,000,126,126,000,000,000 ; Q - Ghost Gate
    DEFB 060,102,114,090,106,090,106,126 ; R - Door
    END ASM

    graphicsBank2:
    ASM
    DEFB 000,000,000,024,024,000,000,000 ; A - Dot
    DEFB 060,114,079,007,007,079,126,060 ; B - Pac-Man Left
    DEFB 060,078,242,224,224,242,126,060 ; C - Pac-Man Right
    DEFB 000,066,195,195,195,231,255,126 ; D - Pac-Man Up
    DEFB 060,126,255,231,195,195,066,000 ; E - Pac-Man Down
    DEFB 060,126,255,255,255,255,126,060 ; F - Pac-Man Closed Circle
    DEFB 060,030,031,015,015,031,030,060 ; G - Pac Man Dying Frame 2 (Left is Frame 1)
    DEFB 012,014,015,015,015,015,014,012 ; H - Pac Man Dying Frame 3 (50%)
    DEFB 000,002,007,007,007,007,002,000 ; I - Pac Man Dying Frame 4 (25%)
    DEFB 000,000,001,003,003,001,000,000 ; J - Pac Man Dying Frame 5 (12%)
    DEFB 066,036,000,000,102,000,036,066 ; K - Pac Man Dying (Pop!)
    DEFB 060,126,219,255,255,255,219,219 ; L - Ghost
    DEFB 001,003,003,006,014,062,124,224 ; M - Banana
    DEFB 002,004,030,063,063,063,063,030 ; N - Apple
    DEFB 004,012,018,054,111,111,118,032 ; O - Cherries
    END ASM

    graphicsBank3:
    ASM
    DEFB 016,000,020,168,021,040,000,008 ; A - Explode
    DEFB 064,176,152,060,126,126,060,024 ; B - Bomb
    DEFB 036,060,223,122,126,060,042,042 ; C - Ghoul (Frame 1)
    DEFB 036,060,251,094,126,060,084,084 ; D - Ghoul (Frame 2)
    DEFB 170,085,000,000,000,000,000,000 ; E - Line
    DEFB 102,153,129,129,066,036,024,000 ; F - Empty Heart
    DEFB 102,255,255,255,126,060,024,000 ; G - Full Heart
    DEFB 098,247,242,240,114,055,018,000 ; H - Heart ++
    DEFB 008,024,060,062,126,124,060,000 ; I - Crystals
    DEFB 028,062,073,093,054,028,034,028 ; J - Skull (Frame 1)
    DEFB 056,124,146,186,108,124,056,000 ; K - Skull (Frame 2)
    END ASM
END SUB