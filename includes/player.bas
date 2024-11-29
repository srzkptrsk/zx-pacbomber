FUNCTION availableDirections(y AS uByte,x AS uByte) AS uByte
    DIM retVal as uByte
    retVal=0

    IF levelData(y, x - 1) <= 2 THEN
        retVal = LEFT
    END IF

    IF levelData(y, x + 1) <= 2 THEN
        retVal = retVal BOR RIGHT
    END IF
    
    IF levelData(y - 1, x) <= 2 THEN
        retVal = retVal BOR UP
    END IF
    
    IF levelData(y + 1, x) <= 2 THEN
        retVal = retVal BOR DOWN
    END IF
    
    RETURN retVal
END FUNCTION

SUB showPlayerAtStart(y AS uByte, x AS uByte)
    graphicsBank(1)
    PRINT AT y, x; INK 6; "\f"
END SUB

SUB updatePlayer()
    REM get()
    graphicsBank(1)
    DIM dirs, vector, keyPressed AS Ubyte
    dirs = availableDirections(player(0), player(1))
    vector = player(2)
    keyPressed = getLastKey()

    IF ghoulsCount > 0 THEN
        FOR i = 0 TO ghoulsCount - 1
            IF ghouls(i, 0) = player(0) AND ghouls(i, 1) = player(1) AND isTryAgain = 0 THEN
                isTryAgain = 1
                PAUSE 5
            END IF
        NEXT i
    END IF

    IF skullsCount > 0 THEN
        FOR i = 0 TO skullsCount - 1
            IF skulls(i, 0) = player(0) AND skulls(i, 1) = player(1) AND isTryAgain = 0 THEN
                isTryAgain = 1
                PAUSE 5
            END IF
        NEXT i
    END IF

    IF playerBombs > 0 And bombIsPlaced = 0 THEN
        IF keyPressed = CODE "s" THEN
            placeBomb()
            bombIsPlaced = 1
            playerBombs = playerBombs - 1
            keyPressed = 0
        END IF
    END IF

    IF isTeleported = 0
        IF keyPressed = CODE "q" And dirs BAND UP THEN
            vector = UP
        END IF

        IF keyPressed = CODE "a" And dirs BAND DOWN THEN
            vector = DOWN
        END IF

        IF keyPressed = CODE "o" And dirs BAND LEFT THEN
            vector = LEFT
        END IF

        IF keyPressed = CODE "p" And dirs BAND RIGHT THEN
            vector = RIGHT
        END IF
    END IF

    DIM currentFrame AS String
    IF animationFrame = 0 THEN
        currentFrame = "\f"
    ELSEIF vector = LEFT THEN
        currentFrame = "\b"
    ELSEIF vector = RIGHT THEN
        currentFrame = "\c"
    ELSEIF vector = UP THEN
        currentFrame = "\d"
    ELSEIF vector = DOWN THEN
        currentFrame = "\e"
    END IF

    animationFrame = (animationFrame + 1) MOD 2

    IF vector = LEFT And dirs BAND LEFT THEN
        PRINT AT player(0), player(1); " "
        player(1) = player(1) - 1
        PRINT AT player(0), player(1); INK 6; currentFrame

    ELSEIF vector = RIGHT And dirs BAND RIGHT THEN
        PRINT AT player(0), player(1); " "
        player(1) = player(1) + 1
        PRINT AT player(0), player(1); INK 6; currentFrame

    ELSEIF vector = UP And dirs BAND UP THEN
        PRINT AT player(0), player(1); " "
        player(0) = player(0) - 1
        PRINT AT player(0), player(1); INK 6; currentFrame

    ELSEIF vector = DOWN And dirs BAND DOWN THEN
        PRINT AT player(0), player(1); " "
        player(0) = player(0) + 1
        PRINT AT player(0), player(1); INK 6; currentFrame
    END IF

    REM Collect points and bombs
    IF levelData(player(0), player(1)) = 1 THEN
        points = points + 10
        levelCrystals = levelCrystals - 1
        levelData(player(0), player(1)) = 0
    ELSEIF levelData(player(0), player(1)) = 2 THEN
        playerBombs = playerBombs + 1
        levelData(player(0), player(1)) = 0
    END IF

    player(2) = vector

    IF ghoulsCount > 0 THEN
        FOR i = 0 TO ghoulsCount - 1
            IF ghouls(i, 0) = player(0) AND ghouls(i, 1) = player(1) AND isTryAgain = 0 THEN
                isTryAgain = 1
                PAUSE 5
            END IF
        NEXT i
    END IF

    IF skullsCount > 0 THEN
        FOR i = 0 TO skullsCount - 1
            IF skulls(i, 0) = player(0) AND skulls(i, 1) = player(1) AND isTryAgain = 0 THEN
                isTryAgain = 1
                PAUSE 5
            END IF
        NEXT i
    END IF

    IF player(0) = teleportPosition(1, 0) AND player(1) = teleportPosition(1, 1) AND isTeleported = 0 THEN
        PRINT AT teleportPosition(1, 0), teleportPosition(1, 1); " "
        player(0) = teleportPosition(0, 0): player(1) = teleportPosition(0, 1)
        isTeleported = 1
    ELSE IF player(0) = teleportPosition(0, 0) AND player(1) = teleportPosition(0, 1) AND isTeleported = 0 THEN
        PRINT AT teleportPosition(0, 0), teleportPosition(0, 1); " "
        player(0) = teleportPosition(1, 0): player(1) = teleportPosition(1, 1)
        isTeleported = 1
    ELSE
        isTeleported = 0
    END IF

    IF player(0) = levelExit(0) AND player(1) = levelExit(1) THEN
        isWin = 1
        winBeeps()
    END IF

    PAUSE 5
