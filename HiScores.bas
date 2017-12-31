dim Names(12) as string
dim Scores(12) as integer

'Инициализация таблицы
sub InitTable()
	for i = 0 to 11
		Names(i) = ".........."
	next
end sub

'Вывод таблицы
sub DrawTable(b as byte)
	if b then
		BackGround
	end if
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
			DrawTable(1)
			print at 23, 0; paper 1; ink 6; "wwedite swoe imq i navmite ENTER"
			EnterName(i)
			DrawTable(0)
			print at 23, 0; paper 1; ink 6; "         l`baq klawi{a          "
			pause 0
			exit for
		end if
	next
end sub

'Ввод имени
sub EnterName(n as ubyte)
	dim x as byte = n + 9
	dim k as byte = 0
	dim b(10) as byte
	dim name as string
	do
		do
			print at x, 10 + k; flash 1; over 1; " "
			pause 0
			print at x, 10 + k; flash 0; over 1; " "
			key$ = inkey$
		loop until key$ <> ""
		'print at 0,0; code (k$)
		beep 0.0001, 50
		'Всякие дебильные буквы, которые не помещаюся на английской раскладке
		if key$ = chr(226) then key$ = "~": end if
		if key$ = chr(195) then key$ = chr(127): end if
		if key$ = chr(205) then key$ = "|": end if
		if key$ = chr(204) then key$ = "{": end if
		if key$ = chr(203) then key$ = "}": end if
		'Печатаем
		if key$ >=  " " and k < 10 then
			b(k) = code(key$)
			print at x, 10 + k; key$
			k = k + 1
		end if
		'Стираем
		if key$ = chr(12) and k > 0 then
			k = k - 1
			print at x, 10 + k; " "
		end if	
	loop until key$ = chr(13)
	beep 0.03, 50
	for i = 0 to 9
		if i < k then
			name = name + chr(b(i))
		else
			name = name + "."
		end if
	next
	Names(n) = name
end sub