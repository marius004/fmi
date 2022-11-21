.data
  s: .asciz "Anc"
  r: .space 4
  len: .long 4
.text
.globl main 
main: 
  lea s, %esi 
  lea r, %edi

  mov $0, %ecx
  mov len, %eax
  sub $2, %eax
  mov %eax, len

etloop: 
  cmp len, %ecx
  jg etexit

  mov (%esi, %ecx, 1), %bh 
  mov %bh, (%edi, %eax, 1)

  inc %ecx
  dec %eax 
  jmp etloop
etexit:
  mov len, %eax
  add $2, %eax 
  movl %eax, len

  movl 

  mov $4, %eax
  mov $1, %ebx
  mov $r, %ecx
  mov len, %edx 
  int $0x80

  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
