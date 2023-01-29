.data
  counter: .long 0
.text
f: 
  pushl %ebp 
  movl %esp, %ebp 

  pushl %esi 
  pushl %edi 
  pushl %ebx 

  movl 8(%ebp), %eax 
  cmp $1, %eax
  je base_case1

  movl $2,%ebx
  xorl %edx, %edx 
  divl %ebx
  cmp $0, %edx 
  je base_case2

  movl 8(%ebp), %eax
  xorl %edx, %edx 
  movl $3, %ebx
  mull %ebx 
  incl %eax 

  movl counter, %eax 
  incl %eax 
  movl %eax, counter 
  jmp f_exit

  pushl %eax 
  call f 
  popl %eax 

  base_case1:
    movl counter, %eax 
    incl %eax 
    movl %eax, counter 
    jmp f_exit

  base_case2: 
    movl counter, %eax 
    incl %eax 
    movl %eax, counter 
    jmp f_exit

    pushl %eax 
    call f 
    popl %ebx 
    jmp f_exit

  f_exit:
    popl %ebx 
    popl %edi 
    popl %esi 

    movl %ebp, %esp 
    popl %ebp 

    ret 

.globl main 
main: 
before:
  movl $1, %eax
  movl $2, %ebx
  movl $3, %ecx
  movl $4, %edx

after:
  pushl $0
  call fflush 
  popl %ebx 
exit: 
  movl $1, %eax 
  xorl %ebx, %ebx 
  int $0x80 
