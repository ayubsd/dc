%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUM PLUS MINUS MULT DIV LPAREN RPAREN

%left PLUS MINUS  // Lower precedence
%left MULT DIV    // Higher precedence

%%

expression : expression PLUS expression
           | expression MINUS expression
           | expression MULT expression
           | expression DIV expression
           | LPAREN expression RPAREN
           | NUM
           ;

%%

int main() {
    printf("Enter an arithmetic expression (e.g., 1 + 2 * (3 - 4)):\n");
    if (yyparse() == 0) {
        printf("Valid expression\n");
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: Invalid expression - %s\n", s);
}