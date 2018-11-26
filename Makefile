.PHONY: all rebuild build clean

PWD := $(shell pwd)

all:build
	@# conf: http://wiki.qemu.org/download/qemu-doc.html
	@# hw: http://zoo.cs.yale.edu/classes/cs422/2013/lec/l2-hw
	qemu-system-x86_64 -serial mon:stdio -hdb src/fs.img src/xv6.img -smp 2 -m 512

rebuild	: clean all

build:
	docker run --rm -it -v $(PWD)/src:/src gcc bash -c 'cd src && make -j8'


clean:
	docker run --rm -it -v $(PWD)/src:/src gcc bash -c 'cd src && make clean'

	


