import sys
import datetime
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == "__main__":
    results = {}
    for line in sys.stdin:
        splitted = line.split("\t")
        (key, date, value) = (splitted[0], splitted[1], splitted[2])
        date_time_str = "{} 00:00:00.0".format(date)
        date_time_obj = datetime.datetime.strptime(date_time_str, '%Y-%m-%d %H:%M:%S.%f')
        new_timestamp = date_time_obj.timestamp()
        if not key in results:
            results[key] = {"value": int(value), "timestamp": new_timestamp}
        else:
            if new_timestamp < results[key]["timestamp"]:
                results[key] = {"value": int(value), "timestamp": new_timestamp}

    for (key, value) in sorted(results.items()):
        sys.stdout.write("{},{}\n".format(key, value["value"]))
