#!/bin/bash

as -gstabs -o printInt.o printInt.s;
as -gstabs -o printString.o printString.s;
as -gstabs -o main.o main.s;
ld -O0 printInt.o printString.o main.o -o test;
./test;