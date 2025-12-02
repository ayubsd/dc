%{
#include <stdio.h>
#include <string.h>

char input_str[1000];
%}

%%

.*\n    { strcpy(input_str, yytext); input_str[strlen(input_str)-1] = '\0'; }  /* Remove newline */

%%

int main() {
    yylex();
    int len = strlen(input_str);
    for (int i = len; i > 0; i--) {
        for (int j = 0; j < i; j++) {
            printf("%c", input_str[j]);
        }
        printf("\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}