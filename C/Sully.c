#include <stdio.h>
#include <stdlib.h>
int main(){
int i=5;
if (i<=0){return 0;}
#ifdef DECREASE
i--;
#endif
char filename[64];
char cmd[128];
void *file;
snprintf(filename, sizeof(filename), "Sully_%d.c", i);
file=fopen(filename, "w");
char *s="#include <stdio.h>%2$c#include <stdlib.h>%2$cint main(){%2$cint i=%4$d;%2$cif (i<=0){return 0;}%2$c#ifdef DECREASE%2$ci--;%2$c#endif%2$cchar filename[64];%2$cchar cmd[128];%2$cvoid *file;%2$csnprintf(filename, sizeof(filename), %3$cSully_%%d.c%3$c, i);%2$cfile=fopen(filename, %3$cw%3$c);%2$c	char *s=%3$c%1$s%3$c;%2$cfprintf(file,s,s,10,34,i);%2$c	fclose(file);%2$csnprintf(cmd, sizeof(cmd), %3$cgcc -D DECREASE %%s -o Sully_%%d%3$c, filename, i);%2$csystem(cmd);%2$csnprintf(cmd, sizeof(cmd), %3$c./Sully_%%d%3$c, i);%2$csystem(cmd);}%2$c";
fprintf(file,s,s,10,34,i);
fclose(file);
snprintf(cmd, sizeof(cmd), "gcc -D DECREASE %s -o Sully_%d", filename, i);
system(cmd);
snprintf(cmd, sizeof(cmd), "./Sully_%d", i);
system(cmd);}
