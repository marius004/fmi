.data
  x: .long 38
  y: .long 6 
.text
.globl main
main:
  mov x, %eax
  shr $12, %eax 
  mov %eax, x

exit: 
  mov $1, %eax
  mov $0, %ebx
  int $0x80