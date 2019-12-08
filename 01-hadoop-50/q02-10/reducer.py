import sys

#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        (key, value) = line.split("\t")
        if not key in results:
            results[key] = int(value)
        else:
            new_value = int(value)
            if new_value > results[key]:
                results[key] = new_value

    for (key, value) in sorted(results.items()):
        sys.stdout.write("{}\t{}\n".format(key, value))
