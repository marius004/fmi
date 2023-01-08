.data 
  x: .space 4 
  count: .long 0 
  scanFmt: .asciz "%d"
  printFmt: .asciz "%d\n"
.text 
f: 
  pushl %ebp 
  movl %esp, %ebp 

  push %esi 
  push %edi 
  push %ebx 

  movl 8(%ebp), %eax
  cmp $1, %eax
  je f_exit  

  movl $2, %ebx 
  xor %edx, %edx
  divl %ebx 

  cmp $0, %edx 
  je f_even 

  movl 8(%ebp), %eax 
  movl $3, %ebx 
  mull %ebx 
  incl %eax 

  incl count 
  pushl %eax 
  call f 
  popl %eax 

  jmp f_exit

  f_even:
    incl count 

    movl 8(%ebp), %eax 
    movl $2, %ebx 
    divl %ebx 
    pushl %eax 
    call f 
    popl %eax 
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
  pushl $x 
  pushl $scanFmt
  
  call scanf

  popl %ebx 
  popl %ebx 

  pushl x 
  call f 
  popl %ebx 

  pushl count 
  pushl $printFmt 
  
  call printf

  popl %ebx 
  popl %ebx 


etexit:
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
