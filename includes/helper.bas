Function Fastcall get() As uByte
    Do
    Loop While inkey$ <> "" ' wait for no keypress
    Poke 23560,0
    
    Do
    Loop While peek 23560 = 0  ' wait for keypress

    Do
    Loop While inkey$ <> "" ' wait for no keypress - debounce it.
    
    Return peek 23560
End Function

Function Fastcall getLastKey() As uByte
    Return peek 23560
End Function

FUNCTION MidStr$(source$, startPos AS uByte, length AS uByte) AS String
    DIM result$ AS String
    DIM i AS uByte

    FOR i = startPos TO startPos + length - 1
        IF i > LEN(source$) THEN EXIT FOR
        result$ = result$ + source$(i)
    NEXT i

    RETURN result$
END FUNCTION