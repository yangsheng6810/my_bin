#!/usr/bin/env python
import sys
import os

def work(filename):
    file,suffix=filename.split(".")
    infile = open(filename,"r")
    outfile = open(filename+"_d","w")
    indef = 0
    for line in infile:
        if indef>0 :
            if line.find("#endif")>= 0:
                indef -=1
            continue
        if line.find("#ifndef")>= 0 :
            indef += 1
            if line.find("NDEBUG")>= 0:
                continue
        print(line,end="",file=outfile);
    infile.close()
    outfile.close();
    os.rename(filename,file+"_d."+suffix)
    os.rename(filename+"_d",filename)
    
def main():
    for filename in sys.argv[1:]:
        work(filename)
main()
