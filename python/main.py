from orglib import *
from pathlib import Path
import sys


def read_file():
    if "--complete_from_command" in sys.argv:
        read_first_line = True
    if read_first_line:
        file_name = open("~/.fifo.org").expanduser()
    else:
        if file_name:
            cosa = False
    print(cosa)


def obtain_file_name(file_name: str) -> str:
    pass
