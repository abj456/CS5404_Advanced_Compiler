LLVM_CONFIG=/home/share/llvm_build/bin/llvm-config

CXX=`$(LLVM_CONFIG) --bindir`/clang
CXXFLAGS=`$(LLVM_CONFIG) --cppflags` -fPIC -fno-rtti
LDFLAGS=`$(LLVM_CONFIG) --ldflags`
IRFLAGS=-Xclang -disable-O0-optnone -fno-discard-value-names -S -emit-llvm
OPT=`$(LLVM_CONFIG) --bindir`/opt
TARGET=test3

.PHONY: all test run clean 
all: hw1.so test

test: $(TARGET).ll

hw1.so: hw1.cpp
	$(CXX) -shared -o $@ $< $(CXXFLAGS) $(LDFLAGS)

$(TARGET).ll: $(TARGET).c
	$(CXX) $(IRFLAGS) -o $@ $<
	$(OPT) -S -passes=mem2reg,loop-rotate,loop-simplify $@ -o $@

run: $(TARGET).ll hw1.so
	$(OPT) -disable-output -load-pass-plugin=./hw1.so -passes=hw1 $<

clean:
	rm -f *.o *.ll *.so