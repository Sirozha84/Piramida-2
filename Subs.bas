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
dim x as ubyte = 0
dim y as ubyte = 0

sub SelectBrick()
	BrickCursor (Top + x * 3, Left + y * 4 - x * 2, 1)
	SetFont(0)
    do
		k$ = inkey$
	loop until k$ <> ""
	print k$
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