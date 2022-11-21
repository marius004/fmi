.data
  n: .long 7
  s: .asciz "Hello\n"
  t: .space 7
.text
.globl main

main:   
  mov $t, %edi
  mov $s, %esi
  mov n, %ecx
et_loop:
  mov -1(%esi, %ecx, 1), %al
  mov %al, -1(%edi, %ecx, 1)

  loop et_loop

  mov $4, %eax
  mov $1, %ebx
  mov $t, %ecx
  mov $7, %edx
  int $0x80

  mov $1, %eax
etexit: 
  mov $1, %eax
  mov $0, %ebx
  int $0x80