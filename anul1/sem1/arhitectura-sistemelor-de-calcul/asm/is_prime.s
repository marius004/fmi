.data 
.text 
.globl main 
// is_prime(x)
// prin eax returneaza 0(nu e prim), 1(daca e prim)
is_prime: 
  pushl %ebp
  movl %esp, %ebp 

  pushl %esi 
  pushl %edi 
  pushl %ebx 

  movl 8(%ebp), %eax 
  movl $2, %ebx 
  cmp %ebx, %eax
  jl nr_is_not_prime
  je nr_is_prime

  movl $2, %ecx
  for_each:
    cmp 8(%ebp), %ecx
    jge nr_is_prime

    xorl %edx, %edx 
    movl 8(%ebp), %eax
    divl %ecx 

    cmp $0, %edx
    je nr_is_not_prime

    incl %ecx 
    jmp for_each

  nr_is_not_prime:
    movl $0, %eax
    jmp is_prime_exit

  nr_is_prime:
    movl $1, %eax 
    jmp is_prime_exit

  is_prime_exit:
    popl %ebx 
    popl %edi 
    popl %esi 

    movl %ebp, %esp 
    popl %ebp 

    ret 
.globl main 
main: 
  pushl $18
  call is_prime
  popl %ebx 
exit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80