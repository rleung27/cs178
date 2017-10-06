# Name makefile
# Course: CS178 Build Automation for DevOps and QA
# CRN: 76718
# Date: 9/11/2017
# Assignment: Write a makefile that contains the following two targets:
#     Count3s - a native executable file that counts the number of 32 bit 
#         ints with the value 3s in the binary file threesData.bin
#     runCount3s - a target that launches the executable
# usage: make
# Reference: https://www.cs.fsu.edu/~myers/howto/makefiles.txt

run: runCount3s

.PHONY: run

# Count3s is the target
# which depends on countThrees.o readInt32BitLE.h readInt32BitLE.c existing
Count3s: countThrees.o readInt32BitLE.h readInt32BitLE.c
	g++ -o Count3s countThrees.o 

# How to build the target countThrees.o
# depends on countThrees.c readInt32BitLE.h., and readInt32BitLE.c existing
# if any 3 file changes, then countThrees.o must be rebuilt
countThrees.o: countThrees.c readInt32BitLE.h readInt32BitLE.c
	g++ -c countThrees.c

# Create the runCount3s target
# runCount3s will launch the Count3s executable
runCount3s: Count3s
	./Count3s	

# clean up
clean:
#	rm *.o Count3s
	rm countThrees.o

