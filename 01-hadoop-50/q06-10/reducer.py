import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#


if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        splitted = line.split("\t")
        (key, date, value) = (splitted[0], splitted[1], splitted[2])
        values = results.get(key, None)
        if values is None:
            results[key] = {"min": float(value), "max": float(value)}
            continue
        new_value = float(value)
        if new_value < results[key]["min"]:
            results[key]["min"] = new_value
            continue
        if new_value > results[key]["max"]:
            results[key]["max"] = new_value

    for (key, value) in sorted(results.items()):
        sys.stdout.write("{}\t{}\t{}\n".format(key, value["max"], value["min"]))
