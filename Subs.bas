'Подготовка экрана
Sub InitScreen()
	ink 7
	paper 0
	flash 0
	bright 0
	over 0
	border 0
	cls
End Sub

dim x as float = 0
dim y as float = 0

sub SelectBrick()

	SetFont(0)
    do
		BrickCursor (Top + x * 3, Left + y * 4 - x * 2, 1)
		pause 0
		k$ = inkey$
		BrickCursor (Top + x * 3, Left + y * 4 - x * 2, 0)
		'Управление курсором
		if k$ = "q" and x > 0 then
			x = x - 1
			if x / 2 <> int (x / 2) then
				y = y - 1
			end if
		end if
		if k$ = "a" and x < 6 then
			x = x + 1
			if x / 2 = int (x / 2) then
				y = y + 1
			end if
		end if
		if k$ = "o" and y > 0 then
			y = y - 1
		end if
		if k$ = "p" and y < 6 then
			y = y + 1
		end if
		'Корректировка позиции
		if y < 0 then
			y = 0
		end if
		if y > x then
			y = x
		end if
		beep 0.005, 50
	loop until k$ = " "
	print "END"
end sub

'Рисование закрытого блока
sub BrickClosed(x as ubyte, y as ubyte)
	print at x, y; ink 2; "!""""#"; at x + 1, y;  "ABBC"; at x + 2, y;  "abbc"
end sub

'Рисование открытого блока
sub BrickOpened(x as ubyte, y as ubyte, i as ubyte)
	print at x, y; ink 3; "$%%&"; at x + 1, y; "D  F"; at x + 2, y; "deef"
	print at x + 1, y + 1; ink 5; i
end sub

sub BrickCursor(x as ubyte, y as ubyte, p as ubyte)
	print at x, y; over 1; ink 8; paper p; "    "; at x + 1, y; "    "; at x + 2, y; "    "
end sub