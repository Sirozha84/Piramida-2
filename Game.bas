dim m(6, 6) as ubyte 'Матрица доминошек
dim st(6, 6) as ubyte 'Матрица статусов (0 - пусто, 1 - закрыто, 2 - открыто)
dim d(27) as ubyte = {0, 1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 12}
dim Left as ubyte = 14
dim Top as ubyte = 1

sub Game()
	MatrixInit()

	for i = 0 to 6
		for j = 0 to i
			brick (Top + i * 3, Left + j * 4 - i * 2)
		next
	next
	SelectBrick()
end sub

'Инициализация матрицы
sub MatrixInit()
	dim m(7, 7) as ubyte
	dim st(7, 7) as ubyte
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
end sub