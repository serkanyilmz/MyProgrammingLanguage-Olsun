%{ 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int yylex(void); 
void yyerror(){
	printf("syntax error\n");
	exit(1);
}

 
%}

%start program
%token NUMBER VARIABLE
%token ADD SUBTRACT MULTIPLY DIVIDE 
%token AND OR 
%token TRUEVAL FALSEVAL
%token ISEQUAL ISNOTEQUAL LESSTHAN GREATERTHAN
%token ASSIGN IF WHILE FOR PRINT
%token STARTPAR ENDPAR STARTBLOCK ENDBLOCK ENDCOMMAND FINISH 

%left ADD SUBTRACT MULTIPLY DIVIDE 
%left AND OR
%left LESSTHAN GREATERTHAN ISEQUAL ISNOTEQUAL
%right ASSIGN


%% 
 
program : statements FINISH; 
 
statements: statement | statement statements; 
 
statement :VARIABLE A ASSIGN ENDCOMMAND
	  |D PRINT ENDCOMMAND
	  |LOGIC IF STARTBLOCK statements ENDBLOCK
	  |LOGIC IF statement
	  |LOGIC WHILE STARTBLOCK statements ENDBLOCK
          |LOGIC WHILE statement
	  |NUMBER FOR STARTBLOCK statements ENDBLOCK
          |NUMBER FOR statement;       

A :A SUBTRACT B
  |A ADD B
  |B;
 
B :B DIVIDE D
  |B MULTIPLY D
  |D;
  
D :STARTPAR A ENDPAR
  |NUMBER
  |VARIABLE;	
  
LOGIC :TRUEVAL|FALSEVAL
      |LOGIC AND LOGIC 
      |LOGIC OR LOGIC 
      |comparison;
 
comparison :D LESSTHAN A 
           |D GREATERTHAN A 
           |D ISEQUAL A 
           |D ISNOTEQUAL A 
           |F;

F :STARTPAR LOGIC ENDPAR; 

%% 


 
int main() 
{ 
 yyparse(); 
 printf("OK\n"); 
 return 0; 
}
