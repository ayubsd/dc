%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token LETTER DIGIT

%%

variable : LETTER DIGIT { printf("Valid variable recognized\n"); }
         ;

%%

int main() {
    printf("Enter a string to check if it's a valid variable (lowercase letter followed by a digit):\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}