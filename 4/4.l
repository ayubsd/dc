%{
  #include<stdio.h>  
  #include<string.h>
  char longest[1000];
  int max_len = 0;
%}

%%

[a-zA-Z]+ {
  int len = strlen(yytext);
  if(len>max_len){
    max_len = len;
    strcpy(longest,yytext);
  }
}

.|\n {}

%%

int main(){
  yylex();
  if(max_len>0){
    printf("Longest Word : %s\n",longest);
  }
  else{
    printf("No words found.\n");
  }
  return 0;
}

int yywrap(){
  return 1;
}
