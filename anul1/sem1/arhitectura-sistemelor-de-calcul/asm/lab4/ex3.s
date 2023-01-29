.data 
  s: .space 100
  fs1: .asciz "%s"
  counter: .long 0
.text
.globl main 
main:
  pushl $s
  pushl $fs1
  call scanf 
  popl %ebx 
  popl %ebx 
  
  lea s, %esi
  movl $0, %ecx 
etloop:
  mov (%esi, %ecx, 1) ,%al
  cmp %al, $0 
  je etexit

  cmp $'a', %al
  je etincrement

  cmp $'e', %al
  je etincrement

  cmp $'i', %al
  je etincrement

  cmp $'o', %al
  je etincrement

  cmp $'u', %al
  je etincrement

  cmp $'A', %al
  je etincrement

  cmp $'E', %al
  je etincrement

  cmp $'I', %al
  je etincrement

  cmp $'O', %al
  je etincrement

  cmp $'U', %al
  je etincrement

  inc %ecx 
  jmp etloop
etincrement:
  mov %

etexit:
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80