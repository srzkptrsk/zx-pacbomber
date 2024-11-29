DIM visited(23, 30) AS UBYTE
DIM queue_x(1000) AS UBYTE
DIM queue_y(1000) AS UBYTE
DIM parent_x(23, 30) AS UBYTE
DIM parent_y(23, 30) AS UBYTE
DIM path_x(1000) AS UBYTE
DIM path_y(1000) AS UBYTE

FUNCTION is_valid(x AS UBYTE, y AS UBYTE) AS UBYTE
    IF y >= 0 AND y < 23 AND x >= 0 AND x < 30 THEN
        REM PRINT AT y, x; "*"
        IF levelData(y, x) < 3 AND visited(y, x) = 0 THEN
            RETURN 1
        END IF
    END IF
    RETURN 0
END FUNCTION

DIM FOUND AS UBYTE

SUB FindPath(start_y,start_x,end_y,end_x)
    FOR y = 0 TO 22
        FOR x = 0 TO 29
            visited(y,x) = 0
        NEXT x
    NEXT y

    ' Напрамкі руху: [верх, ніз, лева, права]
    DIM dir_x(4) AS UBYTE
    DIM dir_y(4) AS UBYTE
    dir_x(0) = 0: dir_y(0) = -1 ' Верх
    dir_x(1) = 0: dir_y(1) = 1  ' Ніз
    dir_x(2) = -1: dir_y(2) = 0 ' Лева
    dir_x(3) = 1: dir_y(3) = 0  ' Права

    queue_start = 0
    queue_end = 0

    queue_x(queue_end) = start_x
    queue_y(queue_end) = start_y
    queue_end = queue_end + 1

    visited(start_y, start_x) = 1
    parent_x(start_y, start_x) = 255 ' Няма бацькі
    parent_y(start_y, start_x) = 255 ' Няма бацькі

    FOUND = 0

    WHILE queue_start < queue_end AND FOUND = 0
        curr_x = queue_x(queue_start)
        curr_y = queue_y(queue_start)
        queue_start = queue_start + 1
        
        ' Правяраем суседнія вузлы
        FOR i = 0 TO 3
            new_x = curr_x + dir_x(i)
            new_y = curr_y + dir_y(i)
            
            IF is_valid(new_x, new_y) THEN
                visited(new_y, new_x) = 1
                queue_x(queue_end) = new_x
                queue_y(queue_end) = new_y
                queue_end = queue_end + 1
                
                ' Захоўваем бацькоўскую кропку
                parent_x(new_y, new_x) = curr_x
                parent_y(new_y, new_x) = curr_y
                
                ' Калі дасягнуты канец
                IF new_x = end_x AND new_y = end_y THEN
                    FOUND = 1
                    EXIT FOR
                END IF
            END IF
        NEXT i
    WEND


    ' Вынік
    IF FOUND = 1 THEN
        REM PRINT "Path findet!"
        
        ' Захаванне канчатковага шляху
        path_length = 0
        curr_x = end_x
        curr_y = end_y
        
        WHILE curr_x <> 255 AND curr_y <> 255
            path_x(path_length) = curr_x
            path_y(path_length) = curr_y
            path_length = path_length + 1
            temp_x = parent_x(curr_y, curr_x)
            curr_y = parent_y(curr_y, curr_x)
            curr_x = temp_x
        WEND
        
        ' Вывад шляху
        REM PRINT "Finish path:"
        FOR i = path_length - 1 TO 0 STEP -1
            IF path_y(i) = 0 AND path_x(i) = 0 THEN
                EXIT FOR
            END IF
            REM graphicsBank(2): PRINT AT path_y(i), path_x(i); INK 7; "\k"
            skullsPath(0, i, 0) = path_y(i)
            skullsPath(0, i, 1) = path_x(i)
            skullsPath(0, i, 2) = 1
            REM PRINT "SKULL PATH ("; skullsPath(0, i, 0); ", "; skullsPath(0, i, 1); ")"
            REM PRINT i
            REM get()
        NEXT i

        REM FOR i = 0 TO 20
            REM PRINT "SKULL PATH ("; skullsPath(0, i, 0); ", "; skullsPath(0, i, 1); ")"
        REM NEXT i
        REM get()
        RETURN
    END IF
END SUB


SUB updateSkulls()
    DIM dirs, vector, newVector, currentChar AS UBYTE
    IF skullsCount = 0 THEN
        RETURN
    END IF
    
    FOR i = 0 TO skullsCount - 1
        IF skulls(i, 6) = 1 THEN
            skulls(i, 0) = 0: skulls(i, 1) = 0
            CONTINUE FOR
        END IF

        REM skulls(i, 4) = skulls(i, 0)
        REM skulls(i, 5) = skulls(i, 1)

        graphicsBank(2)

        DIM currentFrame AS String
        IF skulls(i, 3) = 0 THEN
            currentFrame = "\j"
        ELSE
            currentFrame = "\k"
        END IF
        skulls(i, 3) = (skulls(i, 3) + 1) MOD 2

        IF skulls(i, 8) = 0 AND Distance(skulls(i, 0), skulls(i, 1), player(0), player(1)) < 4 THEN
            skulls(i, 8) = 1
            FindPath(skulls(i, 0), skulls(i, 1), player(0), player(1))
        END IF

        IF skulls(i, 8) = 1 THEN
            FOR j = 19 TO 0 STEP -1
                IF skullsPath(i, j, 2) = 1 THEN
                    skulls(i, 4) = skulls(i, 0)
                    skulls(i, 5) = skulls(i, 1)

                    PRINT AT skulls(i, 0), skulls(i, 1); " "

                    skulls(i, 0) = skullsPath(i, j, 0)
                    skulls(i, 1) = skullsPath(i, j, 1)

                    skullsPath(i, j, 2) = 0
                    REM PRINT "SKULL PATH ("; skullsPath(i, j, 0); ", "; skullsPath(i, j, 1); ")"
                    REM get()
                    IF j = 0 THEN
                        skulls(i, 8) = 0
                    END IF
                    EXIT FOR
                END IF
            NEXT j
        END IF

        IF skulls(i, 0) = player(0) AND skulls(i, 1) = player(1) AND isTryAgain = 0 THEN
            isTryAgain = 1
            PAUSE 5
        END IF

        IF levelData(skulls(i, 4), skulls(i, 5)) = 1 OR levelData(skulls(i, 4), skulls(i, 5)) = 2 THEN
            graphicsBank(0)
            currentChar = levelData(skulls(i, 4), skulls(i, 5))
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
                PRINT AT skulls(i, 4), skulls(i, 5); CHR$(143+currentChar)
        END IF

        graphicsBank(2): PRINT AT skulls(i, 0), skulls(i, 1); INK 7; currentFrame

    NEXT i
END SUB