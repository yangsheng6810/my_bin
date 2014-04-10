#!/usr/bin/env python
####################################
#This is a script for counting non-ASCII character in a .tex file.
#It is the first python script by Yang
#
#But sadly/luckiy there is a much powerful tool with the same name 
#in texlive toolkit
####################################
import sys

def count(filename):
	#print(filename)
	ff=open(filename,"r").read()
	totnum=0
	totcac=0
	for i in ff:
		totnum+=1
		if ord(i)>127:
			totcac+=1
	print("There are {0} unicode characters in the .tex file.".format(totnum))
	print("There are {0} non-ASCII characters in the .tex file.".format(totcac))

def main():
	for filename in sys.argv[1:]:
		print(filename)
		count(filename)


main()
