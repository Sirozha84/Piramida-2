#include <c:\Users\siroz\Projects\Piramida2\Game.bas>
#include <c:\Users\siroz\Projects\Piramida2\Fonts.bas>
#include <c:\Users\siroz\Projects\Piramida2\Subs.bas>
#include <c:\Users\siroz\Projects\Piramida2\HiScores.bas>

poke 23561,10
poke 23562,1
InitTable
SetFont(0)
print at 22, 4; "navmite l`bu` klawi{u"
do
	randomize
loop until inkey$ <> ""
InitScreen
dim k as byte = 0
do
	BackGround()
	print at 11, 11; "  start  "
	print at 13, 11; " rekordy "
	print at 15, 11; " prawila "
	print at 17, 11; " ob igre "
	print at 23, 2; paper 1; ink 6; "OPQA/SPACE ili strelki/ENTER"
	do
		print at 11 + k * 2, 11; over 1; paper 1; tab 20
		pause 0
		beep 0.0001, 50
		print at 11 + k * 2, 11; over 1; paper 0; tab 20
		key$ = inkey$
		if key$ = "q" or key$ = chr(11) then
			k = k - 1
			if k < 0 then k = 3: end if
		end if
		if key$ = "a" or key$ = chr(10)then
			k = k + 1
			if k > 3 then k = 0: end if
		end if
	loop until key$ = " " or key$ = chr(13)
	beep 0.03, 50
	if k = 0 then
		'RecToTable(50)
		RecToTable(Game)
	end if
	if k = 1 then
		DrawTable(1)
		print at 23, 9; paper 1; ink 6; "l`baq klawi{a"
		pause 0
	end if
	if k = 2 then
		BackGround
		print at 7, 10; "prawila igry"
		print at 9, 1; "dlq pobedy wam nuvno razobratx"
		print at 11, 1; "piramidu, ubiraq po dwa bloka"
		print at 13, 1; "takim obrazom, ~toby summa ih"
		print at 15, 1; "nomerow rawnqlasx 12i. blok"
		print at 17, 1; "stanowitsq dostupnym kogda"
		print at 19, 1; "oswobovdaetsq ego werhnqq ili"
		print at 21, 1; "nivnqq grani."
		print at 23, 9; paper 1; ink 6; "l`baq klawi{a"
		pause 0
	end if
	if k = 3 then
		BackGround
		print at 12, 12; "ob igre"
		print at 14, 0; "awtor: sergej gordeew, 2017 god."
		print at 16, 0; "sajt: WWW.SG-SOFTWARE.RU"
		print at 23, 9; paper 1; ink 6; "l`baq klawi{a"
		pause 0
	end if
loop
pause 0