MAKE=make
MAKEFILE=Makefile
Z_TOOLS=../z_tools/
NASK=$(Z_TOOLS)nask
EDIMG=$(Z_TOOLS)edimg
FDIMG0AT=$(Z_TOOLS)fdimg0at.tek
HELLOOS_IMG=helloos.img
IMGTOL=$(Z_TOOLS)imgtol.com
IPL_LST=ipl.lst
IPL_BIN=ipl.bin
IPL_ASM=ipl.asm
default:
	$(MAKE) img
$(IPL_BIN): $(IPL_ASM) $(MAKEFILE)
	$(NASK) $(IPL_ASM) $(IPL_BIN) $(IPL_LST)
$(HELLOOS_IMG): $(IPL_BIN) $(MAKEFILE)
	$(EDIMG) imgin:$(FDIMG0AT) wbinimg src:$(IPL_BIN) len:512 from:0 to:0   imgout:$(HELLOOS_IMG)
asm:
	$(MAKE) -r $(IPL_BIN)
img:
	$(MAKE) -r $(HELLOOS_IMG)
install:
	$(MAKE) img
	$(IMGTOL) w a: $(HELLOOS_IMG)
clean:
	rm -rf $(IPL_BIN)
qemu:
	qemu-system-i386 -hdd $(HELLOOS_IMG)
src_only:
	$(MAKE) clean
	rm -rf $(HELLOOS_IMG)
	rm -rf $(IPL_LST)
