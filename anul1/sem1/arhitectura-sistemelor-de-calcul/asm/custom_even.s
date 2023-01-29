.data
  v: .long 1, 2, 3, 4, 5
  n: .long 5
  newline: .asciz "\n"
.text
divisors:
  push %ebp 
  movl %esp, %ebp

  push %esi 
  push %edi 
  push %ebx 

  movl $1, %ecx 
  divisors_for:
    movl 8(%ebp), %eax
    cmp %ecx, %eax 
    jl divisors_exit

    xor %edx, %edx
    divl %ecx 
    cmp $0, %edx
    je divisors_for_print
    jmp divisors_for_increment

    divisors_for_print:
      pushl %ecx 
      pushl $divPrintFormat
      call printf
      popl %ebx 
      popl %ecx 

      jmp divisors_for_increment

    divisors_for_increment:
      incl %ecx 
      jmp divisors_for

  divisors_exit:
    popl %ebx 
    popl %edi
    popl %esi

    movl %ebp, %esp
    popl %ebp

    ret 
custom_even: 
  pushl %ebp 
  movl %esp, %ebp 

  pushl %esi 
  puhsl %edi
  pushl %ebx 

  subl $4, %esp 
  // suma = 0 
  movl $0, -16(%ebp)

  movl 8(%ebp), %eax
  movl 8(%ebp), %ebx 
  xorl %edx, %edx 
  mull %ebx 

  // eax = x * y 
  while_has_digits:
    cmp $0, %eax 
    je custom_even_exit

    movl $10, %ebx
    xorl %edx, %edx 
    divl %ebx 

    movl -16(%ebp), %ecx
    addl %edx, %ecx
    movl %ecx, -16(%ebp)

  custom_even_exit:
    movl -16(%ebp), %eax 
    movl $2, %ebx 
    xorl %edx, %edx 
    divl %ebx 

    movl $1, %eax
    subl %edx, %eax

    addl $4, %esp 

    popl %ebx 
    popl %edi
    popl %esi 

    movl %ebp, %esp 
    popl %ebp

    ret 
.globl main 
main: 
  lea v, %esi

  movl $0, %ecx 
  for_each: 
    movl %ecx, %eax
    incl %eax 
    
    cmp n, %eax
    jge for_each_end

    pushl (%esi, %ecx, 4)
    pushl (%esi, %eax, 4)
    call customEven    
    popl %ebx 
    popl %ebx 

    cmp $1, %eax
    jne for_each_inc

    pushl (%esi, %ecx, 4)
    call divisors
    popl %ebx 

    pushl $newline
    call printf
    popl %ebx

    for_each_inc: 
      incl %ecx 
      jmp for_each

  for_each_end:
    movl $0, %eax 
    pushl (%esi, %eax, 4)
    movl n, %eax
    subl %eax  
    pushl (%esi, %eax, 4)
    call customEven    
    popl %ebx 
    popl %ebx 

    cmp $1, %eax
    jne ending_here

    movl n, %eax
    subl %eax  
    pushl (%esi, %eax, 4)
    call divisors
    popl %ebx 
    jmp ending_here
    
    ending_here:
      pushl $0 
      call fflush 
      popl %ebx
      jmp exit  

exit:
  movl $1, %eax 
  xorl %ebx, %ebx 
  int $0x80