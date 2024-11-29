DIM level1Data(23,30) AS UBYTE => { _
{00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},_
{09,03,03,03,03,08,00,00,00,00,00,07,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,08},_
{00,01,01,01,01,05,03,03,03,03,03,06,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,02,04},_
{09,08,01,01,01,01,01,01,01,01,01,01,01,07,03,08,01,11,01,01,07,03,03,08,01,07,03,03,08,01,04},_
{00,04,01,07,03,03,03,10,01,09,03,08,01,04,00,04,01,04,01,01,04,01,01,04,01,04,01,01,04,01,04},_
{00,04,01,04,01,01,01,01,01,01,01,04,01,04,00,04,01,05,03,03,06,01,01,05,03,06,01,01,12,01,04},_
{00,04,01,12,01,07,10,17,09,08,01,04,01,04,00,04,01,01,01,01,01,01,01,01,01,01,01,01,01,01,04},_
{00,04,01,01,01,04,02,02,00,04,01,12,01,04,00,05,08,01,07,03,03,08,01,07,03,03,03,03,08,01,04},_
{00,04,01,11,01,04,02,02,18,04,01,01,01,04,07,03,06,01,04,00,00,04,01,04,00,00,00,00,04,01,04},_
{00,04,01,04,01,05,03,03,03,06,01,11,01,04,04,02,01,01,05,03,03,06,01,05,03,03,08,00,04,01,04},_
{07,06,01,04,01,01,01,01,01,01,01,04,01,05,06,01,11,01,01,01,01,01,01,01,01,02,04,00,04,01,04},_
{04,01,01,05,03,10,01,09,03,03,03,06,01,01,01,01,04,01,07,03,03,08,01,07,08,01,05,03,06,01,04},_
{04,01,01,01,01,01,01,01,01,01,01,01,01,07,08,01,12,01,05,03,03,06,01,05,06,01,01,01,01,01,04},_
{04,01,07,03,03,03,03,08,01,07,03,03,03,15,06,01,01,01,01,01,01,01,01,01,01,01,11,01,11,01,04},_
{04,01,04,00,00,00,00,04,01,12,01,01,01,01,01,01,11,01,07,03,03,03,08,01,07,03,06,01,12,01,04},_
{04,01,04,00,00,00,00,04,01,01,01,07,03,03,03,03,06,01,05,03,03,03,06,01,05,03,10,01,01,01,04},_
{04,01,05,03,03,03,03,06,01,09,03,06,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,11,01,04},_
{04,01,01,01,01,01,01,01,01,01,01,01,01,01,07,03,03,03,08,01,07,03,03,03,08,01,11,01,12,01,04},_
{04,01,09,03,10,01,09,03,10,01,09,03,10,01,05,03,03,03,06,01,05,03,03,03,06,01,04,01,01,01,04},_
{04,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,12,01,11,01,04},_
{04,01,07,03,03,03,08,01,07,03,08,01,07,03,08,01,09,03,03,03,03,03,03,03,08,01,01,01,04,02,04},_
{04,01,05,03,03,03,06,01,05,03,06,01,04,00,04,01,01,01,01,01,01,01,01,01,12,01,09,03,15,03,06},_
{04,02,01,01,01,01,01,01,01,01,01,01,04,00,04,01,01,07,03,03,03,03,08,01,01,00,01,01,01,01,00},_
{05,03,03,03,03,03,03,03,03,03,03,03,06,00,05,03,03,06,00,00,00,00,05,03,03,03,03,03,03,03,10}_
}

