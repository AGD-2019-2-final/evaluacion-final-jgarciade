import sys

#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    lines_to_skip = 0  # csv header
    skipped_lines = 0
    for line in sys.stdin:
        for column_value in line.split("\n"):
            if skipped_lines < lines_to_skip:
                skipped_lines += 1
                continue
            values = column_value.split(",")
            if len(values) == 21:
                sys.stdout.write("{}\t1\n".format(values[2]))
