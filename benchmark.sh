#!/bin/bash

RUNS=5
OUTPUT_FILE="benchmark_results.txt"

echo "Running $RUNS benchmark iterations..."
echo

# Temporary file containing all raw results
TMP_FILE=$(mktemp)

for i in $(seq 1 $RUNS); do
    echo "========== Run $i/$RUNS =========="

    ./run_tests.sh all | tee /tmp/run_tests_output.txt

    # Extract:
    # test name
    # duration
    # rules
    # failed branches
    awk '
    /^Running:/ {
        test=$2
        sub(/^.*\//, "", test)
        sub(/\.txt$/, "", test)
    }

    /^Duration:/ {
        duration=$2
        gsub(",", ".", duration)
        sub(/s$/, "", duration)
    }

    /^Rules applied:/ {
        rules=$3
    }

    /^Failed branches:/ {
        failures=$3
        print test, duration, rules, failures
    }
    ' /tmp/run_tests_output.txt >> "$TMP_FILE"
        

    echo
done

python3 - "$TMP_FILE" "$OUTPUT_FILE" <<'PY'
import sys
import statistics
from collections import defaultdict

input_file = sys.argv[1]
output_file = sys.argv[2]

results = defaultdict(lambda: {
    "times": [],
    "rules": None,
    "failures": None,
})

with open(input_file) as f:
    for line in f:
        parts = line.split()

        if len(parts) != 4:
            continue

        test, time, rules, failures = parts

        results[test]["times"].append(float(time))
        results[test]["rules"] = int(rules)
        results[test]["failures"] = int(failures)

with open(output_file, "w") as out:
    out.write(
        f"{'Test':<40}"
        f"{'Mean (s)':>12}"
        f"{'Std Dev':>12}"
        f"{'Rules':>12}"
        f"{'Failures':>12}\n"
    )

    out.write("-" * 88 + "\n")

    for test in sorted(results):
        data = results[test]
        times = data["times"]

        mean = statistics.mean(times)
        stddev = statistics.stdev(times) if len(times) > 1 else 0.0

        out.write(
            f"{test:<40}"
            f"{mean:>12.3f}"
            f"{stddev:>12.3f}"
            f"{data['rules']:>12}"
            f"{data['failures']:>12}\n"
        )

print()
print("========== Benchmark Results ==========")
print(
    f"{'Test':<40}"
    f"{'Mean (s)':>12}"
    f"{'Std Dev':>12}"
    f"{'Rules':>12}"
    f"{'Failures':>12}"
)
print("-" * 88)

for test in sorted(results):
    data = results[test]
    times = data["times"]

    mean = statistics.mean(times)
    stddev = statistics.stdev(times) if len(times) > 1 else 0.0

    print(
        f"{test:<40}"
        f"{mean:>12.3f}"
        f"{stddev:>12.3f}"
        f"{data['rules']:>12}"
        f"{data['failures']:>12}"
    )

print()
print(f"Results saved to: {output_file}")
PY

rm "$TMP_FILE"
