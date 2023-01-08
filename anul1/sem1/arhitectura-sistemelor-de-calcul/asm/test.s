.data
  n: .space 4
  k: .space 4
  suma: .long 0
  maxSuma: .long 0
  val: .space 4
  arr: .space 400
  scan1Format: .asciz "%d %d"
  scan2Format: .asciz "%d"
  printFormat1: .asciz "Suma maxima de %ld elemente din sir este %ld\n"
.text
.global main
main:
  pushl $k
  pushl $n
  pushl $scan1Format
  
  call scanf

  popl %eax 
  popl %eax 
  popl %eax 

  lea arr, %edi
  movl $0, %ecx 

etloop1:
  cmp n, %ecx
  jge etcalc

  pushl %ecx 
  pushl $val
  pushl $scan2Format

  call scanf

  popl %edx 
  popl %edx 
  popl %ecx 

  mov val, %eax 
  movl %eax, (%edi, %ecx, 4)

  cmp k, %ecx 
  jl incrementSum

  inc %ecx
  jmp etloop1

incrementSum:
  mov suma, %edx 
  add val, %edx
  mov %edx, suma

  inc %ecx
  jmp etloop1

etcalc:
  mov suma, %eax
  mov %eax, maxSuma
  mov k, %ecx

  lea arr, %esi 
etloop2:
  cmp n, %ecx
  jge etprint
  
  // scad din v[ecx - k]
  mov %ecx, %eax
  sub k, %eax 

  mov (%esi, %eax, 4),%edx
  sub %edx, suma

  mov (%esi, %ecx, 4), %edx 
  add %edx, suma 

  mov maxSuma, %edx 
  cmp suma, %edx 
  jg updateMax

  inc %ecx 
  jmp etloop2

updateMax:
  mov suma, %edx 
  mov %edx, maxSuma

  inc %ecx 
  jmp etloop2

etprint: 
  pushl maxSuma
  pushl k 
  pushl $printFormat1

  call printf 

  popl %ebx 
  popl %ebx 
  popl %ebx

  pushl $0
  call fflush
  popl %ebx

etexit:
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80