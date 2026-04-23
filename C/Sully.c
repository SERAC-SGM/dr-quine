#include <stdio.h>
#include <stdlib.h>
int main(){
	int i=5;
	if (i<0){return 0;}
	char filename[64];
	char cmd[64];
	void *file;
	snprintf(filename, sizeof(filename), "Sully_%d.c", i);
	file=fopen(filename, "w");
	char *s="#include <stdio.h>%2$c#include <stdlib.h>%2$cint main(){%2$c	int i=%4$d;%2$c	if (i<0){return 0;}%2$c	char filename[64];%2$c	char cmd[64];%2$c	void *file;%2$c	snprintf(filename, sizeof(filename), %3$cSully_%%d.c%3$c, i);%2$c	file=fopen(filename, %3$cw%3$c);%2$c	char *s=%3$c%1$s%3$c;%2$c	fprintf(file,s,s,10,34,i);%2$c	fclose(file);%2$c	snprintf(cmd, sizeof(cmd), %3$cgcc %%s -o Sully_%%d%3$c, filename, i);%2$c	system(cmd);%2$c	snprintf(cmd, sizeof(cmd), %3$c./Sully_%%d%3$c, i);%2$c	system(cmd);}%2$c";
	fprintf(file,s,s,10,34,i);
	fclose(file);
	snprintf(cmd, sizeof(cmd), "gcc %s -o Sully_%d", filename, i);
	system(cmd);
	snprintf(cmd, sizeof(cmd), "./Sully_%d", i);
	system(cmd);}
