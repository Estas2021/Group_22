#! /bin/bash

cd papka
mkdir papk1 papk2 papk3
cd papk1
touch file.txt file1.txt file2.txt 1.json 2.json
mkdir papk1 papk2 papk3
ls -l
mv papk1/file1.txt file2.txt papk2
