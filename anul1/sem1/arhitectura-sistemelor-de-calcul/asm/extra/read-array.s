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
  jge print

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

print:
  movl $0, %ecx 

etloop2:
  cmp n, %ecx
  jge etexit

  mov (%edi, %ecx, 4), %eax  

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

  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
