.data 
.text
.globl main 
main: 
fib: 
  pusl %ebp
  movl %esp, %ebp 

  pushl %esi 
  pushl %edi 
  pushl %ebx 

  movl 8(%ebp), %eax 
  cmp $0, %eax 
  je base_case_0
  cmp $1, %eax 
  je base_case1

  movl %eax, %ecx
  decl %ecx 

  pushl %ecx 
  call fib 
  popl %ebx

  pushl %eax 
  
  decl %ecx 
  pushl %ecx 
  call fib 
  popl %ebx

  popl %ebx 
  addl %ebx, %eax 
  jmp fib_exit

  base_case_0:
    movl $0, %eax 
    jmp fib_exit

  base_case_1:
    movl $1, %eax 
    jmp fib_exit

  fib_exit:
    popl %ebx 
    popl %edi 
    popl %esi 

    movl %ebp, %esp 
    popl %ebp 

    ret 
exit: 
  movl $1, %eax 
  xorl %ebx, %ebx
  int $ox80 