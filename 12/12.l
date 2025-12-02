%{
#include "parser.tab.h"
%}

%%

[aA]    { return A; }
[bB]    { return B; }
\n      { return NL; }
[ \t]   { /* Ignore whitespace */ }
.       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}