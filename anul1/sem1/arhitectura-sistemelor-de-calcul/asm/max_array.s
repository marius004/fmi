.data 
  v: .long 1, 2, 3, 4, 5, 6
  n: 6
.text
// maximum_array(v, n)
maximum_array:
  pushl %ebp 
  movl %esp, %ebp 

  pushl %esi 
  pushl %edi 
  pushl %ebx 

  subl $8, %esp

  // -16(%ebp) => maximul 
  // -20(%ebp) => frecventa

  movl $0, -16(%ebp)
  movl $0, -20(%ebp)

  // load *v into esi 
  movl 8(%ebp), %esi
  movl $0, %ecx

  for_each:
    cmp 12(%ebp), %ecx
    jge maximum_array_exit

    movl (%esi, %ecx, 4), %ebx 
    movl -16(%ebp), %eax 

    cmp %eax, %ebx
    jl for_each_inc
    je equal_maximum 

    movl %ebx, -16(%ebp)
    movl $0, -20(%ebp)

    equal_maximum:
      movl -20(%ebp), %eax 
      incl %eax 
      movl %eax, -20(%ebp)

    for_each_inc:
      incl %ecx 
      jmp for_each 

  maximum_array_exit:
    movl -16(%ebp), %eax 
    movl -20(%ebp), %ecx 

    addl $8, %esp 
    
    popl %ebx 
    popl %edi 
    popl %esi 

    movl %ebp, %esp 
    popl %ebp

    ret 
.globl main 
main: 
  pushl n
  pushl $v 
  
  call maximum_array
  
  popl %ebx 
  popl %ebx 
exit:
  movl $1, %eax 
  movl $0, %ebx 
  int $0x80