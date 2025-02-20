#!/bin/bash

#┌──────────────────────────────────────────────────────────┐
#│ Test suite auto-generated for VSTax installation checks. │
#└──────────────────────────────────────────────────────────┘

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Initialize counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Test function
run_test() {
    local test_name="$1"
    local test_command="$2"

    ((TESTS_RUN++))
    printf "Testing %-50s" "$test_name..."

    if eval "$test_command" > /dev/null 2>&1; then
        echo -e "${GREEN}[ PASS ]${NC}"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}[ FAIL ]${NC}"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Header
echo -e "${BOLD}VSTax Installation Test Suite${NC}"
echo "================================"
echo

# System Requirements Tests
echo -e "${BOLD}System Requirements Tests:${NC}"
run_test "System has sufficient memory" "free -m | awk '/^Mem:/ {print \$2}' | grep -q '^[0-9]\{4,\}'"

# Basic Package Installation Tests
echo -e "\n${BOLD}Package Installation Tests:${NC}"
run_test "Package is installed" "pacman -Q vstax"
run_test "Java runtime is available" "which java"
run_test "XDG utils are installed" "pacman -Q xdg-utils"

# File Structure Tests
echo -e "\n${BOLD}File Structure Tests:${NC}"
run_test "Application directory exists" "[ -d /usr/share/java/vstax2024 ]"
run_test "Launcher script exists" "[ -x /usr/bin/vstax2024 ]"
run_test "Desktop file exists" "[ -f /usr/share/applications/vstax2024.desktop ]"
run_test "MIME type file exists" "[ -f /usr/share/mime/packages/vstax2024.xml ]"

# Permission Tests
echo -e "\n${BOLD}Permission Tests:${NC}"
run_test "Launcher script is executable" "[ -x /usr/bin/vstax2024 ]"
run_test "Application directory is readable" "[ -r /usr/share/java/vstax2024 ]"

# Display Environment Tests
echo -e "\n${BOLD}Display Environment Tests:${NC}"
run_test "Display server is available" "[ -n \"$DISPLAY\" ] || [ -n \"$WAYLAND_DISPLAY\" ]"
run_test "libxrender is installed" "pacman -Q libxrender"
run_test "libxtst is installed" "pacman -Q libxtst"

# Configuration Tests
echo -e "\n${BOLD}Configuration Tests:${NC}"
run_test "Default browser is set" "xdg-settings get default-web-browser >/dev/null 2>&1"
run_test "MIME database is updated" "grep -q 'vstax2024' /usr/share/mime/mime.cache"

# Content Validation Tests
echo -e "\n${BOLD}Content Validation Tests:${NC}"
run_test "Desktop file has correct Exec path" "grep -q 'Exec=/usr/bin/vstax2024' /usr/share/applications/vstax2024.desktop"
run_test "Desktop file has correct icon path" "grep -q 'Icon=/usr/share/java/vstax2024' /usr/share/applications/vstax2024.desktop"

# Java Environment Tests
echo -e "\n${BOLD}Java Environment Tests:${NC}"
run_test "Java launcher exists" "[ -f /usr/share/java/vstax2024/jfw-launcher-8.0.1-obf.jar ]"

# Summary
echo -e "\n${BOLD}Test Summary:${NC}"
echo "--------------------------------"
echo -e "Total tests run:    ${BOLD}$TESTS_RUN${NC}"
echo -e "Tests passed:       ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests failed:       ${RED}$TESTS_FAILED${NC}"

# Final status
if [ $TESTS_FAILED -eq 0 ]; then
    echo -e "\n${GREEN}${BOLD}✔ All tests passed successfully${NC}"
    exit 0
else
    echo -e "\n${RED}${BOLD}✘ Some tests failed${NC}"
    exit 1
fi
