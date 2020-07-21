find . \( -follow -name '*.[c,h]' -o -name '*.reg[c,h]' \) -ls | sed 's/.*\.\///' > cscope-files

/users/soma/bin/cscope -b -q -i cscope-files -Isys/h -Isys
