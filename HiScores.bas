dim Names(12) as string
dim Scores(12) as integer

'Инициализация таблицы
sub InitTable()
	for i = 0 to 11
		Names(i) = ".........."
		Names(i)= str(i+100)+"......."
		Scores(i)=100-i*8
	next
end sub

'Вывод таблицы
sub DrawTable()
	print at 7, 12; "rekordy"
	for i = 0 to 11
		print at 9 + i, 8 - (i + 1) / 10; i + 1; "."; Names(i); "."; Scores(i)
	next
end sub

'Запись рекорда в таблицу (если он является рекордом)
sub RecToTable(sc as integer)
	for i = 0 to 11
		if sc > Scores(i) then
			'Сдвигаем остальные записи вниз
			for j = 11 to i + 1 step -1
				Names(j) = Names(j - 1)
				Scores(j) = Scores(j - 1)
			next
			Names(i) = "          "
			Scores(i) = sc
			DrawTable
			print at 23, 0; paper 1; ink 6; "wwedite swoe imq i navmite ENTER"
			EnterName(i)
			DrawTable
			print at 23, 0; paper 1; ink 6; "         l`baq klawi{a          "
			pause 0
			
			exit for
		end if
	next
end sub

'Ввод имени
function EnterName(n as ubyte) as string
	dim x as byte = n + 9
	dim y as byte = 0
	dim b(10) as byte
	dim name as string
	do
		do
			print at x, 10 + y; flash 1; over 1; " "
			pause 0
			print at x, 10 + y; flash 0; over 1; " "
			k$ = inkey$
		loop until k$ <> ""
		'print at 0,0; code (k$)
		beep 0.001,50
		'Всякие дебильные буквы, которые не помещаюся на английской раскладке
		if k$ = chr(226) then k$ = "~": end if
		if k$ = chr(195) then k$ = chr(127): end if
		if k$ = chr(205) then k$ = "|": end if
		if k$ = chr(204) then k$ = "{": end if
		if k$ = chr(203) then k$ = "}": end if
		'Печатаем
		if k$ >=  " " and y < 10 then
			b(y) = code(k$)
			print at x, 10 + y; k$
			y = y + 1
		end if
		'Стираем
		if k$ = chr(12) and y > 0 then
			y = y - 1
			print at x, 10 + y; " "
		end if	
	loop until k$ = chr(13)
	for i = 0 to 9
		if i < y then
			name = name + chr(b(i))
		else
			name = name + "."
		end if
	next
	Names(n) = name
end function