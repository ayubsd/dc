%{
  #include<stdio.h>
  #include<string.h>
  
  int word_count = 0;
  int char_count = 0;
  int space_count = 0;
  int line_count = 0;
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {word_count++;char_count+=strlen(yytext);}
[ \t] {space_count++ ; char_count++ ;}
\n {line_count++ ; char_count++;}
. {char_count++;}

%%

int main(){
  yylex();
  printf("Words :%d\n", word_count);
  printf("Characters :%d\n", char_count);
  printf("Lines :%d\n", line_count);
  printf("Spaces :%d\n", space_count);
  return 0;
}

int yywrap(){
  return 1;
}