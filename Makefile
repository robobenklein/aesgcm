# make
# 	Build the aesgcm tool
# make test
# 	Build the tool and run a self test (encryption + decryption)
# make test V=1
# 	Same as above, but more verbose
# make clean
# 	Remove all generated files

SHELL=/bin/bash

ifeq ($(V),1)
VFLAGS=-v -v
endif

aesgcm: aesgcm.c
	$(CC) -g -o $@ $< -lcrypto

key:
	head -c 32 < /dev/urandom >$@

iv:
	head -c 12 < /dev/urandom >$@

plaintext:
	dd if=/dev/urandom of=$@ bs=1 count=1500

test: aesgcm key iv plaintext
	./aesgcm enc $(VFLAGS) -key key -iv iv -in plaintext -out ciphertext -tag tag
	./aesgcm dec $(VFLAGS) -key key -iv iv -tag tag -in ciphertext -out decrypted
	cmp plaintext decrypted

clean:
	rm -f aesgcm key iv plaintext ciphertext tag decrypted
