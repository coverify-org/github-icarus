all: iverilog/iverilog
	@echo 'Now add the following to .bashrc: export PATH='`dirname ${PWD}`'/icarus/bin:''$$PATH'

# Compile the D compiler
iverilog/autoconf.sh:
	( cd clones/iverilog; git pull )
	rm -rf iverilog
	cp -a clones/iverilog .

iverilog/iverilog:iverilog/autoconf.sh
	(cd iverilog; bash ./autoconf.sh; bash configure --prefix=`dirname ${PWD}`/icarus; make; make install)

clean:
	rm -fr ../icarus
	rm -fr iverilog
