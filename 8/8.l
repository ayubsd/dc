%{
#include <stdio.h>
int valid = 1;  /* 1 = valid, 0 = invalid */
int top = 0;    /* Parenthesis counter */
int l = 0;      /* Logic flag: 0 expects Operand, 1 expects Operator */
%}

/* Rules Section */
%%
"(" {top++;}

")" {top--; if (top < 0) { valid = 0;} }

[a-zA-Z0-9]+ { if (l == 1) { valid = 0; } l = 1; }

[+\-*/%] { if (l == 0) {valid = 0; } l = 0; }

[ \t] { }

\n { if (top == 0 && l == 1 && valid == 1) { printf("Valid Arithmetic Expression\n"); } 
    else { printf("Invalid Arithmetic Expression\n"); } valid = 1; top = 0; l = 0; return 0; }

. {valid = 0;}

%%


int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}