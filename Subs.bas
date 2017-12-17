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

'Рисование закрытого блока
sub BrickClosed(x, y as ubyte)
	print at x, y; ink 2; "!""""#"; at x + 1, y;  "ABBC"; at x + 2, y;  "abbc"
end sub

'Рисование открытого блока
sub BrickOpened(x, y, i as ubyte)
	print at x, y; ink 3; "$%%&"; at x + 1, y; "D  F"; at x + 2, y; "deef"
	print at x + 1, y + 1; ink 5; i
end sub

'Рисование/стирание курсора
sub BrickCursor(x, y, p as ubyte)
	print at x, y; over 1; ink 8; paper p; "    "; at x + 1, y; "    "; at x + 2, y; "    "
end sub

'Выделение блока
sub BrickSelect(x, y as ubyte)
	print at x, y; over 1; ink 4; "    "; at x + 1, y; " "; at x + 1, y + 3; " "; at x + 2, y; "    "
end sub

'Снятие выделения
sub BrickDeselect(x, y as ubyte)
	print at x, y; over 1; ink 3; "    "; at x + 1, y; " "; at x + 1, y + 3; " "; at x + 2, y; "    "
end sub

'Уничтожение блоков
sub DestroyBricks(x1, y1, x2, y2 as ubyte)
	print at x1, y1; "BBBB"; at x1 + 1, y1; "BBBB"; at x1 + 2, y1; "BBBB"
	print at x2, y2; "BBBB"; at x2 + 1, y2; "BBBB"; at x2 + 2, y2; "BBBB"
	for i = 50 to 0 step -5
		beep 0.003, i
	next
	print at x1, y1; "    "; at x1 + 1, y1; "    "; at x1 + 2, y1; "    "
	print at x2, y2; "    "; at x2 + 1, y2; "    "; at x2 + 2, y2; "    "
end sub

'Звук ошибки
sub ErrorSound()
	beep 0.05, -20
	beep 0.05, -50
	beep 0.05, -20
end sub