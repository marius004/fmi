.data
  x: .long 4
  y: .long 5
.text
.globl main
main:
  mov x, %eax 
  mov y, %ebx 
  mov %eax, y
  mov %ebx, x
  int $0x80

  mov $1, %eax
  mov $0, %ebx
  int $0x80 
  