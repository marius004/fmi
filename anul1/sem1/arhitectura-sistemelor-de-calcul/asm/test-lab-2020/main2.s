.data
v: .long 10, 20, 30
.text
.global main
main:
  lea v, %edi
  movl $2, %ecx
  movl (%edi, %ecx, 1), %ebx
et_exit:
  movl $1, %eax
  xorl %ebx, %ebx
  int $0x80