SUB level1Init()
    teleportPosition(0, 0) = 2: teleportPosition(0, 1) = 0
    teleportPosition(1, 0) = 22: teleportPosition(1, 1) = 30
    ghouls(0, 0) = 6: ghouls(0, 1) = 19: ghouls(0, 2) = 4: ghouls(0, 3) = 0: ghouls(0, 4) = 6: ghouls(0, 5) = 19: ghouls(0, 6) = 0: ghouls(0, 7) = 0
    ghouls(1, 0) = 6: ghouls(1, 1) = 26: ghouls(1, 2) = 4: ghouls(1, 3) = 0: ghouls(1, 4) = 6: ghouls(1, 5) = 26: ghouls(1, 6) = 0: ghouls(1, 7) = 0
    ghouls(2, 0) = 10: ghouls(2, 1) = 4: ghouls(2, 2) = 4: ghouls(2, 3) = 0: ghouls(2, 4) = 10: ghouls(2, 5) = 4: ghouls(2, 6) = 0: ghouls(2, 7) = 0
    ghouls(3, 0) = 14: ghouls(3, 1) = 15: ghouls(3, 2) = 4: ghouls(3, 3) = 0: ghouls(3, 4) = 14: ghouls(3, 5) = 15: ghouls(3, 6) = 0: ghouls(3, 7) = 0
    changeMovementPosition(0, 0) = 2: changeMovementPosition(0, 1) = 19
    changeMovementPosition(1, 0) = 2: changeMovementPosition(1, 1) = 24
    changeMovementPosition(2, 0) = 3: changeMovementPosition(2, 1) = 8
    changeMovementPosition(3, 0) = 5: changeMovementPosition(3, 1) = 8
    changeMovementPosition(4, 0) = 6: changeMovementPosition(4, 1) = 17
    changeMovementPosition(5, 0) = 6: changeMovementPosition(5, 1) = 22
    changeMovementPosition(6, 0) = 6: changeMovementPosition(6, 1) = 29
    changeMovementPosition(7, 0) = 7: changeMovementPosition(7, 1) = 2
    changeMovementPosition(8, 0) = 8: changeMovementPosition(8, 1) = 10
    changeMovementPosition(9, 0) = 8: changeMovementPosition(9, 1) = 12
    changeMovementPosition(10, 0) = 10: changeMovementPosition(10, 1) = 6
    changeMovementPosition(11, 0) = 11: changeMovementPosition(11, 1) = 15
    changeMovementPosition(12, 0) = 12: changeMovementPosition(12, 1) = 29
    changeMovementPosition(13, 0) = 13: changeMovementPosition(13, 1) = 17
    changeMovementPosition(14, 0) = 15: changeMovementPosition(14, 1) = 8
    changeMovementPosition(15, 0) = 15: changeMovementPosition(15, 1) = 29
    changeMovementPosition(16, 0) = 16: changeMovementPosition(16, 1) = 13
    changeMovementPosition(17, 0) = 16: changeMovementPosition(17, 1) = 27
    changeMovementPosition(18, 0) = 17: changeMovementPosition(18, 1) = 1
    changeMovementPosition(19, 0) = 17: changeMovementPosition(19, 1) = 5
    changeMovementPosition(20, 0) = 18: changeMovementPosition(20, 1) = 29
    changeMovementPosition(21, 0) = 19: changeMovementPosition(21, 1) = 9
    changeMovementPosition(22, 0) = 19: changeMovementPosition(22, 1) = 19
    changeMovementPosition(23, 0) = 20: changeMovementPosition(23, 1) = 15
    player(0) = 22: player(1) = 25: player(2) = 0
    levelGate(0) = 6: levelGate(1) = 7
    levelExit(0) = 8: levelExit(1) = 8
    ghoulsCount = 4
    skullsCount = 0
END SUB

