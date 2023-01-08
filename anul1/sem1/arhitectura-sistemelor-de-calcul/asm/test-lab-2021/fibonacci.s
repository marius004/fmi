.data 
  n: .space 4 
  formatScan: .asciz "%d"
  formatPrint: .asciz "%d\n"
.text
fibonacci: 
  push %ebp 
  movl %esp, %ebp

  push %esi 
  push %edi 
  push %ebx 

  movl 8(%ebp), %eax 
  cmp $0, %eax 
  je base_case0

  cmp $1, %eax 
  je base_case1

  decl %eax 
  pushl %eax 
  call fibonacci
  movl %eax, %ebx 

  // ebx = F[n - 1]

  popl %eax
  decl %eax 
  pushl %eax 
  call fibonacci
  popl %ecx 

  // eax = F[n - 2]
  
  // eax = F[n - 2] + F[n - 1]
  addl %ebx, %eax 
  jmp fibonacci_exit

  base_case0: 
    movl $0, %eax 
    jmp fibonacci_exit
  
  base_case1:
    movl $1, %eax 
    jmp fibonacci_exit

  fibonacci_exit:
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
  call fibonacci
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
