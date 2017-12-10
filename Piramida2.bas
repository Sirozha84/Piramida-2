#include <c:\Users\siroz\Documents\GitHub\Piramida-2\Fonts.bas>
#include <c:\Users\siroz\Documents\GitHub\Piramida-2\Subs.bas>

InitScreen()
SetFont(0)
SetFont(1)

for x = 0 to 6
	for y = 0 to x
		brick (1 + x * 3, 14 + y * 4 - x * 2)
	next
next
pause 0

sub brick (x as integer, y as integer)
	print at x, y; "!""""#"
	print at x + 1, y;  "ABBC"
	print at x + 2, y;  "abbc"
end sub