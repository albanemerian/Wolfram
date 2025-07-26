#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Test counter
TOTAL=0
FAILED=0

# Function to run test and compare outputs
run_test() {
    local cmd="$1"
    TOTAL=$((TOTAL + 1))

    # Run both programs and capture their outputs and return codes
    output1=$(./wolfram $cmd 2>&1)
    ret1=$?
    output2=$(./wolfram-lol $cmd 2>&1)
    ret2=$?

    # List of error case patterns
    if [[ $cmd == *"--rule invalid"* ]] || \
       [[ $cmd == "--rule" ]] || \
       [[ $cmd == *"--start invalid"* ]] || \
       [[ $cmd == *"--window invalid"* ]] || \
       [[ $cmd == *"--move"* && ! $cmd =~ "--move "[0-9] ]] || \
       [[ $cmd == "--rule 999" ]] || \
       [[ $cmd == "--start 5" ]] || \
       [[ $cmd == *"--lines invalid"* ]] || \
       [[ $cmd == *"--window -1"* ]] || \
       [[ $cmd == "--invalid-flag"* ]]; then
        if [ $ret1 -eq 84 ] && [ $ret2 -eq 84 ]; then
            echo -e "${GREEN}✓ Test $TOTAL passed: $cmd${NC}"
        else
            echo -e "${RED}✗ Test $TOTAL failed: $cmd${NC}"
            echo "Expected return code 84"
            echo "Got: $ret1 (wolfram) and $ret2 (wolfram-test)"
            FAILED=$((FAILED + 1))
        fi
    else
        # For valid cases, compare both output and return code
        if [ "$output1" == "$output2" ] && [ $ret1 -eq $ret2 ]; then
            echo -e "${GREEN}✓ Test $TOTAL passed: $cmd${NC}"
        else
            echo -e "${RED}✗ Test $TOTAL failed: $cmd${NC}"
            echo "Command used: ./wolfram $cmd"
            FAILED=$((FAILED + 1))
        fi
    fi
}

# Rule 30 tests
echo "Testing Rule 30..."
run_test "--rule 30 --lines 5 --window 50"
run_test "--rule 30 --lines 5"
run_test "--rule 30 --lines 10 --start 5"
run_test "--rule 30 --lines 3 --window 40"
run_test "--rule 30 --lines 40 --start 20"
run_test "--rule 30 --lines 100 --start 60"
run_test "--rule 30 --lines 10 --start 70"
# run_test "--rule 30 --lines 5 --move"
# run_test "--rule 30 --lines 8 --window 50 --move -2"
run_test "--rule 30 --lines 4 --window 30 --start 3"
run_test "--rule 30 --lines 6 --window 60 --start 2"
# run_test "--rule 30 --lines 7 --window 45 --start 1 --move -1"
run_test "--rule 30 --lines 5 --window 35"
run_test "--rule 30 --lines 9 --window 55 --start 4"

# Rule 90 tests
echo "Testing Rule 90..."
run_test "--rule 90 --lines 5"
run_test "--rule 90 --lines 10 --start 5"
run_test "--rule 90 --lines 3 --window 40"
# run_test "--rule 90 --lines 5 --move"
# run_test "--rule 90 --lines 8 --window 50 --move -2"
run_test "--rule 90 --lines 4 --window 30 --start 3"
run_test "--rule 90 --lines 6 --window 60 --start 2"
# run_test "--rule 90 --lines 7 --window 45 --start 1 --move -1"
run_test "--rule 90 --lines 5 --window 35"
run_test "--rule 90 --lines 9 --window 55 --start 4"
run_test "--rule 90 --lines 40 --start 20"
run_test "--rule 90 --lines 100 --start 60"
run_test "--rule 90 --lines 10 --start 70"

# Rule 110 tests
echo "Testing Rule 110..."
run_test "--rule 110 --lines 5"
run_test "--rule 110 --lines 10 --start 5"
run_test "--rule 110 --lines 3 --window 40"
# run_test "--rule 110 --lines 5 --move"
# run_test "--rule 110 --lines 8 --window 50 --move -2"
run_test "--rule 110 --lines 4 --window 30 --start 3"
run_test "--rule 110 --lines 6 --window 60 --start 2"
# run_test "--rule 110 --lines 7 --window 45 --start 1 --move -1"
run_test "--rule 110 --lines 5 --window 35"
run_test "--rule 110 --lines 9 --window 55 --start 4"
run_test "--rule 110 --lines 40 --start 20"
run_test "--rule 110 --lines 100 --start 60"
run_test "--rule 110 --lines 10 --start 70"

# Error cases
echo "Testing error cases..."
run_test "--rule invalid"
run_test "--rule"
run_test "--rule 30 --start invalid"
run_test "--rule 30 --window invalid"
run_test "--rule 30 --move"
run_test "--rule 999"
run_test "--start 5"
run_test "--rule 30 --lines invalid"
run_test "--rule 30 --window -1"
run_test "--invalid-flag"
run_test "--rule 30 --lines 20 50 50"
run_test "--rule 30 --lines 20 --new 50"
# Print summary
echo "----------------------------------------"
echo "Test Summary:"
echo "Total tests: $TOTAL"
echo "Failed tests: $FAILED"
echo "Passed tests: $((TOTAL - FAILED))"

# Exit with status code based on test results
if [ $FAILED -eq 0 ]; then
    exit 0
else
    exit 1
fi
