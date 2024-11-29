SUB controlsScene()
    POKE 23560,0
    BORDER 0: PAPER 0 : INK 7 : BRIGHT 1
    CLS

    PRINT AT 2, 0; "Controls"
    graphicsBank(2): PRINT AT 3, 0; INK 1; "\e\e\e\e\e\e\e\e": INK 7
    PRINT AT 4, 2; "q - Up"
    PRINT AT 5, 2; "a - Down"
    PRINT AT 6, 2; "o - Left"
    PRINT AT 7, 2; "p - Right"
    PRINT AT 8, 2; "s - Place a bomb"

    PRINT AT 2, 18; "Enemies"
    graphicsBank(2): PRINT AT 3, 18; INK 1; "\e\e\e\e\e\e\e": INK 7
    graphicsBank(2): PRINT AT 4, 20; INK 5; "\c" : PRINT AT 4, 22; INK 7; "- Ghoul"
    graphicsBank(2): PRINT AT 6, 20; INK 7; "\j" : PRINT AT 6, 22; INK 7; "- Skull"

    DIM lastKey, offset, i AS uByte
    DIM text, visibleText AS String

    text = " press any key to start the game -- "
    offset = 0
    
    DO
        PRINT AT 12, 0; INK 6; "Written on ZX Basic in a couple"
        PRINT AT 14, 2; INK 6; "of days, lots of coffee and"
        PRINT AT 16, 8; INK 6; "inspired by the"
        PRINT AT 18, 1; INK 6; "ZX_SPECTRUM_WARSAW_DAY event"

        visibleText = ""
        FOR i = 0 TO 31
            visibleText = visibleText + MidStr$(text, (offset + i) MOD LEN(text) + 1, 1)
        NEXT i

        PRINT AT 22, 0; BRIGHT 0; visibleText
        offset = (offset + 1) MOD LEN(text)
        lastKey = getLastKey()
    LOOP WHILE lastKey = 13 OR lastKey = 0

    CLS
END SUB

SUB winScene()
    POKE 23560,0
    BORDER 0: PAPER 0 : INK 7 : BRIGHT 1
    CLS

    PRINT AT 7, 10; INK 4; "You are winner!"
    PRINT AT 9, 7; INK 4; "Next level is ": PRINT AT 9, 22; level

    DIM lastKey, offset, i AS uByte
    DIM text, visibleText AS String

    text = " press any key to start the game -- "
    offset = 0
    
    DO
        visibleText = ""
        FOR i = 0 TO 31
            visibleText = visibleText + MidStr$(text, (offset + i) MOD LEN(text) + 1, 1)
        NEXT i

        PRINT AT 22, 0; BRIGHT 0; visibleText
        offset = (offset + 1) MOD LEN(text)
        lastKey = getLastKey()
    LOOP WHILE lastKey = 13 OR lastKey = 0

    CLS
END SUB

SUB gameOverScene()
    POKE 23560,0
    BORDER 0: PAPER 0 : INK 7 : BRIGHT 1
    CLS

    PRINT AT 7, 10; INK 2; "Game Over"
    PRINT AT 9, 0; INK 2; "You start again from first level"
    
    DIM lastKey, offset, i AS uByte
    DIM text, visibleText AS String

    text = " press any key to start the game -- "
    offset = 0
    
    DO
        visibleText = ""
        FOR i = 0 TO 31
            visibleText = visibleText + MidStr$(text, (offset + i) MOD LEN(text) + 1, 1)
        NEXT i

        PRINT AT 22, 0; BRIGHT 0; visibleText
        offset = (offset + 1) MOD LEN(text)
        lastKey = getLastKey()
    LOOP WHILE lastKey = 13 OR lastKey = 0

    CLS
End Sub

SUB tryAgainScene()
    POKE 23560,0
    BORDER 0: PAPER 0 : INK 7 : BRIGHT 1
    CLS

    PRINT AT 7, 7; INK 6; "You can do better!"
    PRINT AT 9, 2; INK 6; "Try again from the same level"
    
    DIM lastKey, offset, i AS uByte
    DIM text, visibleText AS String

    text = " press any key to start the game -- "
    offset = 0
    
    DO
        visibleText = ""
        FOR i = 0 TO 31
            visibleText = visibleText + MidStr$(text, (offset + i) MOD LEN(text) + 1, 1)
        NEXT i

        PRINT AT 22, 0; BRIGHT 0; visibleText
        offset = (offset + 1) MOD LEN(text)
        lastKey = getLastKey()
    LOOP WHILE lastKey = 13 OR lastKey = 0
    
    CLS
END SUB

SUB drawInfo()
    REM ---
    REM Display player lives
    REM ---
    IF oldPlayerLives <> playerLives THEN
        FOR i = 1 TO 3
            graphicsBank(2): PRINT AT 0, (i - 1) * 2; INK 2; "\f"
        NEXT i
        graphicsBank(2): PRINT AT 0, 6; INK 2; " "

        IF playerLives > 3 THEN
            FOR i = 1 TO 3
                IF i = 3 THEN
                    graphicsBank(2): PRINT AT 0, (i - 1) * 2; INK 2; "\h"
                ELSE
                    graphicsBank(2): PRINT AT 0, (i - 1) * 2; INK 2; "\g"
                END IF
            NEXT i
        ELSE
            FOR i = 1 TO playerLives
                graphicsBank(2): PRINT AT 0, (i - 1) * 2; INK 2; "\g"
            NEXT i
        END IF
        oldPlayerLives = playerLives
    END IF

    REM ---
    REM Display player bombs
    REM ---
    IF oldPlayerBombs <> playerBombs THEN
        graphicsBank(2): PRINT AT 0, 7; INK 6; "\b x"
        graphicsBank(2): PRINT AT 0, 11; INK 6; "   "
        graphicsBank(2): PRINT AT 0, 11; INK 6; playerBombs
        oldPlayerBombs = playerBombs
        oldPlayerPoints = 255
    END IF

    REM ---
    REM Display scores
    REM ---
    IF oldPlayerPoints <> points THEN
        DIM playerBombsStr AS STRING
        playerBombsStr = STR$(playerBombs)
        PRINT AT 0, 13; "            "
        graphicsBank(2): PRINT AT 0, 13 + LEN(playerBombsStr); INK 2; "\i x"
        graphicsBank(2): PRINT AT 0, 13 + 4 + LEN(playerBombsStr); INK 2; "      "
        graphicsBank(2): PRINT AT 0, 13 + 4 + LEN(playerBombsStr); INK 2; points
        oldPlayerPoints = points
    END IF
END SUB