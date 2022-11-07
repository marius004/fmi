.data
  x: .long 6
  y: .long 0
  passStr: .asciz "PASS\n"
  failStr: .asciz "FAIL\n"
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
  mov y, %ebx
  cmp %eax, %ebx 
  je pass 

  jmp fail

pass: 
  mov $4, %eax
  mov $1, %ebx
  mov $passStr, %ecx
  mov $7, %edx
  int $0x80
  jmp exit

fail: 
  mov $4, %eax
  mov $1, %ebx
  mov $failStr, %ecx
  mov $7, %edx
  int $0x80
  jmp exit

exit: 
  mov $1, %eax
  mov $0, %ebx
  int $0x80