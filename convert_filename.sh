#!/bin/bash
convmv -f utf8 -t iso88591 *.txt --notest --nosmart && convmv -f gbk -t utf8 *.txt --notest --nosmart;
