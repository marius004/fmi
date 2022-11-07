.data
  n: .long 5
  s: .space 4
.text
.globl main
main:
  mov $0, %ecx
  ;// ecx era registrul-contor
etloop:
  cmp n, %ecx
  je etexit
  ;// daca %ecx == n am terminat parcurgerea
  add %ecx, s
  ;// s += %ecx
  add $1, %ecx
  ;// %ecx += 1
  jmp etloop;
  ;// reiau parcurgerea
etexit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80