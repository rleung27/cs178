# Name makefile
# Course: CS178 Build Automation for DevOps and QA
# CRN: 76718
# Date: 9/18/2017
# Assignment: Write a makefile that contains the following two targets:
#     ServerCountThrees - a native executable file that counts the number of 32 bit 
#         ints with the value 3s in the binary file threesData.bin
#     runServerCountThrees - a target that launches the executable
# usage: ssh to your VM and run make
#        Open your vm console and telnet telnet 10.0.2.15 5001
#            type in a character
#        You'll see the same character in the vm console standard out
# Reference: https://www.cs.fsu.edu/~myers/howto/makefiles.txt

# Create Test target that executes the below targets
#test: CreateDirs CopyDataFile CopyExecutableFile runServerCountThrees clean
#test: CreateDirs CopyDataFile runServerCountThrees clean
test: CreateDirs CopyDataFile runServerCountThrees

# Assign variables
CC=cc
SourceDir=.
DataDir=../data
BuildDir=../build

# CreateDirs target creates the directories
CreateDirs:
	mkdir -p $(BuildDir)

# Copy the threesData.bin file into the BuildDir
CopyDataFile:
	cp $(DataDir)/threesData.bin $(BuildDir)
	# The .bin file needs to be in the SourceDir, for the program to run
	cp $(DataDir)/threesData.bin $(SourceDir)

# ServerCountThrees is the target
# which depends on ServerCountThrees.o readInt32BitLE.o existing
ServerCountThrees: ServerCountThrees.o readInt32BitLE.o
        # Linking command for linking two object code files together
        # into a target executable called ServerCountThrees 
	# the *.o takes in all object code files with the extension .o
	$(CC) -o $(SourceDir)/ServerCountThrees $(SourceDir)/*.o

# Create the readInt32BitLE.o target by compiling readInt32BitLE.c
readInt32BitLE.o: readInt32BitLE.c readInt32BitLE.h
	$(CC) -o $(SourceDir)/readInt32BitLE.o -c $(SourceDir)/readInt32BitLE.c

# How to build the target ServerCountThrees.o
# depends on ServerCountThrees.c and readInt32BitLE.o existing
# if any 2 file changes, then ServerCountThrees.o must be rebuilt
ServerCountThrees.o: ServerCountThrees.c readInt32BitLE.o
	$(CC) -o $(SourceDir)/ServerCountThrees.o -c $(SourceDir)/ServerCountThrees.c

# The ServerCountThrees could be automatically created in the BuilDir
# However the HW instructions state to copy the file from the SRC dir
# to the build Dir
CopyExeFile:
	cp $(SourceDir)/ServerCountThrees $(BuildDir)

# Create the runServerCountThrees target
# runServerCountThrees will launch the ServerCountThrees executable
runServerCountThrees: ServerCountThrees
	cp $(SourceDir)/ServerCountThrees $(BuildDir)
	#./$(BuildDir)/ServerCountThrees	
	#nohup ./$(BuildDir)/ServerCountThrees > /tmp/ServerCountThrees.log &

.PHONY: test

# clean up
clean:
	rm $(SourceDir)/*.o $(BuildDir)/ServerCountThrees $(BuildDir)/threesData.bin rm -rf $(BuildDir)
