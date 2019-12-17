import sys
import statistics
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        splitted = line.split("\t")
        (key, date, value) = (splitted[0], splitted[1], float(splitted[2]))
        values = results.get(key, None)
        if values is None:
            results[key] = [value]
        else:
            results[key].append(value)

    for (key, values) in sorted(results.items()):
        sys.stdout.write("{}\t{}\t{}\n".format(key, sum(values), statistics.mean(values)))
