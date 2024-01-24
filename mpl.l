%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"{"		{return STARTBLOCK;}
"}"		{return ENDBLOCK;}
"("		{return STARTPAR;}
")"		{return ENDPAR;}

"+"		{return ADD;}
"-"		{return SUBTRACT;}
"*"		{return MULTIPLY;}
"/"		{return DIVIDE;}

","		{return ENDCOMMAND;}
"bitir."	{return FINISH;}

"olsun"		{return ASSIGN;}
"yaz"		{return PRINT;}

"iken"		{return WHILE;}
"kere"		{return FOR;}
"ise"		{return IF;}

"dogru"		{return TRUEVAL;}
"yanlis"	{return FALSEVAL;}

"ve"		{return AND;}
"veya"		{return OR;}
"=="		{return ISEQUAL;}
"!="		{return ISNOTEQUAL;}
"<"		{return LESSTHAN;}
">"		{return GREATERTHAN;}

[a-zA-Z][_a-zA-z0-9]*		{return VARIABLE;}
[1-9][0-9]*		{return NUMBER;}
[ \t\n]	;
.		{printf("syntax error \n"); exit(1);}
%%