END SUB

SUB placeBomb()
    DIM i As uByte
    FOR i = 0 TO 3
        IF bombs(i, 0) = 255 THEN
            bombs(i, 0) = player(0)
            bombs(i, 1) = player(1)
            bombs(i, 2) = 10
        END IF
    NEXT i
END SUB

SUB updateBombs()
    DIM i AS uByte
    FOR i = 0 TO 3
        IF bombs(i, 0) <> 255 THEN
            IF bombs(i, 2) > 0 THEN
                graphicsBank(2)
                INK 6: BRIGHT 1
                PRINT AT bombs(i, 0), bombs(i, 1); "\b"
                bombs(i, 2) = bombs(i, 2) - 1
            ELSE
                PRINT AT bombs(i, 0), bombs(i, 1); " "
                drawExplosion(bombs(i, 0), bombs(i, 1))
                bombs(i, 0) = 255
                bombs(i, 1) = 255
                bombs(i, 2) = 0
                bombIsPlaced = 0
            END IF
        END IF
    NEXT i
END SUB

REM ===
REM Draw a bomb explosion
REM ===
SUB drawExplosion(y AS uByte, x AS uByte)
    graphicsBank(2)
    INK 2: BRIGHT 1
    PRINT AT y, x; "\a"
    
    DIM directions(3, 2) AS Integer
    directions(0, 0) = -1: directions(0, 1) = 0
    directions(1, 0) = 1: directions(1, 1) = 0
    directions(2, 0) = 0: directions(2, 1) = -1
    directions(3, 0) = 0: directions(3, 1) = 1

    DIM dir, stepB AS uByte
    FOR dir = 0 TO 3
        FOR stepB = 1 TO 3
            DIM newY, newX AS uByte
            newY = y + directions(dir, 0) * stepB
            newX = x + directions(dir, 1) * stepB

            REM Kill a monster if it is caught in a blast wave and award points to the player
            FOR i = 0 TO ghoulsCount - 1
                IF ghouls(i, 0) = newY AND ghouls(i, 1) = newX THEN
                    ghouls(i, 0) = 0: ghouls(i, 1) = 0
                    ghouls(i, 6) = 1
                    points = points + 150
                END IF
            NEXT i

            REM Kill a hero if he gets caught in a blast wave
            IF player(0) = newY AND player(1) = newX THEN
                isTryAgain = 1
            END IF

            IF newY >= 0 AND newY <= 23 AND newX >= 0 AND newX <= 30 THEN
                REM Remove a crystal if it gets caught in a blast wave
                IF levelData(newY, newX) = 1 THEN
                    levelData(newY, newX) = 0: levelCrystals = levelCrystals - 1
                END IF

                REM Remove the “bomb” bonus if it hits a blast wave
                IF levelData(newY, newX) = 2 THEN
                    levelData(newY, newX) = 0
                END IF

                REM Stop the propagation of the blast wave if it bumps into a wall
                IF levelData(newY, newX) > 2 THEN
                    EXIT FOR
                END IF
                INK 2: BRIGHT 1
                PRINT AT newY, newX; "\a"
            END IF
        NEXT stepB
    NEXT dir
    
    PAUSE 3

    PRINT AT y, x; " "
    FOR dir = 0 TO 3
        FOR stepB = 1 TO 3
            newY = y + directions(dir, 0) * stepB
            newX = x + directions(dir, 1) * stepB

            IF newY >= 0 AND newY <= 23 AND newX >= 0 AND newX <= 30 THEN
                REM Kill a monster if it is caught in a blast wave and award points to the player
                FOR i = 0 TO ghoulsCount - 1
                    IF ghouls(i, 0) = newY AND ghouls(i, 1) = newX THEN
                        ghouls(i, 0) = 0: ghouls(i, 1) = 0
                        ghouls(i, 6) = 1
                        points = points + 150
                    END IF
                NEXT i
                
                IF levelData(newY, newX) > 2 THEN
                    EXIT FOR
                END IF
                PRINT AT newY, newX; " "
            END IF
        NEXT stepB
    NEXT dir
END SUB