.data 
  n: .space 4 
  formatScan: .asciz "%d"
  formatPrint: .asciz "%d\n"
.text
factorial:
  push %ebp 
  movl %esp, %ebp

  push %esi 
  push %edi 
  push %ebx 

  movl 8(%ebp), %eax 
  cmp $0, %eax 
  je base_case
  cmp $1, %eax 
  je base_case

  decl %eax 
  pushl %eax 
  
  call factorial
  
  xorl %edx, %edx 
  popl %ebx 
  incl %ebx 
  mull %ebx 
  jmp factorial_exit

  base_case: 
    movl $1, %eax 
    jmp factorial_exit

  factorial_exit:
    popl %ebx 
    popl %edi
    popl %esi

    movl %ebp, %esp
    popl %ebp

    ret 

.globl main 
main: 
  pushl $n
  pushl $formatScan
  call scanf 
  popl %ebx 
  popl %ebx

  pushl n
  call factorial
  popl %ebx 

  pushl %eax 
  pushl $formatPrint
  call printf
  popl %ebx 
  popl %ebx 
etexit:
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80