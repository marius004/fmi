.data
  a: .long 67
  b: .long 5
  c: .long 6
  max: .space 4
.text
.globl main
main:
  mov a, %eax
  mov b, %ebx 
  
  cmp %ebx, %eax 
  jge agreaterb

  jmp bgreatera

agreaterb: 
  mov a, %eax 
  mov c, %ebx 

  cmp %ebx, %eax
  jle cismax

  jmp aismax     

bgreatera: 
  mov b, %eax
  mov c, %ebx 

  cmp %eax, %ebx 
  jge cismax

  jmp bismax

aismax: 
  mov a, %eax 
  mov %eax, max 
  jmp exit 

bismax: 
  mov b, %eax 
  mov %eax, max 
  jmp exit 

cismax: 
  mov c, %eax 
  mov %eax, max
  jmp exit 

exit: 
  mov $1, %eax
  mov $0, %ebx
  int $0x80