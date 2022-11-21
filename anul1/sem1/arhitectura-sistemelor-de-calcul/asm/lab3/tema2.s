; DOES NOT WORK :(
.data
  s: .asciz "Assembly"
  t: .space 9
  n: .long 8
  half: .long 0
.text
.globl main
main:
  mov $s, %esi 
  mov $t, %edi

  mov $0, %edx
  mov n, %eax 
  mov $2, %ebx 
  idiv %ebx 
  mov %eax, half 

  xor %ecx, %ecx 

etloop: 
  cmp half, %ecx 
  je print

  mov (%esi, %ecx, 1), %ah
  
  mov n, %edx
  sub %ecx, %edx 
  sub $1, %edx

  mov %ah, (%edi, %edx, 1)

  inc %ecx 
  jmp etloop

print: 
  mov n, %eax
  mov (%esi, %eax, 1), %edx 
  mov %edx, (%edi, %eax, 1)  

  inc %eax 
  mov %eax, n
  mov $4, %eax
  mov $1, %ebx
  mov $t, %ecx
  mov $9, %edx
  int $0x80

  jmp etexit

etexit: 
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
