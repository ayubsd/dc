%{
#include <stdio.h>

int char_count = 0;
int line_count = 0;
%}

%%

.        { char_count++; }
\n      { char_count++; line_count++; }

%%

int main() {
    yylex();
    printf("Lines: %d\nCharacters: %d\n", line_count, char_count);
    return 0;
}

int yywrap() {
    return 1;
}