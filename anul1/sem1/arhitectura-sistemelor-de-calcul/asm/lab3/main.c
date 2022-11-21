#include <stdio.h>

int x = 1;

int main() {
  __asm__ (
    "pusha;"
    "mov x, %eax;"
    "add $100, %eax;"
    "mov %eax, x;"
    "popa;"
  );

  printf("%d\n", x);
  return 0;
}