DIM level2Data(23,30) AS UBYTE => { _
{00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},_
{07,03,03,03,03,03,03,03,03,08,07,03,03,03,03,03,03,03,03,03,08,07,03,03,03,03,03,03,03,03,08},_
{04,02,01,01,01,01,01,01,01,04,04,02,01,01,01,01,01,01,01,02,04,04,01,01,01,01,01,01,01,02,04},_
{04,01,07,03,08,01,07,08,01,04,04,01,07,08,01,11,01,07,08,01,04,04,01,07,08,01,07,03,08,01,04},_
{04,01,04,00,04,01,04,04,01,04,04,01,04,04,01,04,01,04,04,01,04,04,01,04,04,01,04,00,04,01,04},_
{04,01,04,00,04,01,04,04,01,04,04,01,04,04,01,04,01,04,04,01,04,04,01,04,04,01,04,00,04,01,04},_
{04,01,04,00,04,01,04,04,01,04,04,01,04,04,01,04,01,04,04,01,04,04,01,04,04,01,04,00,04,01,04},_
{04,01,05,03,06,01,05,06,01,04,04,01,05,06,01,12,01,05,06,01,04,04,01,05,06,01,05,03,06,01,04},_
{04,01,01,01,01,01,01,01,01,04,04,01,01,01,01,01,01,01,01,01,04,04,01,01,01,01,01,01,01,01,04},_
{05,03,03,16,10,01,09,16,03,06,05,03,03,16,10,01,09,16,03,03,06,05,03,03,16,10,01,09,16,03,06},_
{00,00,00,04,01,01,01,04,00,00,00,00,00,04,01,01,01,04,00,00,00,00,00,00,04,01,01,01,04,00,00},_
{07,03,03,15,10,01,09,15,03,03,03,03,03,15,10,01,09,15,03,03,03,03,03,03,15,10,01,09,15,03,08},_
{04,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,04},_
{04,01,09,03,10,01,09,03,10,01,09,03,10,01,09,03,10,01,09,03,10,01,09,03,10,01,09,03,10,01,04},_
{04,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,04},_
{05,03,08,01,07,03,03,03,03,08,01,09,10,01,07,03,03,03,03,03,10,01,07,03,03,08,01,09,10,01,04},_
{00,00,04,01,04,00,00,00,00,04,01,01,01,01,04,07,03,03,03,03,10,01,04,00,00,04,01,01,01,01,04},_
{00,00,04,01,04,00,00,00,00,04,01,07,03,03,06,04,01,01,01,01,01,01,05,03,03,06,01,07,08,01,04},_
{07,03,06,01,05,03,03,03,03,06,01,05,03,03,03,06,01,09,03,03,10,01,01,01,01,01,01,05,06,01,04},_
{04,02,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,07,03,03,10,01,01,01,01,04},_
{04,01,07,08,01,07,08,01,07,08,01,07,08,01,09,03,03,03,03,08,01,07,06,01,01,01,01,11,17,09,13},_
{04,01,05,06,01,05,06,01,05,06,01,05,06,01,01,01,01,01,01,12,01,12,01,01,07,03,03,13,02,00,04},_
{04,02,01,01,01,01,01,01,01,01,01,01,01,01,07,03,03,08,01,01,00,01,01,07,06,00,00,04,02,18,04},_
{05,03,03,03,03,03,03,03,03,03,03,03,03,03,06,00,00,05,03,03,03,03,03,06,00,00,00,05,03,03,06}_
}

SUB level2Init()
    teleportPosition(0, 0) = 0: teleportPosition(0, 1) = 0
    teleportPosition(1, 0) = 0: teleportPosition(1, 1) = 1
    ghouls(0, 0) = 5: ghouls(0, 1) = 5: ghouls(0, 2) = 4: ghouls(0, 3) = 0: ghouls(0, 4) = 5: ghouls(0, 5) = 5: ghouls(0, 6) = 0: ghouls(0, 7) = 0
    ghouls(1, 0) = 5: ghouls(1, 1) = 25: ghouls(1, 2) = 4: ghouls(1, 3) = 0: ghouls(1, 4) = 5: ghouls(1, 5) = 25: ghouls(1, 6) = 0: ghouls(1, 7) = 0
    ghouls(2, 0) = 8: ghouls(2, 1) = 15: ghouls(2, 2) = 4: ghouls(2, 3) = 0: ghouls(2, 4) = 8: ghouls(2, 5) = 15: ghouls(2, 6) = 0: ghouls(2, 7) = 0
    ghouls(3, 0) = 14: ghouls(3, 1) = 7: ghouls(3, 2) = 4: ghouls(3, 3) = 0: ghouls(3, 4) = 14: ghouls(3, 5) = 7: ghouls(3, 6) = 0: ghouls(3, 7) = 0
    changeMovementPosition(0, 0) = 10: changeMovementPosition(0, 1) = 5
    changeMovementPosition(1, 0) = 10: changeMovementPosition(1, 1) = 15
    changeMovementPosition(2, 0) = 10: changeMovementPosition(2, 1) = 26
    changeMovementPosition(3, 0) = 12: changeMovementPosition(3, 1) = 5
    changeMovementPosition(4, 0) = 12: changeMovementPosition(4, 1) = 9
    changeMovementPosition(5, 0) = 12: changeMovementPosition(5, 1) = 13
    changeMovementPosition(6, 0) = 12: changeMovementPosition(6, 1) = 21
    changeMovementPosition(7, 0) = 14: changeMovementPosition(7, 1) = 10
    changeMovementPosition(8, 0) = 14: changeMovementPosition(8, 1) = 17
    changeMovementPosition(9, 0) = 14: changeMovementPosition(9, 1) = 21
    changeMovementPosition(10, 0) = 14: changeMovementPosition(10, 1) = 25
    changeMovementPosition(11, 0) = 17: changeMovementPosition(11, 1) = 21
    changeMovementPosition(12, 0) = 18: changeMovementPosition(12, 1) = 26
    changeMovementPosition(13, 0) = 19: changeMovementPosition(13, 1) = 3
    changeMovementPosition(14, 0) = 19: changeMovementPosition(14, 1) = 7
    changeMovementPosition(15, 0) = 19: changeMovementPosition(15, 1) = 10
    changeMovementPosition(16, 0) = 19: changeMovementPosition(16, 1) = 16
    changeMovementPosition(17, 0) = 19: changeMovementPosition(17, 1) = 20
    changeMovementPosition(18, 0) = 21: changeMovementPosition(18, 1) = 13
    changeMovementPosition(19, 0) = 22: changeMovementPosition(19, 1) = 4
    player(0) = 22: player(1) = 20: player(2) = 0
    levelGate(0) = 20: levelGate(1) = 28
    levelExit(0) = 22: levelExit(1) = 29
    ghoulsCount = 4
    skullsCount = 0
