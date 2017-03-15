#!/usr/bin/env python3
import sys
import re

def main():
    filename = str(sys.argv[1])
    output_filename = str(sys.argv[2])
    track_list = list()

    rr = re.compile('FILE "([^"]*)" WAVE')
    ss = ""
    s = open(filename, "r").read()
    s1 = s.replace("\n\\\n", "---")
    f = open(output_filename + ".cue", "w")
    for line in s1.split("\n"):
        if "Cuesheet" in line:
            l = line.replace("---", "\n")[9:]
            l = l.replace(".wav", ".tak")
            ll = rr.sub('FILE "' + output_filename + '.tak" WAVE', l)
    print(ll, file=f)
    f.close()

if __name__ == '__main__':
    main()
