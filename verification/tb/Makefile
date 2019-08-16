#///////////////////////////////////////////////////////////////////////////////////////////////////
#//
#//        CLASS: Makefile
#//  DESCRIPTION: 
#//         BUGS: ---
#//       AUTHOR: Matheus Almeida, matheus.almeida@embedded.ufcg.edu.br
#// ORGANIZATION: XMEN - Laboratorio de Excelencia em Microeletronica do Nordeste 
#//      VERSION: 1.0
#//      CREATED: 08/14/2019 02:05:25 PM
#//     REVISION: ---
#///////////////////////////////////////////////////////////////////////////////////////////////////

RTL_SRC = ../../frontend/rtl/src/
MODEL_SRC = ../../frontend/model/src/
SCRIPT_SRC = ../scripts/
VTB = ./

IF = ./mdc_if.sv
WRAPPER = ./mdc_wrapper.sv
RTL = $(RTL_SRC)/mdc.sv \
			$(RTL_SRC)/mdc_ctrl.sv \
			$(RTL_SRC)/mdc_proc.sv
REFMOD = $(MODEL_SRC)/my_mdc.cpp 
PKGS = ./mdc_pkg.sv 

MODE = ALL
SEED = 100
COVER = 100
TRANSA = 5000

RUN_ARGS_COMMON = -access +r -input $(SCRIPT_SRC)/shm.tcl \
          +uvm_set_config_int=*,recording_detail,1 -coverage all -covoverwrite

sim:
	@g++ -g -fPIC -Wall -std=c++0x $(REFMOD) -shared -o teste.so 
	@xrun -64bit -uvm +incdir+$(VTB) +incdir+$(RTL_SRC) $(PKGS) $(IF) $(WRAPPER) $(RTL) $(VTB)/top.sv -sv_lib teste.so \
    +UVM_TESTNAME=simple_test -covtest simple_test-$(SEED) -define $(MODE) -svseed $(SEED)  \
    -defparam top.min_cover=$(COVER) -defparam top.min_transa=$(TRANSA) $(RUN_ARGS_COMMON) 


clean:
	@rm -rf INCA_libs waves.shm rtlsim/* *.history *.log rtlsim/* *.key mdv.log imc.log imc.key ncvlog_*.err *.trn *.dsn .simvision/ xcelium.d simv.daidir *.so *.o *.err cov_work simvision* *.out

rebuild: clean sim

view_waves:
	simvision waves.shm &

view_cover:
	imc &
