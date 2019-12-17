import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        splitted = line.split("\t")
        (key, date, value) = (splitted[0], splitted[1], splitted[2])
        values = results.get(key, None)
        if values is None:
            results[key] = {int(value): date}
        else:
            results[key].update({int(value): date})

    for (key, values) in sorted(results.items()):
        for value in sorted(values.items()):
            sys.stdout.write("{}\t{}\t{}\n".format(key, value[1], value[0]))
