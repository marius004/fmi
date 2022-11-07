.data
  n: .long 9409
  notPrime: .asciz "The number is not prime\n"
  prime: .asciz "The number is prime\n"
.text
.globl main
main:
  mov n, %eax 

  cmp $2, %eax
  jl numberIsNotPrime
  je numberIsPrime

  mov $2, %ecx
  jmp isNumberPrimeLoop

isNumberPrimeLoop:  
  cmp n, %ecx 
  je numberIsPrime

  ;// daca restul e 0 atunci numarul nu e prim 
  mov $0, %edx 
  mov n, %eax 
  div %ecx 
  cmp $0, %edx 
  je numberIsNotPrime 

  add $1, %ecx 
  jmp isNumberPrimeLoop

numberIsNotPrime: 
  mov $4, %eax
  mov $1, %ebx
  mov $notPrime, %ecx
  mov $25, %edx
  int $0x80
  jmp exit

numberIsPrime: 
  mov $4, %eax
  mov $1, %ebx
  mov $prime, %ecx
  mov $21, %edx
  int $0x80
  jmp exit

exit:
  mov $1, %eax
  mov $0, %ebx
  int $0x80