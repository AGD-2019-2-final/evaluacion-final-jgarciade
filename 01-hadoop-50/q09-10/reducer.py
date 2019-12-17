import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        splitted = line.split("\t")
        (key, date, value) = (splitted[0], splitted[1], int(splitted[2]))
        values = results.get(value, None)
        if values is None:
            results[value] = [[key, date]]
        else:
            results[value].append([key, date])

    counted_values = 0
    for (key, values) in sorted(results.items()):
        for value in values:
            sys.stdout.write("{}\t{}\t{}\n".format(value[0], value[1], key))
            counted_values += 1
        if counted_values == 6:
            break
