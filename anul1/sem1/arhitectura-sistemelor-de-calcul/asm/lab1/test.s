.data
  x: .byte 50
.text
.global main
main:
  mov $256, x
  mov x, %al
  int $0x80

  mov $1, %eax
  mov $0, %ebx
  int $0x80

