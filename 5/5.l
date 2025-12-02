%{
  #include<stdio.h>

%}

%x COMMENT

%%

"if"|"else"|"while"|"for"|"int"|"float"|"return"|"void"|"do" {printf("Keyword: %s\n",yytext);}

[0-9]+ {printf("Integer %s\n",yytext);}

[0-9]+\.[0-9]+ {printf("Float %s\n",yytext);}

[a-zA-Z_][a-zA-Z_]* {printf("Identifier %s\n",yytext);}

"+"|"-"|"*"|"/"|"=="|"<"|">"|"<="|">="|"!="|"&&"|"||"|"|"|"!" {printf("Operator %s\n",yytext);}

"//".* {/*Single-Line Comment: ignore */}
"/*" {BEGIN(COMMENT);}
<COMMENT>"*/" {BEGIN(INITIAL);}
<COMMENT>.|\n {/* Multi-Line Comment: ignore*/}

[ \t\n]+ {/* WhiteSpace: ignore */}
. {printf("Unknown: %s\n",yytext);}

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}