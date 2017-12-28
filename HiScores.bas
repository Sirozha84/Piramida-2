dim Names(12) as string
dim Scores(12) as integer


sub InitTable()
	for i = 0 to 11
		Names(i) = ".........."
	next
	Names(0)="sergej...."
	Scores(0)=100
end sub

'Вывод таблицы
sub DrawTable()
	print at 7, 12; "rekordy"
	for i = 0 to 11
		print at 9 + i, 8 - (i + 1) / 10; i + 1; "."; Names(i); "."; Scores(i)
	next
end sub