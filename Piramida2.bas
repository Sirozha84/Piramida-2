#include <c:\Users\siroz\Projects\Piramida2\Game.bas>
#include <c:\Users\siroz\Projects\Piramida2\Fonts.bas>
#include <c:\Users\siroz\Projects\Piramida2\Subs.bas>

poke 23561,10
poke 23562,1
InitScreen()
SetFont(0)
dim k as byte = 0
do
	cls
	print at 5, 12; "piramida"
	print at 10, 13; "start"
	print at 12, 12; "rekordy"
	print at 14, 12; "prawila"
	print at 16, 11; "informaciq"
	print at 21, 5; "sergej gordeew, 2017 g."
	print at 23, 2; ink 1; "OPQA/SPACE ili strelki/ENTER"
	'border 1
	do
		print at 10 + k * 2, 10; over 1; paper 1; tab 22
		pause 0
		print at 10 + k * 2, 10; over 1; paper 0; tab 22
		beep 0.0001, 50
		key$ = inkey$
		if key$ = "q" then
			k = k - 1
			if k < 0 then k = 3: end if
		end if
		if key$ = "a" then
			k = k + 1
			if k > 3 then k = 0: end if
		end if
	loop until key$ = " " or key$ = chr(13)
	if k = 0 then
		Game()
	end if
	if k = 2 then
		for i = 10 to 23: print at i, 0;,,: next
		print at 8, 0; "dlq pobedy neobhodimo razobratx"
		print at 10, 0; "piramidu, ubiraq po dwa bloka"
		print at 12, 0; "takim obrazom, ~toby summa ih"
		print at 14, 0; "nomerow rawnqlasx 12i. blok"
		print at 16, 0; "stanowitsq dostupnym kogda"
		print at 18, 0; "oswobovdaetsq ego werhnqq ili"
		print at 20, 0; "nivnqq grani."
		print at 23, 9; ink 1; "l`baq klawi{a"
		pause 0
	end if
	if k = 3 then
		for i = 10 to 23: print at i, 0;,,: next
		print at 10, 0; "awtor: sergej gordeew, 2017 god."
		print at 12, 0; "sajt: WWW.SG-SOFTWARE.RU"
		print at 23, 9; ink 1; "l`baq klawi{a"
		pause 0
	end if
loop
'pause 0