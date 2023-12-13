ASM=nasm
CC=gcc
S_DIR=src
T_DIR=tools
B_DIR=build
O_DIR=os
.PHONY: all floppy_image kernel bootloader clean always tools_fat
all: floppy_image tools_fat
floppy_image: $(B_DIR)/floppy.img
$(B_DIR)/floppy.img: bootloader kernel
	dd if=/dev/zero of=$(B_DIR)/floppy.img bs=512 count=2880
	mkfs.fat -F 12 -n "NBOS" $(B_DIR)/floppy.img
	dd if=$(B_DIR)/boot.bin of=$(B_DIR)/floppy.img conv=notrunc
	mcopy -i $(B_DIR)/floppy.img $(B_DIR)/kernel.bin "::kernel.bin"
	mcopy -i $(B_DIR)/floppy.img john.txt "::john.txt"
bootloader: $(B_DIR)/boot.bin
$(B_DIR)/boot.bin: always
	$(ASM) $(S_DIR)/bootloader/boot.asm -f bin -o $(B_DIR)/boot.bin
kernel: $(B_DIR)/kernel.bin
$(B_DIR)/kernel.bin: always
	$(ASM) $(S_DIR)/kernel/main.asm -f bin -o $(B_DIR)/kernel.bin
tools_fat: $(B_DIR)/tools/FAT
$(B_DIR)/tools/FAT: always $(T_DIR)/FAT/fat.c
	mkdir -p $(B_DIR)/tools
	$(CC) -g -o $(B_DIR)/tools/FAT $(T_DIR)/FAT/fat.c
always:
	mkdir -p $(B_DIR)
clean:
	rm -rf $(B_DIR)/*
#still need to setup redirects to os folder