.data
  x: .long 34
  y: .long 64
.text
.globl main
main:
  mov $0, %edx 
  mov x, %eax
  mov $16, %ebx 
  div %ebx 
  mov %eax, x 

  mov y, %eax
  mov $16, %ebx 
  mul %ebx 
  mov %eax, y

  mov x, %eax
  add y, %eax 

exit: 
  mov $1, %eax
  mov $0, %ebx
  int $0x80