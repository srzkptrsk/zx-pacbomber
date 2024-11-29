REM This can be commented out if you don't plan to add SCREEN before loading the game
PAPER 0 : INK 0 : PRINT AT 0,0
LOAD ""SCREEN$
PAUSE 150
REM ---

REM 0 - black
REM	1 - blue
REM	2 - red
REM	3 - purple, or magenta
REM	4 - green
REM	5 - pale blue, technically called cyan
REM	6 - yellow
REM	7 - white

FUNCTION Distance(Y1 AS INTEGER, X1 AS INTEGER, Y2 AS INTEGER, X2 AS INTEGER) AS INTEGER
    RETURN ABS(ABS(Y2 - Y1) + ABS(X2 - X1))
END FUNCTION

DIM levelData(23,30) As uByte
DIM isWin, isGameOver, isTryAgain AS uByte
DIM level AS uByte
level = 1

#define LEFT  %00001000
#define RIGHT %00000001
#define UP    %00000010
#define DOWN  %00000100

DIM playerBombs, bombIsPlaced AS uByte
DIM player(2) AS uByte
DIM bombs(255, 3) AS uByte
DIM points AS UINTEGER
DIM animationFrame AS uByte
animationFrame = 0
playerBombs = 4
DIM levelCrystals AS INTEGER

DIM playerLives, isTeleported AS UBYTE
playerLives = 3
isTeleported = 0

DIM oldPlayerLives, oldPlayerBombs AS UBYTE
DIM oldPlayerPoints AS UINTEGER
oldPlayerLives = 0 : oldPlayerBombs = 0 : oldPlayerPoints = 1

REM 0: y, 1: x, 2: direction, 3: animationFrame, 4: oldY, 5: oldX, 6: isAlive, 7: isTeleported
DIM ghoulsCount AS UBYTE
DIM ghouls(6, 8) AS UBYTE

REM 0: y, 1: x, 2: direction, 3: animationFrame, 4: oldY, 5: oldX, 6: isAlive, 7: isTeleported, 8: State
DIM skullsCount AS UBYTE
DIM skulls(1, 9) AS UBYTE
DIM skullsVisited(1, 23, 30) AS UBYTE
REM 0: skulls, 1: 1: y, 2: x
DIM skullsPath(1, 30, 3) AS UBYTE

DIM changeMovementPosition(32, 2) AS UBYTE
DIM teleportPosition(2, 2) AS UBYTE
DIM levelGate(2) AS UBYTE
DIM levelExit(2) AS UBYTE

#include "./includes/helper.bas"
#include "./includes/graphics.bas"
#include "./includes/levels.bas"
#include "./includes/info.bas"
#include "./includes/player.bas"
#include "./includes/enemy_ghoul.bas"
#include "./includes/enemy_skull.bas"
#include "./includes/enemy.bas"
#include "./includes/fx.bas"

SUB getLevel(level AS uByte)
    DIM i AS uByte
    FOR i = 0 TO playerBombs
        bombs(i, 0) = 255
        bombs(i, 1) = 255
        bombs(i, 2) = 0
    NEXT i

    IF level = 1 THEN
        IF isTryAgain = 0 THEN
            levelData = level1Data
        END IF
        level1Init()

    ELSEIF level = 2 THEN
        IF isTryAgain = 0 THEN
            levelData = level2Data
        END IF
        level2Init()

    ELSEIF level = 3 THEN
        IF isTryAgain = 0 THEN
            levelData = level3Data
        END IF
        level3Init()
        
    ELSE
        IF isTryAgain = 0 THEN
            levelData = level1Data
        END IF
        level1Init()
        level = 1
    END IF

    getCrystals()

    FOR y = 0 TO 22
        FOR x = 0 TO 29
            visited(y,x) = 0
        NEXT x
    NEXT y
    
    FOR j = 19 TO 0 STEP -1
        skullsPath(0, j, 2) = 0
    NEXT j
END SUB

SUB drawLevel()
    CLS
    DIM y, x, currentChar AS uByte
    
    FOR y = 0 TO 23
        FOR x = 0 TO 30
            graphicsBank(0)
            
            currentChar = levelData(y, x)
            BRIGHT 1

            IF currentChar = 0 THEN
                CONTINUE FOR
            ELSEIF currentChar = 1 THEN
                INK 2
            ELSEIF currentChar = 2 THEN
                INK 6
                graphicsBank(2)
            ELSEIF currentChar = 17 Then
                INK 7
            ELSEIF currentChar = 18 THEN
                INK 7
            ELSE
                INK 1: BRIGHT 0
            END IF
            
            PRINT AT y, x; CHR$(143+currentChar)
        NEXT x
    NEXT y

    showPlayerAtStart(player(0), player(1))
END SUB


SUB getCrystals()
    DIM currentChar AS UBYTE
    levelCrystals = 0
    FOR y = 0 TO 23
        FOR x = 0 TO 30
            currentChar = levelData(y, x)
            IF (currentChar) = 1 THEN
                levelCrystals = levelCrystals + 1
            END IF
        NEXT x
    NEXT y
END SUB

SUB updateGame()
    isWin = 0
    isGameOver = 0
    isTryAgain = 0
    DIM lastKey AS uByte

    DO
        REM lastKey = getLastKey()
        REM IF lastKey = CODE "w" THEN
        REM     isWin = 1
        REM ELSEIF lastKey = CODE "e" THEN
        REM     isGameOver = 1
        REM ELSE
        REM END IF

        updatePlayer()
        updateEnemies()
        updateBombs()
        drawInfo()

        IF levelCrystals = 0 THEN
            levelData(levelGate(0), levelGate(1)) = 0
            PRINT AT levelGate(0), levelGate(1); " "
            levelData(levelExit(0), levelExit(1)) = 0
            PRINT AT levelExit(0), levelExit(1); " "
            graphicsBank(0): PRINT AT levelExit(0), levelExit(1); BRIGHT 1; INK 7; "\r"
        END IF

        IF playerLives = 0 THEN
            isGameOver = 1
            isTryAgain = 0
            isWin = 0
        END IF

    LOOP WHILE isWin = 0 AND isGameOver = 0 AND isTryAgain = 0
END SUB

controlsScene()

DO
    getLevel(level)
    drawLevel()
    updateGame()

    bombIsPlaced = 0

    IF isWin = 1 THEN
        CLS
        level = level + 1
        playerLives = playerLives + 1
        winScene()
        oldPlayerLives = 255 : oldPlayerBombs = 255 : oldPlayerPoints = 255
    ELSEIF isGameOver = 1 THEN
        CLS
        level = 1
        gameOverScene()
        points = 0
        playerLives = 3
        playerBombs = 5
        oldPlayerLives = 255 : oldPlayerBombs = 255 : oldPlayerPoints = 255
    ELSEIF isTryAgain = 1 THEN
        CLS
        tryAgainScene()
        playerLives = playerLives - 1
        oldPlayerLives = 255 : oldPlayerBombs = 255 : oldPlayerPoints = 255
    ELSE
        PRINT AT 0, 0; "Something wrong"
    END IF 
LOOP
