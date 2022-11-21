.data
  n: .long 5
  v: .long 70, 50, 30, 40, 50
  occurences: .long 0
  maximum: .long 0
.text
.globl main
main:
  xor %ecx, %ecx
etloop:
  cmp n, %ecx
  jge etexit
  lea v, %esi
  mov (%esi, %ecx, 4), %eax 
  cmp maximum, %eax
  je etequal
  jg etgreater
etincrement:
  inc %ecx 
  jmp etloop
etequal:
  movl occurences, %eax
  inc %eax 
  movl %eax, occurences
  jmp etincrement
etgreater:
  movl occurences, %eax 
  movl $1, %eax 
  movl %eax, occurences
  mov (%esi, %ecx, 4), %eax
  mov %eax, maximum
  jmp etincrement
etexit: 
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
