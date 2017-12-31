dim m(6, 6) as ubyte	'Матрица доминошек
dim st(6, 6) as ubyte	'Матрица статусов (0 - пусто, 1 - закрыто, 2 - открыто)
dim d(27) as ubyte = {0, 1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 12}
dim Left as ubyte = 14	'Координаты сдвига пирамиды на экране
dim Top as ubyte = 2
dim x, y as float		'Курсор
dim x1, y1 as ubyte		'Первый выбранный блок
dim Level, Lives, Score, Mult as integer	'Всякие игровые переменные

'Вычисление строчки на экране по номеру ячейки
function SX(x as ubyte) as ubyte
	return Top + x * 3
end function

'Вычисление столбца на экране по номеру ячейки
function SY(x as ubyte, y as ubyte) as ubyte
	return Left + y * 4 - x * 2
end function

'Выбор блока
function SelectBrick as ubyte
    do
		BrickCursor (SX(x), SY(x, y), 1)
		pause 0
		beep 0.0001, 50
		BrickCursor (SX(x), SY(x, y), 0)
		k$ = inkey$
		'Управление курсором
		if (k$ = "q" or k$ = chr(11)) and x > 0 then
			x = x - 1
			if x / 2 <> int (x / 2) then
				y = y - 1
			end if
		end if
		if (k$ = "a" or k$ = chr(10)) and x < 6 then
			x = x + 1
			if x / 2 = int (x / 2) then
				y = y + 1
			end if
		end if
		if (k$ = "o" or k$ = chr(8)) and y > 0 then
			y = y - 1
		end if
		if (k$ = "p" or k$ = chr(9)) and y < 6 then
			y = y + 1
		end if
		'Корректировка позиции
		if y < 0 then
			y = 0
		end if
		if y > x then
			y = x
		end if
		if k$ = "e" then return 0: end if
	loop until k$ = " " or k$ = chr(13)
	return 1
end function

'Процесс игры
function Piramida() as ubyte
	dim win as byte = 0
	MatrixInit()
    BrickOpened(Top, Left, m(0, 0))
	for i = 1 to 5
		for j = 0 to i
			BrickClosed(SX(i), SY(i, j))
		next
	next
	for j = 0 to 6
		BrickOpened(SX(6), SY(6, j), m(6, j))
	next
	dim ext as ubyte = 0
	dim mode as ubyte = 0
	do
		if SelectBrick() = 1 then
			if st(x, y) = 2 then
				beep 0.03, 50
				if mode = 0 then
					'Выбор первого блока
					BrickSelect(SX(x), SY(x, y))
					x1 = x
					y1 = y
					mode = 1
				else
					'Выбор второго блока
					BrickDeselect(SX(x1), SY(x1, y1))
					mode = 0
					if m(x, y) + m(x1, y1) = 12 and (x <> x1 or y <> y1) then
						Score = Score + Level * 12
						print at 0,10; Score
						DestroyBricks(SX(x1), SY(x1, y1), SX(x), SY(x, y))
						st(x1, y1) = 0
						st(x, y) = 0
						CheckOpen()
						win = 1
						for i = 0 to 6
							for j = 0 to i
								if st(i, j) <> 0 then win = 0: end if
							next
						next
					else
						ErrorSound()
					end if
				end if
			else
				ErrorSound()
			end if
		else
			ext = 1
		end if
	loop until ext or win
	return win
end function

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

'Проверка на открытые блоки
sub CheckOpen()
	dim o as byte
	for i = 1 to 5
		for j = 0 to i
			if st(i, j) = 1 then
				o = 0
				if j = 0 then
					if st(i - 1, j) = 0 then o = 1: end if
				else
					if st(i - 1, j - 1) = 0 and st(i - 1, j) = 0 then o = 1: end if
				end if
				if st(i + 1, j) = 0 and st(i + 1, j + 1) = 0 then o = 1: end if
				if o then
					st(i, j) = 2
					OpenBrick(SX(i), SY(i, j))
					BrickOpened(SX(i), SY(i, j), m(i, j))
				end if
			end if
		next
	next
end sub

'Сеанс игры
function Game() as integer
	Level = 1
	Lives = 3
	Score = 0
	do
		SetFont (0)
		cls
		print at 12, 11; "urowenx: "; Level
		print at 0, 20; ink 1; "E - pas"
		SetFont (1)
		if Lives < 4 then
			for i = 0 to Lives - 1
				print at 0, i; ink 2; "@"
			next
		else
			print at 0, 0; ink 2; "@"; ink 7; "`"; Lives
		end if
		print at 0, 10; Score
		pause 50
		'Вызываем решение пирамиды и проверяем результат игры
		if Piramida = 1 then
			SetFont (0)
			for i = 0 to 7
				print at 12, 13; ink i; "pobeda!"
				for j = 0 to 36 step 12
					beep 0.03, i + j
				next
			next
			Lives = Lives + 1
			Level = Level + 1
		else
			SetFont (0)
			for i = 7 to 0 step -1
				print at 12, 11; ink 8 - i; "poravenie!"
				for j = 0 to 36 step 12
					beep 0.03, i + j
				next
			next		
			Lives = Lives - 1
		end if
	loop until Lives = 0
	return Score
end function