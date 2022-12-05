.data
  str: .space 100
  len: .space 4 
  occurences: .long 0
  fmt1: .asciz "%s"
  fmt2: .asciz "Stringul %s dat are %ld vocale\n"
.text
.global main
main:
  pushl $str 
  call gets 

  popl %ebx 

  pushl $str
  call strlen 
  popl %ebx 

  mov $0, %ecx 
  movl %eax, len 

  lea str, %esi 

etloop: 
  cmp len, %ecx  
  jge etprint 

  mov (%esi, %ecx, 1), %ah
  cmp $'a', %ah
  je increment 

  cmp $'e', %ah 
  je increment 

  cmp $'i', %ah 
  je increment 

  cmp $'o', %ah
  je increment 

  cmp $'u', %ah
  je increment 

  cmp $'A', %ah
  je increment 

  cmp $'E', %ah
  je increment 

  cmp $'I', %ah
  je increment 

  cmp $'O', %ah
  je increment 

  cmp $'U', %ah
  je increment 

  inc %ecx 
  jmp etloop

increment: 
  mov occurences, %edx 
  inc %edx 
  mov %edx, occurences

  inc %ecx 
  jmp etloop

etprint:
  pushl occurences
  pushl $str
  pushl $fmt2 

  call printf

  popl %ebx 
  popl %ebx 
  popl %ebx 

etexit:
  pushl $0
  call fflush 
  popl %ebx 

  pushl $0
  call exit 
  popl %ebx 