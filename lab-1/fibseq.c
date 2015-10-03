#include <stdio.h>
#include <time.h>
extern int fibonacci(int x, int y, int z);

int main(int argc, char **argv)
{
  clock_t  start, finish;
  double time;
  int number =0;
  int y = 0;
  int z = 1;
  int result =0;
  FILE *out;
  out = fopen("result.txt","a"); 
  scanf("%d",&number);
  start = clock();
  result = fibonacci(number, y, z);   
  finish = clock();
  time = (double)(finish - start) / CLOCKS_PER_SEC;
  printf("The fibonacci sequence at %d is: %d\n", number, result);

  fprintf(out, "%d\t%f\n",number, time);
  fclose(out);
}