%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

%token A B

%%

start: S ;

S: A B      /* For n=1: "ab" */
 | A S B    /* Recursive: adds another a...b pair */
 ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}

int main() {
    if (yyparse() == 0) {
        printf("String Recognized\n");
    }
    return 0;
}