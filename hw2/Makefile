LLVM_CONFIG=/home/share/llvm_build/bin/llvm-config

CXX=`$(LLVM_CONFIG) --bindir`/clang
CXXFLAGS=`$(LLVM_CONFIG) --cppflags` -fPIC -fno-rtti
LDFLAGS=`$(LLVM_CONFIG) --ldflags`
IRFLAGS=-Xclang -disable-O0-optnone -fno-discard-value-names -S -emit-llvm
OPT=`$(LLVM_CONFIG) --bindir`/opt
# TARGET=test4

.PHONY: all test run clean 
all: hw2.so test run

ifeq (test, $(firstword $(MAKECMDGOALS)))
  TARGET := $(word 2, $(MAKECMDGOALS))
  $(eval $(TARGET):;@:)
endif

test: hw2.so $(TARGET).ll run
	@echo test on ./$(TARGET).c


hw2.so: hw2.cpp
	$(CXX) -shared -o $@ $< $(CXXFLAGS) $(LDFLAGS)

$(TARGET).ll: $(TARGET).c
	$(CXX) $(IRFLAGS) -o $@ $<
# 	$(OPT) -S -passes=mem2reg,loop-rotate,loop-simplify $@ -o $@

run: $(TARGET).ll hw2.so
	$(OPT) -disable-output -load-pass-plugin=./hw2.so -passes=hw2 $<

clean:
	rm -f *.o *.ll *.so