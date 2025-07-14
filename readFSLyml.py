#!/usr/bin/env python3
yml = open("fsl-6.0.7_linux-64.yml")
prt = False
for line in yml:
    line = line.replace("\n","").replace(" - ","").replace("*openmp*","").replace(" ","=")
    if prt:
        print(f"{line}")
    if "dependencies" in line:
        prt = True
