import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        splitted = line.split("\t")
        (key, letters) = (int(splitted[0]), splitted[1].replace("\n", ""))
        for letter in letters.split(","):
            values = results.get(letter, None)
            if values is None:
                results[letter] = [key]
                continue
            results[letter].append(key)

    for (key, values) in sorted(results.items()):
        values = sorted(values)
        sys.stdout.write("{}\t{}\n".format(key, ','.join(map(str, values))))
