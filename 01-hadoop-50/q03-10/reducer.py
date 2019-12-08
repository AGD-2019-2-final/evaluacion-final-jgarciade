import sys

#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        (key, value) = line.split("\t")
        results[key] = int(value)

    for (key, value) in sorted(results.items(), key=lambda kv: (kv[1], kv[0])):
        sys.stdout.write("{},{}\n".format(key, value))
