#include <c:\Users\siroz\Projects\Piramida2\Fonts.bas>
#include <c:\Users\siroz\Projects\Piramida2\Subs.bas>

poke 23561,10
poke 23562,1
InitScreen()
SetFont(0)

SetFont(1)

for i = 0 to 6
	for j = 0 to i
		brick (Top + i * 3, Left + j * 4 - i * 2)
	next
next



SelectBrick()
'pause 0