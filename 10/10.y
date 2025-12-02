%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}
%union {
  double num;
}
%token <num> NUMBER
%token PLUS MINUS MUL DIV LPAREN RPAREN
%type <num> expr term factor
%start line

%%
line: expr { 
    printf("Result: %g\n", $1); 
    return 0; 
}
;
expr: term | expr PLUS term { $$ = $1 + $3; } | expr MINUS term { $$ = $1 - $3; } ;
term: factor | term MUL factor { $$ = $1 * $3; } | term DIV factor { if ($3 == 0) yyerror("Division by Zero"); 
    else $$ = $1 / $3; } ;
factor: NUMBER | LPAREN expr RPAREN { $$ = $2; } ;
%%

void yyerror(const char *s){
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}

int main(){
    printf("Enter an expression: ");
    yyparse();
    return 0;
}