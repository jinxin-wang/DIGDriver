import multiprocessing as mp

"""check the number of CPU cores to use"""

def get_cpus():
    try:
        c = min(max(1, mp.cpu_count() - 2), 20)
    except:
        c = 5
    return c
