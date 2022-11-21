.data
.text
.globl main
main:
etexit: 
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
