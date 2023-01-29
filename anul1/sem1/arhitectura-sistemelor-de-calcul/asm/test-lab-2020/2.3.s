.data 
  x: .long 4
  y: .long 1 
  v: .long 2, 3, 5, 7, 9, 1, 2, 3
  len: .long 8
  scanFormat: .asciz "%d"
  printFormat: .asciz "%d\n"
  divPrintFormat: .asciz "%d "
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

customEven: 
  push %ebp 
  movl %esp, %ebp

  push %esi 
  push %edi 
  push %ebx 

  subl $4, %esp 

  movl 8(%ebp), %eax
  movl 12(%ebp), %ebx 

  xorl %edx, %edx 
  mull %ebx 

  // eax = x * y 

  movl $0, %ecx 
  // sum = 0
  movl $0, -16(%ebp) 

  while:
    cmp $0, %eax 
    je customEven_after_while

    xorl %edx, %edx 
    movl $10, %ebx
    divl %ebx 

    movl -16(%ebp), %ebx
    addl %edx, %ebx 
    movl %ebx, -16(%ebp)

  customEven_after_while: 
    movl $2, %ebx
    xorl %edx, %edx 
    movl -16(%ebp), %eax 
    divl %ebx

    movl $1, %ebx 
    subl %edx, %ebx
    movl %ebx, %eax 
    jmp customEven_exit

  customEven_exit:
    addl $4, %esp 

    popl %ebx 
    popl %edi
    popl %esi

    movl %ebp, %esp
    popl %ebp

    ret 

.globl main 
main: 
  movl $0, %ecx 

  decl len

  lea v, %esi

  for_each:
    cmp len, %ecx
    je for_each_end

    pushl (%esi, %ecx, 4)
    pushl 4(%esi, %ecx, 4)
    call customEven
    popl %ebx 
    popl %ebx 

    cmp $1, %eax
    jne for_increment

    pushl (%esi, %ecx, 4)
    pushl $divPrintFormat
    call printf
    popl %ebx 
    popl %ebx 

    pushl (%esi, %ecx, 4)
    call divisors
    popl %ebx 

    for_increment:
      incl %ecx 
      jmp for_each

  for_each_end:
     

  //pushl x
  //pushl y
  //call customEven
  //popl %ebx 
  //popl %ebx 

  //pushl %eax 
  //pushl $printFormat
  //call printf
  //popl %ebx 
  //popl %ebx 

  // divizori stuff
  pushl x
  call divisors
  popl %ebx 

  pushl $0
  call fflush 
  popl %ebx 

etexit:
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
