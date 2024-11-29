SUB updateGhouls()
    DIM dirs, vector, newVector, currentChar AS UBYTE
    FOR i = 0 TO ghoulsCount - 1
        IF ghouls(i, 6) = 1 THEN
            ghouls(i, 0) = 0: ghouls(i, 1) = 0
            CONTINUE FOR
        END IF

        graphicsBank(2)
        dirs = availableDirections(ghouls(i, 0), ghouls(i, 1))
        vector = ghouls(i, 2)

        IF ghouls(i, 0) = player(0) AND ghouls(i, 1) = player(1) AND isTryAgain = 0 THEN
            isTryAgain = 1
            PAUSE 5
        END IF

        DIM currentFrame AS String
        IF ghouls(i, 3) = 0 THEN
            currentFrame = "\c"
        ELSEIF vector = LEFT THEN
            currentFrame = "\d"
        ELSEIF vector = RIGHT THEN
            currentFrame = "\d"
        ELSEIF vector = UP THEN
            currentFrame = "\d"
        ELSEIF vector = DOWN THEN
            currentFrame = "\d"
        END IF

        ghouls(i, 3) = (ghouls(i, 3) + 1) MOD 2

        FOR j = 0 TO 11
            IF ghouls(i, 0) = changeMovementPosition(j, 0) AND ghouls(i, 1) = changeMovementPosition(j, 1) THEN
                IF dirs > 0 THEN
                    DO
                        newVector = INT(RND * 4)
                    LOOP UNTIL (dirs BAND (1 << newVector))
                    vector = (1 << newVector)
                    ghouls(i, 2) = vector
                END IF
                EXIT FOR 
            END IF
        NEXT j
        
        IF NOT (dirs BAND vector) THEN
            IF dirs > 0 THEN
                DO
                    newVector = INT(RND * 4)
                LOOP UNTIL (dirs BAND (1 << newVector))
                vector = (1 << newVector)
                ghouls(i, 2) = vector
            END IF
        END IF

        ghouls(i, 4) = ghouls(i, 0)
        ghouls(i, 5) = ghouls(i, 1)

        IF vector = LEFT And dirs BAND LEFT THEN
            PRINT AT ghouls(i, 0), ghouls(i, 1); " "
            ghouls(i, 1) = ghouls(i, 1) - 1
            PRINT AT ghouls(i, 0), ghouls(i, 1); INK 5; currentFrame

        ELSEIF vector = RIGHT And dirs BAND RIGHT THEN
            PRINT AT ghouls(i, 0), ghouls(i, 1); " "
            ghouls(i, 1) = ghouls(i, 1) + 1
            PRINT AT ghouls(i, 0), ghouls(i, 1); INK 5; currentFrame

        ELSEIF vector = UP And dirs BAND UP THEN
            PRINT AT ghouls(i, 0), ghouls(i, 1); " "
            ghouls(i, 0) = ghouls(i, 0) - 1
            PRINT AT ghouls(i, 0), ghouls(i, 1); INK 5; currentFrame

        ELSEIF vector = DOWN And dirs BAND DOWN THEN
            PRINT AT ghouls(i, 0), ghouls(i, 1); " "
            ghouls(i, 0) = ghouls(i, 0) + 1
            PRINT AT ghouls(i, 0), ghouls(i, 1); INK 5; currentFrame
        END IF

        IF ghouls(i, 0) = teleportPosition(1, 0) AND ghouls(i, 1) = teleportPosition(1, 1) AND ghouls(i, 7) = 0 THEN
            PRINT AT teleportPosition(1, 0), teleportPosition(1, 1); " "
            ghouls(i, 0) = teleportPosition(0, 0): ghouls(i, 1) = teleportPosition(0, 1): ghouls(i, 7) = 1

        ELSE IF ghouls(i, 0) = teleportPosition(0, 0) AND ghouls(i, 1) = teleportPosition(0, 1) AND ghouls(i, 7) = 0 THEN
            PRINT AT teleportPosition(0, 0), teleportPosition(0, 1); " "
            ghouls(i, 0) = teleportPosition(1, 0): ghouls(i, 1) = teleportPosition(1, 1): ghouls(i, 7) = 1
        ELSE
            ghouls(i, 7) = 0
        END IF

        IF levelData(ghouls(i, 4), ghouls(i, 5)) = 1 OR levelData(ghouls(i, 4), ghouls(i, 5)) = 2 THEN
            graphicsBank(0)
            currentChar = levelData(ghouls(i, 4), ghouls(i, 5))
                BRIGHT 1
                IF currentChar = 0 THEN
                ELSEIF currentChar = 1 THEN
                    INK 2
                ELSEIF currentChar = 2 THEN
                    INK 6: BRIGHT 1
                    graphicsBank(2)
                ELSE
                    INK 1: BRIGHT 0
                END IF
                PRINT AT ghouls(i, 4), ghouls(i, 5); CHR$(143+currentChar)
        END IF

        IF ghouls(i, 0) = player(0) AND ghouls(i, 1) = player(1) AND isTryAgain = 0 THEN
            isTryAgain = 1
            PAUSE 5
        END IF

    NEXT i
END SUB