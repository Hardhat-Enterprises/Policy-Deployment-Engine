#!/bin/bash
# Unit tests for policy helpers
# Runs comprehensive test suites for all helper modules with fixtures

# Navigate to repository root
cd "$(git rev-parse --show-toplevel)" || exit 1

echo "Policy Helper Unit Tests"
echo "============================"

# Common fixtures needed by all tests
FIXTURES=(
    "tests/_helpers/fixtures/gcp_storage_bucket/plan.json"
    "tests/_helpers/fixtures/gcp_project/plan.json"
    "tests/_helpers/fixtures/gcp_access_level/plan.json"
)

# Common helper modules
HELPERS=(
    "policies/_helpers/shared.rego"
)

# Test utilities (assertion helpers used by all test files)
TEST_HELPERS=(
    "tests/_helpers/shared_test.rego"
)

FAILED=0
PASSED=0
TOTAL_TESTS_PASSED=0
TOTAL_TESTS_FAILED=0

run_test_suite() {
    local name="$1"
    local test_file="$2"
    local policy_file="$3"
    local include_test_helpers="${4:-true}"  # Default to true
    
    echo ""
    echo "Testing $name..."
    echo "============================"
    
    # Build test command with optional test helpers
    if [ "$include_test_helpers" = "true" ]; then
        output=$(opa test "$test_file" "$policy_file" "${HELPERS[@]}" "${TEST_HELPERS[@]}" "${FIXTURES[@]}" -v 2>&1)
    else
        output=$(opa test "$test_file" "$policy_file" "${HELPERS[@]}" "${FIXTURES[@]}" -v 2>&1)
    fi
    exit_code=$?
    
    echo "$output"
    
    if [ $exit_code -eq 0 ]; then
        ((PASSED++))
        # Count PASS occurrences in individual test lines (format: "data.package.test_name: PASS")
        pass_count=$(echo "$output" | grep -c ": PASS")
        ((TOTAL_TESTS_PASSED += pass_count))
    else
        ((FAILED++))
        # Count both PASS and FAIL occurrences in individual test lines
        pass_count=$(echo "$output" | grep -c ": PASS")
        fail_count=$(echo "$output" | grep -c ": FAIL")
        ((TOTAL_TESTS_PASSED += pass_count))
        ((TOTAL_TESTS_FAILED += fail_count))
    fi
}

# Run all helper test suites
run_test_suite "Shared Helpers" \
    "tests/_helpers/shared_test.rego" \
    "policies/_helpers/shared.rego" \
    "false"  # Don't include shared_test.rego when testing itself

run_test_suite "Blacklist Policy" \
    "tests/_helpers/blacklist_test.rego" \
    "policies/_helpers/policies/blacklist.rego"

run_test_suite "Whitelist Policy" \
    "tests/_helpers/whitelist_test.rego" \
    "policies/_helpers/policies/whitelist.rego"

run_test_suite "Range Policy" \
    "tests/_helpers/range_test.rego" \
    "policies/_helpers/policies/range.rego"

run_test_suite "Pattern Blacklist Policy" \
    "tests/_helpers/pattern_blacklist_test.rego" \
    "policies/_helpers/policies/pattern_blacklist.rego"

run_test_suite "Pattern Whitelist Policy" \
    "tests/_helpers/pattern_whitelist_test.rego" \
    "policies/_helpers/policies/pattern_whitelist.rego"

run_test_suite "Element Blacklist Policy" \
    "tests/_helpers/element_blacklist_test.rego" \
    "policies/_helpers/policies/element_blacklist.rego"

echo ""
echo "================================"
echo "Test Suites: $PASSED passed, $FAILED failed"
echo "Total Tests: $TOTAL_TESTS_PASSED passed, $TOTAL_TESTS_FAILED failed"

exit $FAILED
