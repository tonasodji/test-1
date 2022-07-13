#!/bin/bash

touch makefile
echo "file.o: f.c" > makefile
echo -e "\tgcc -c --all-warnings --extra-warnings -W f.c" >> makefile
pvs-studio-analyzer trace -- make -j8
pvs-studio-analyzer analyze -j8 -l PVS-Studio.lic -o PVS-Studio.log
plog-converter PVS-Studio.log -t sarif -o results.sarif
