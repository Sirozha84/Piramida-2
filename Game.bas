dim m(6, 6) as ubyte	'Матрица доминошек
dim st(6, 6) as ubyte	'Матрица статусов (0 - пусто, 1 - закрыто, 2 - открыто)
dim d(27) as ubyte = {0, 1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 12}
dim Left as ubyte = 14	'Координаты сдвига пирамиды на экране
dim Top as ubyte = 1
dim x, y as float		'Курсор
dim x1, y1 as ubyte		'Первый выбранный блок

'Выбор блока
function SelectBrick as ubyte
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
		if k$ = "e" then return 0: end if
	loop until k$ = " "
	return 1
end function

'Процесс игры
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
	dim ext as ubyte = 0
	dim mode as ubyte = 0
	do
		if SelectBrick() = 1 then
			print at 0, 0; x; " "; y; " - " ; st(x, y)
			if st(x, y) = 2 then
				
				beep 0.03, 30
				if mode = 0 then
					BrickSelect(Top + x * 3, Left + y * 4 - x * 2)
					x1 = x
					y1 = y
					mode = 1
				else
				
					BrickDeselect(Top + x1 * 3, Left + y1 * 4 - x1 * 2)
					mode = 0
				end if
			else
				beep 0.05, -20
				beep 0.05, -50
				beep 0.05, -20
			end if
		else
			ext = 1
		end if
	loop until ext
end sub

'Инициализация игры
sub MatrixInit()
	'Очистка матриц
	for i = 0 to 6
		for j = 0 to 6
			m(i, j) = 0
			st(i, j) = 0
		next
	next
	'Заполнение случайными блоками
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
	'Применение статосов блоков
	st(0, 0) = 2
	for j = 0 to 6
		st(6, j) = 2
	next
	'Подготовка переменных
	x = 0
	y = 0
end sub