#!/usr/bin/env python3
import sys
import re
import os

def main():
    filename = str(sys.argv[1]).split(".")[0]
    track_list = list()
    with open(filename + ".log", "r") as f:
        header = True
        for line in f:
            if "|" not in line:
                continue
            if header:
                header = False
                continue
            else:
                l = [str.strip(i) for i in line.split("|")]
                if l[0] == "":
                    l = l[1:]
                if len(l) != 5:
                    print("Length of line is wrong!")
                    print(line)
                    for i in l:
                        print(i, sep=' ', end="")
                # assert
                track_list.append((l[0].zfill(2),
                                   l[1].zfill(8),
                                   l[2].zfill(8)))
    dir = os.getcwd().split(os.sep)[-1]
    m = re.search('\[EAC\]\[([\d]{6})\]「([^」]*)」／([^(]*)(?= \(tak)', dir)
    year = "20" + m.group(1)[0:2]
    album = m.group(2)
    performer = m.group(3)
    with open(filename + ".cue", "w") as f:
        print("REM GENRE Anime\n"
              "REM DATE %s\n"
              "PERFORMER \"%s\"\n"
              "TITLE \"%s\"\n"
              "FILE \"%s\" WAVE\n" % (year, performer, album, filename + ".tak"), file=f)
        for i in track_list:
            print("  TRACK %s AUDIO\n"
                  "    TITLE \"\"\n"
                  "    PERFORMER \"%s\"\n"
                  "    INDEX 01 %s\n" % (i[0], performer, i[1]), file=f)

if __name__ == '__main__':
    main()
