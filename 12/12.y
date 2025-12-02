%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
int count = 0;
%}

%token A B NL

%%
start: A_seq B NL { if (count >= 10) { printf("\nValid: Input has %d 'a's (>= 10) followed by 'b'\n", count); return 0; } 
                    else { printf("\nInvalid: Input only has %d 'a's (Needs >= 10)\n", count); return 0; } } ;
                    
A_seq: A A_seq { count++; }
     | A       { count++; }
     ;

%%

void yyerror(const char *s) {
    printf("\nInvalid String (Syntax does not match a...b)\n");
    exit(0);
}

int main() {
    printf("Enter string (e.g., aaaaaaaaaab): ");
    count = 0;
    yyparse();
    return 0;
}