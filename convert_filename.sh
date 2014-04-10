#!/bin/bash
convmv -f utf8 -t iso88591 *.psd --notest --nosmart && convmv -f big5 -t utf8 *.psd --notest --nosmart;
