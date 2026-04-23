#define STDIO <stdio.h>
#include STDIO
/*
	Comments don't help to understand the concept they just make it more painful
*/
#define DATA "#define STDIO <stdio.h>%2$c#include STDIO%2$c%4$c*%2$c	Comments don't help to understand the concept they just make it more painful%2$c*%4$c%2$c#define DATA %3$c%s%3$c%2$c#define CODE int main() {void* fptr;fptr=fopen(%3$cGrace_kid.c%3$c,%3$cw%3$c);char *s1=DATA;fprintf(fptr,s1,s1,10,34,47);}%2$cCODE%2$c"
#define CODE int main() {void* fptr;fptr=fopen("Grace_kid.c","w");char *s1=DATA;fprintf(fptr,s1,s1,10,34,47);}
CODE
