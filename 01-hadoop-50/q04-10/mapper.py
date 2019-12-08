import sys

#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    for line in sys.stdin:
        for column_value in line.split("\n"):
            values = column_value.split("   ")
            if len(values) == 3:
                sys.stdout.write("{}\t{}\t{}\n".format(values[0], values[1], values[2]))
