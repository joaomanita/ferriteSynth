#!/usr/bin/env bash

set -u

TEST_ROOT="$HOME/Tese/ferriteSynth/tests"
OUTPUT_ROOT="$HOME/Tese/rustapps/ferrite/ferrite-demo/examples"
EXEC="dune exec bin/main.exe"

run_test() {
    local file="$1"

    echo "Running: $file"

    local output="$OUTPUT_ROOT/$(basename "${file%.txt}").rs"

    mkdir -p "$OUTPUT_ROOT"

    local start end duration
    local stdout

    start=$(date +%s%N)

    if stdout=$($EXEC "$file" 2>/dev/null); then
        end=$(date +%s%N)
        duration=$(awk "BEGIN {printf \"%.3f\", ($end - $start) / 1000000000}")

        local rules
        rules=$(echo "$stdout" | sed -n 's/^Rules applied: //p')
        failed_branches=$(echo "$stdout" | sed -n 's/^Failed branches: //p')

        cp "$file.out" "$output"

        echo "SUCCESS: $(basename "$file")"
        echo "Duration: ${duration}s"
        echo "Rules applied: ${rules:-unknown}"
        echo "Failed branches: ${failed_branches:-unknown}"
        echo "Output:  $output"
    else
        echo "FAIL:    $(basename "$file")"
        rm -f "$output"
    fi

    echo
}

run_all() {
    find \
        "$TEST_ROOT/basic_tests" \
        "$TEST_ROOT/ferrite_demos" \
        "$TEST_ROOT/advanced_tests" \
        -type f -name "*.txt" |
    sort |
    while read -r file; do
        run_test "$file"
    done
}

case "${1:-}" in
    all)
        run_all
        ;;
    "")
        echo "Usage:"
        echo "  ./run_tests.sh all"
        echo "  ./run_tests.sh bank.txt"
        echo "  ./run_tests.sh basic_tests/bank.txt"
        exit 1
        ;;
    *)
        if [[ -f "$1" ]]; then
            run_test "$1"
        else
            if [[ -f "$TEST_ROOT/$1" ]]; then
                file="$TEST_ROOT/$1"
            else
                file=$(find "$TEST_ROOT" -name "$1" | head -n 1)
            fi

            if [[ -z "$file" ]]; then
                echo "Test not found: $1"
                exit 1
            fi

            run_test "$file"
        fi
        ;;
esac
