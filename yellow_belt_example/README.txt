This is a solution to the yellow belt sample test at ELSYS.
 
Given:
	* CSV file
	* 50 lines in the format (i,x)
	* i -> 0-based index of the line
	* x -> integer

Write a script that:
	* takes as an argument the name of the input file
	* parses the file
	* for every x generates another random number y, where y<x/2
	* writes the line i,x,y to the file ${input_file}_result.csv

To generate an input CSV file, run
bash generate_file.sh
and follow the instructions.

To solve the problem, run
bash solution.sh [input_file]
