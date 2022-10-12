.data
.text
.globl main
main:
mov 
mov $4, %eax
mov $1, %ebx
mov $helloWorld, %ecx
mov $15, %edxa
int $0x80
mov $1, %eax
mov $0, %ebx
int $0x80
