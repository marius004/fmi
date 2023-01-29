.data
  n: .space 4
  x: .space 4
  val: .space 4
  arr: .space 400
  scan1Format: .asciz "%d %d"
  scan2Format: .asciz "%d"
  print1Format: .asciz "%d "
.text
.global main
main:
  pushl $n
  pushl $x  
  pushl $scan1Format
  
  call scanf

  popl %eax 
  popl %eax 
  popl %eax 

  lea arr, %edi
  movl $0, %ecx 

etloop1:
  cmp n, %ecx
  jge etprint

  pushl %ecx 
  pushl $val
  pushl $scan2Format

  call scanf

  popl %edx 
  popl %edx 
  popl %ecx 

  mov val, %eax 
  movl %eax, (%edi, %ecx, 4)

  inc %ecx
  jmp etloop1

etprint:
  movl $0, %ecx 

etloop2:
  cmp n, %ecx
  jge etexit

  mov (%edi, %ecx, 4), %eax  

  movl $0, %edx 
  divl x 

  cmp $0, %edx 
  je et_print_multiples

  inc %ecx
  jmp etloop2

et_print_multiples:
  movl (%edi, %ecx, 4), %eax  
  pushl %ecx 
  pushl %eax  
  pushl $print1Format

  call printf 

  popl %eax 
  popl %eax 
  popl %ecx 

  inc %ecx
  jmp etloop2

etexit:
  pushl $0
  call fflush
  popl %ebx

  pushl $0
  call exit 
  popl %ebx 
