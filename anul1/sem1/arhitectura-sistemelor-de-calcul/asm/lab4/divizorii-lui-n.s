.data
  n: .space 4
  scanFormat: .asciz "%d"
  printFormat: .asciz "%d\n"
.text
.global main
main:
  pushl $n
  pushl $scanFormat
  call scanf 

  popl %eax 
  popl %eax 

  movl $1, %ecx 
etloop: 
  cmp n, %ecx 
  jg etexit

  movl $0, %edx
  mov n, %eax
  idiv %ecx 

  cmp $0, %edx
  je print_divisor
  
  inc %ecx 
  jmp etloop

print_divisor:
  pushl %ecx 
  pushl $printFormat

  call printf 

  popl %eax 
  popl %ecx

  inc %ecx 
  jmp etloop
etexit:
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80