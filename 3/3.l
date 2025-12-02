%{
  #include<stdio.h>
%}

%%

[a-z] {printf("%c", (yytext[0]-'a'+3)%26 + 'a');}
[A-Z] {printf("%c", (yytext[0]-'A'+3)%26 + 'A');}
.|\n {printf("%c", yytext[0]);}

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}