END SUB

DIM level3Data(23,30) AS UBYTE => { _
{00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00},_
{07,03,08,00,07,03,03,03,03,03,03,03,03,03,03,03,03,03,03,16,03,03,03,03,03,03,03,03,03,03,08},_
{04,18,04,00,04,02,01,01,01,01,01,01,01,01,01,01,01,01,01,04,01,01,01,01,01,01,01,01,01,02,04},_
{04,02,04,00,04,01,07,03,03,03,08,01,07,03,03,03,08,01,09,15,03,03,03,08,01,09,03,03,03,03,13},_
{12,17,12,00,04,01,04,09,03,03,06,01,04,00,00,07,06,01,01,01,07,03,08,04,01,01,01,01,01,01,04},_
{11,01,11,00,04,01,04,01,01,01,01,01,04,00,07,06,01,01,01,01,04,01,05,06,01,01,09,03,03,03,13},_
{04,01,05,03,06,01,12,01,07,03,08,01,04,00,04,01,01,09,03,03,06,01,01,01,01,01,01,01,01,01,04},_
{04,01,01,01,01,01,01,01,04,00,04,01,04,00,04,01,01,01,01,01,01,01,07,03,03,08,01,09,03,03,13},_
{14,03,10,01,09,03,10,01,04,00,04,01,05,03,06,01,01,07,03,03,08,01,04,00,00,04,01,01,01,01,04},_
{04,01,01,01,01,01,01,01,04,00,04,01,01,01,01,01,01,04,00,00,04,01,05,03,03,06,01,01,09,03,13},_
{04,01,09,03,03,16,10,01,05,03,06,01,01,09,03,03,03,13,00,00,04,01,01,01,01,01,01,01,01,01,04},_
{04,01,01,01,01,04,01,01,01,01,01,01,01,01,01,01,01,05,03,03,15,03,10,01,07,03,03,03,08,01,04},_
{05,03,03,08,01,04,01,07,08,01,09,03,03,03,03,10,01,01,01,01,01,01,01,01,04,00,00,00,04,01,04},_
{00,00,00,04,01,12,01,04,04,01,01,01,01,01,01,01,01,01,07,03,03,03,08,01,04,00,00,00,04,01,04},_
{00,00,00,04,01,01,01,04,04,01,11,01,09,10,01,09,03,03,13,00,00,00,04,01,05,03,03,03,06,01,04},_
{09,03,03,06,01,11,01,04,04,01,04,01,01,01,01,01,01,01,04,00,00,00,04,01,01,01,01,01,01,01,04},_
{00,01,01,01,01,04,01,05,06,01,12,01,09,10,01,09,03,03,13,00,00,00,04,01,07,03,03,03,08,01,04},_
{09,03,03,08,01,04,01,01,01,01,01,01,01,01,01,01,01,01,05,03,03,03,06,01,04,00,00,00,04,01,04},_
{00,00,00,04,01,04,01,01,07,03,03,03,08,01,01,01,01,01,01,01,01,01,01,01,04,00,00,00,04,01,04},_
{00,00,07,06,01,14,10,01,05,03,03,03,06,01,09,03,03,10,01,09,03,03,10,01,05,03,03,03,06,01,04},_
{00,07,06,02,01,04,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,01,04},_
{07,06,02,01,09,15,03,10,01,07,03,03,03,03,08,01,09,03,03,10,01,09,03,03,10,01,09,03,03,03,06},_
{04,02,01,01,01,01,01,01,01,04,00,00,00,00,04,02,01,01,01,01,01,01,00,01,01,01,01,01,01,01,00},_
{05,03,03,03,03,03,03,03,03,06,00,00,00,00,05,03,03,03,03,03,03,03,03,03,03,03,03,03,03,03,10}_
}

