#!/usr/bin/python

import os, sys, re, StringIO
import fcntl, termios, struct

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    ERROR = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

input = sys.stdin

while True:
    try:
        line = input.readline()
    except KeyboardInterrupt:
        break

    if line.find("UnityEngine.Debug:Internal_Log") == -1 and line.find("UnityEngine.Debug:Log") == -1 and line.find("(Filename: Assets/") == -1:
        pattern = re.compile('\[.*\]')
        
        if pattern.match(line):
            tag = pattern.search(line).group(0);
            result = line.split(tag)
            sys.stdout.write(bcolors.HEADER + tag + bcolors.WARNING + result[1] + bcolors.ENDC)
        else:
            sys.stdout.write(line)

    if len(line) == 0: break












