.code16
.global init

init:
	mov $message, %SI

print_string:
	lodsb
        cmp $0, %AL
        je done

print_character:
	mov $0xE, %AH
	int $0x10
	jmp print_string

done:
	hlt

message:
	.asciz "Hello, World!"

.fill 510-(.-init), 1, 0
.word 0xAA55

