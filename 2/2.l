%{
  #include<stdio.h>

  int vowel_count = 0;
  int consonant_count = 0;
%}

%%
[aeiouAEIOU] {vowel_count++;}
[a-zA-Z] {consonant_count++;}
.|\n {}

%%

int main(){
  yylex();
  printf("Vowels : %d\nConsonants : %d\n",vowel_count,consonant_count);
  return 0;
}

int yywrap(){
  return 1;
}