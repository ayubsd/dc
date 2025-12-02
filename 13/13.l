%{
#include "13.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUM; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MULT; }
"/"         { return DIV; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[ \t\n]     ;  // Ignore whitespace
.           { return yytext[0]; }  // Return other characters for error

%%


int yywrap(){
  return 1;
}

