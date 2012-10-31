all: hello

hello:
	cc -D_FILE_OFFSET_BITS=64 -DFUSE_USE_VERSION=22 hello.c -o hello -lfuse

.PHONY: clean test

test: hello
	mkdir -p /tmp/fuse
	./hello /tmp/fuse
	ls -l /tmp/fuse
	cat /tmp/fuse/hello
	fusermount -u /tmp/fuse
	
clean:
	-rm hello
