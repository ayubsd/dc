%{

#include<stdlib.h>
#include "parser.tab.h"

%}

%%
[0-9]+(\.[0-9]+)? {yylval.num = atof(yytext); return NUMBER;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"(" {return LPAREN;}
")" {return RPAREN;}
[ \t\n] {}
. {return yytext[0];}

%%

int yywrap(){
  return 1;
}