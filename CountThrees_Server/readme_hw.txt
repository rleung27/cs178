1. cd src
2. run make
3. on another terminal issue the command telnet 10.0.2.15 5001
4. Once the telnet session is connected, on the same terminal enter any key
5. the terminal where make was run, will duplicate the entered key and return the number of threes

Below are the high level instructions
1. run the ServerCountThrees executable on the Ubuntu VM
  output will be ServerThrees comment

2. then telnet to UbuntuVM port 5001 with a different terminal on the Ubuntu VM or host
	ServerCountThrees Response: 31 will be returned

3. Rember to chown rleung27 threesData.bin on week4 dir

4. The Makefile will launch the ServerCountThree program

5. Ray will manually telnet to the UbuntuVM port 5001 and email screenshot output to
 	Prof Brown
