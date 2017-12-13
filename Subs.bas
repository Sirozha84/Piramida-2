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

dim Left as ubyte = 14
dim Top as ubyte = 1
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
		if k$ = "q" and x>0 then
			if (x - 1) / 2 <> int ((x - 1) / 2) then
				y = y - 1
			end if
			x = x - 1
		end if
		if k$ = "a" and x<6 then
			if (x + 1) / 2 = int ((x + 1) / 2) then
				y = y + 1
			end if
			x = x + 1
		end if
		if k$ = "o" and y>0 then
			y = y - 1
		end if
		if k$ = "p" and y<6 then
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

sub brick (x as integer, y as integer)
	print at x, y; "!""""#"
	print at x + 1, y;  "ABBC"
	print at x + 2, y;  "abbc"
end sub

sub BrickCursor(x as integer, y as integer, p as ubyte)
	print at x, y; over 1; paper p; "    "
	print at x + 1, y; over 1; paper p; "    "
	print at x + 2, y; over 1; paper p; "    "
end sub