#include <stdio.h>
/*
	comment1
*/
void print(char *s) {
	printf(s, 10, 47, 10, 10, 47, 10, 10, 10, 10, 10, 47, 10, 10, 47, 10, 34, s, 34, 10, 10, 10, 10);
}
int main(void) {
/*
	comment2
*/
	char *s = "#include <stdio.h>%c%c*%c	comment1%c*%c%cvoid print(char *s) {%c	printf(s, 10, 47, 10, 10, 47, 10, 10, 10, 10, 10, 47, 10, 10, 47, 10, 34, s, 34, 10, 10, 10, 10);%c}%cint main(void) {%c%c*%c	comment2%c*%c%c	char *s = %c%s%c;%c	print(s);%c	return (0);%c}%c";
	print(s);
	return (0);
}
