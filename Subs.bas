'���������� ������
Sub InitScreen()
	ink 7
	paper 0
	flash 0
	bright 0
	over 0
	border 0
	cls
End Sub

'��������� ��������� �����
sub BrickClosed(x as ubyte, y as ubyte)
	print at x, y; ink 2; "!""""#"; at x + 1, y;  "ABBC"; at x + 2, y;  "abbc"
end sub

'��������� ��������� �����
sub BrickOpened(x as ubyte, y as ubyte, i as ubyte)
	print at x, y; ink 3; "$%%&"; at x + 1, y; "D  F"; at x + 2, y; "deef"
	print at x + 1, y + 1; ink 5; i
end sub

'���������/�������� �������
sub BrickCursor(x as ubyte, y as ubyte, p as ubyte)
	print at x, y; over 1; ink 8; paper p; "    "; at x + 1, y; "    "; at x + 2, y; "    "
end sub

'��������� �����
sub BrickSelect(x as ubyte, y as ubyte)
	print at x, y; over 1; ink 4; "    "; at x + 1, y; " "; at x + 1, y + 3; " "; at x + 2, y; "    "
end sub

'������ ���������
sub BrickDeselect(x as ubyte, y as ubyte)
	print at x, y; over 1; ink 3; "    "; at x + 1, y; " "; at x + 1, y + 3; " "; at x + 2, y; "    "
end sub
