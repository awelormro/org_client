import os
import re


def obtain_cwd() -> str:
    return os.getcwd()


def read_file(file: str) -> list:
    file_path = expand_full_path(file)
    file_open = open(file_path)
    return file_open.read()


def write_dump():
    pass


def expand_full_path(filepath: str) -> str:
    if filepath[0] == '~/':
        return os.path.join(filepath)
    pass


def tests_filepath():
    test_1_res = '/home/abu/Documentos/calificaciones_institucional.xlsx'
    test_1_str = "~/Documentos/calificaciones_institucional.xlsx"
    print(os.path.abspath(test_1_str[2:]))
    print(test_1_res == os.path.abspath(test_1_str[2:]))


tests_filepath()