SUB level3Init()
    teleportPosition(0, 0) = 16: teleportPosition(0, 1) = 0
    teleportPosition(1, 0) = 22: teleportPosition(1, 1) = 30
    ghouls(0, 0) = 2: ghouls(0, 1) = 22: ghouls(0, 2) = 4: ghouls(0, 3) = 0: ghouls(0, 4) = 2: ghouls(0, 5) = 22: ghouls(0, 6) = 0: ghouls(0, 7) = 0
    ghouls(1, 0) = 7: ghouls(1, 1) = 11: ghouls(1, 2) = 4: ghouls(1, 3) = 0: ghouls(1, 4) = 7: ghouls(1, 5) = 11: ghouls(1, 6) = 0: ghouls(1, 7) = 0
    ghouls(2, 0) = 11: ghouls(2, 1) = 6: ghouls(2, 2) = 4: ghouls(2, 3) = 0: ghouls(2, 4) = 11: ghouls(2, 5) = 6: ghouls(2, 6) = 0: ghouls(2, 7) = 0
    ghouls(3, 0) = 11: ghouls(3, 1) = 16: ghouls(3, 2) = 4: ghouls(3, 3) = 0: ghouls(3, 4) = 11: ghouls(3, 5) = 16: ghouls(3, 6) = 0: ghouls(3, 7) = 0
    skulls(0, 0) = 7: skulls(0, 1) = 1: skulls(0, 2) = 4: skulls(0, 3) = 0: skulls(0, 4) = 7: skulls(0, 5) = 1: skulls(0, 6) = 0: skulls(0, 7) = 0
    changeMovementPosition(0, 0) = 2: changeMovementPosition(0, 1) = 11
    changeMovementPosition(1, 0) = 2: changeMovementPosition(1, 1) = 17
    changeMovementPosition(2, 0) = 4: changeMovementPosition(2, 1) = 24
    changeMovementPosition(3, 0) = 6: changeMovementPosition(3, 1) = 24
    changeMovementPosition(4, 0) = 7: changeMovementPosition(4, 1) = 5
    changeMovementPosition(5, 0) = 7: changeMovementPosition(5, 1) = 17
    changeMovementPosition(6, 0) = 8: changeMovementPosition(6, 1) = 7
    changeMovementPosition(7, 0) = 9: changeMovementPosition(7, 1) = 11
    changeMovementPosition(8, 0) = 10: changeMovementPosition(8, 1) = 1
    changeMovementPosition(9, 0) = 10: changeMovementPosition(9, 1) = 23
    changeMovementPosition(10, 0) = 13: changeMovementPosition(10, 1) = 11
    changeMovementPosition(11, 0) = 14: changeMovementPosition(11, 1) = 4
    changeMovementPosition(12, 0) = 14: changeMovementPosition(12, 1) = 6
    changeMovementPosition(13, 0) = 15: changeMovementPosition(13, 1) = 23
    changeMovementPosition(14, 0) = 15: changeMovementPosition(14, 1) = 29
    changeMovementPosition(15, 0) = 16: changeMovementPosition(15, 1) = 4
    changeMovementPosition(16, 0) = 17: changeMovementPosition(16, 1) = 9
    changeMovementPosition(17, 0) = 17: changeMovementPosition(17, 1) = 14
    changeMovementPosition(18, 0) = 18: changeMovementPosition(18, 1) = 18
    changeMovementPosition(19, 0) = 20: changeMovementPosition(19, 1) = 8
    changeMovementPosition(20, 0) = 20: changeMovementPosition(20, 1) = 15
    changeMovementPosition(21, 0) = 20: changeMovementPosition(21, 1) = 20
    changeMovementPosition(22, 0) = 20: changeMovementPosition(22, 1) = 25
    changeMovementPosition(23, 0) = 22: changeMovementPosition(23, 1) = 3
    changeMovementPosition(24, 0) = 22: changeMovementPosition(24, 1) = 20
    changeMovementPosition(25, 0) = 22: changeMovementPosition(25, 1) = 25
    player(0) = 22: player(1) = 22: player(2) = 0
    levelGate(0) = 4: levelGate(1) = 1
    levelExit(0) = 2: levelExit(1) = 1
    ghoulsCount = 4
    skullsCount = 1
END SUB
