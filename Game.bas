dim m(6, 6) as ubyte '������� ���������
dim st(6, 6) as ubyte '������� �������� (0 - �����, 1 - �������, 2 - �������)
dim d(27) as ubyte = {0, 1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 12}
dim Left as ubyte = 14
dim Top as ubyte = 1

sub Game()
	MatrixInit()
    BrickOpened(Top, Left, m(0, 0))
	for i = 1 to 5
		for j = 0 to i
			BrickClosed(Top + i * 3, Left + j * 4 - i * 2)
		next
	next
	for j = 0 to 6
		BrickOpened(Top + 18, Left + j * 4 - 12, m(6, j))
	next
	SelectBrick()	
end sub

'������������� �������
sub MatrixInit()
	'������� ������
	for i = 0 to 6
		for j = 0 to 6
			m(i, j) = 0
			st(i, j) = 0
		next
	next
	'���������� ���������� �������
	dim rx, ry as ubyte
	dim u as byte
	for i = 0 to 27
		u = 0
		do
			rx = rnd * 7
			ry = rnd * (rx + 1)
			if st(rx, ry) = 0 then
				u = 1
				m(rx, ry) = d(i)
				st(rx, ry) = 1
			end if
		loop until u
	next
	'���������� �������� ������
	st(0, 0) = 2
	for j = 0 to 6
		st(6, j) = 2
	next
end sub