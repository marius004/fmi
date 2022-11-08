.data
.text
.globl main
main:
  mov $0x40000000, %eax 
  mov $0x8, %ebx
  mov $0x1, %ecx 
  mov $0x8, %edx 
  mul %edx
et_exit: 
  mov $1, %eax
  mov $0, %ebx
  int $0x80
