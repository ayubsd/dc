%{
#include "parser.tab.h"
%}

%%

"a"   { return A; }
"b"   { return B; }
.     { return yytext[0]; }  /* Invalid characters */

%%

int yywrap() {
    return 1;
}