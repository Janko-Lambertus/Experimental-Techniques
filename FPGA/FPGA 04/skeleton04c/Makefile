# Makefile for GHDL simulations

# output filename prefix for simulation
OUTFILEPREFIX=mux

# how long do we want to simulate
STOPTIME=2000ns

# which files are needed for the simulation
FILES=mux.m.vhd mux.tb.vhd

# name of the test bench entity
TESTBENCH=mux_tb

###############################################################################
# no real need to change anything below
GHDL=ghdl
GHDLFLAGS+=--std=08
GHDLFLAGS+=

GTKWAVE=gtkwave
VCDFILE=$(OUTFILEPREFIX).vcd
GTKWOPTIONS=--save=$(OUTFILEPREFIX).gtkw
GHDLRUNFLAGS=--vcd=$(VCDFILE) --stop-time=$(STOPTIME)

.PHONY: all run clean init eleb $(FILES)

# Default target : elaborate
all : elab

# Elaborate target.  Almost useless
elab : work-obj08.cf
	$(GHDL) -c $(GHDLFLAGS) -e $(TESTBENCH)

# Targets to analyze libraries
init work-obj08.cf:	$(FILES)

$(FILES):
	$(GHDL) -a $(GHDLFLAGS) $@

# Run target
run $(VCDFILE): work-obj08.cf
	$(GHDL) -c $(GHDLFLAGS) -r $(TESTBENCH) $(GHDLRUNFLAGS)              

# View simulation result
view: $(VCDFILE)
	$(GTKWAVE) $(GTKWOPTIONS)

clean:
	rm *.cf
	rm *.vcd

