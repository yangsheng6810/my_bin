#!/bin/bash
FROM_ENCODING="gb2312"
# FROM_ENCODING="euc-jp"
# FROM_ENCODING="shift_jis"
convmv -f utf8 -t iso88591 *.xlsx --notest --nosmart && convmv -f $FROM_ENCODING -t utf8 *.xlsx --notest --nosmart;
