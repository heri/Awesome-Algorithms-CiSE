import multiprocessing as mpt
import time

from sys import argv, exit


# make sure to have input arguments
def sleep_sort(n):
    time.sleep(n)
    print(n)

    argv = argv[1:]
    job = []

    for i in argv:
        try:
            i = float(i)
            p = mpt.Process(target=sleep_sort, args=(i,))
            p.start()
            job.append(p)
