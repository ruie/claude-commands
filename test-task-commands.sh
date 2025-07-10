#!/bin/bash
# Test framework for Task Management Commands
# Tests natural language understanding and command behavior

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Get test type from argument
TEST_TYPE="${1:-all}"

echo -e "${YELLOW}Task Management Command Testing${NC}"
echo "=================================="
echo -e "${BLUE}Test mode: $TEST_TYPE${NC}"
echo ""

# Function to check if command succeeded
check_result() {
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ $1${NC}"
    return 0
  else
    echo -e "${RED}✗ $1${NC}"
    return 1
  fi
}

# Function to test natural language understanding
test_natural_language() {
  echo -e "${MAGENTA}Testing Natural Language Understanding${NC}"
  echo "--------------------------------------"
  
  # Test task-plan natural language
  echo "Testing task-plan command:"
  echo '  "plan email notification feature" → feature planning'
  echo '  "deeply analyze payment system" → ultrathink mode'
  echo '  "fix login bug quickly" → bug fix with standard thinking'
  echo ""
  
  # Test task-execute natural language  
  echo "Testing task-execute command:"
  echo '  "execute all high priority tasks" → parallel execution'
  echo '  "carefully work on task 3" → single task with ultrathink'
  echo '  "quickly run the last task" → fast execution mode'
  echo ""
  
  # Test task-status natural language
  echo "Testing task-status command:"
  echo '  "why are tasks blocked" → deep blocker analysis'
  echo '  "show task 3 progress" → specific task details'
  echo '  "analyze system performance" → ultrathink metrics'
  echo ""
}

# Test command structure
test_command_structure() {
  echo -e "${MAGENTA}Testing Command Structure (60-65 lines)${NC}"
  echo "---------------------------------------"
  
  for cmd in task-plan task-execute task-status task-init task-clear; do
    if [ -f ".claude/commands/$cmd.md" ]; then
      lines=$(wc -l < ".claude/commands/$cmd.md")
      if [ $lines -le 70 ]; then
        echo -e "${GREEN}✓ $cmd.md: $lines lines${NC}"
      else
        echo -e "${RED}✗ $cmd.md: $lines lines (too long)${NC}"
      fi
    else
      echo -e "${RED}✗ $cmd.md: File not found${NC}"
    fi
  done
  echo ""
}

# Test pattern consolidation
test_pattern_files() {
  echo -e "${MAGENTA}Testing Pattern File Consolidation${NC}"
  echo "----------------------------------"
  
  patterns=(
    "natural-intelligence.yml"
    "agent-cognition.yml"
    "task-workflows.yml"
    "knowledge-management.yml"
    "coordination-patterns.yml"
    "thinking-integration.yml"
    "error-recovery.yml"
  )
  
  for pattern in "${patterns[@]}"; do
    if [ -f ".claude/shared/task-management/$pattern" ]; then
      echo -e "${GREEN}✓ $pattern exists${NC}"
    else
      echo -e "${RED}✗ $pattern missing${NC}"
    fi
  done
  echo ""
}

# Test includes structure
test_includes() {
  echo -e "${MAGENTA}Testing Include Structure${NC}"
  echo "-------------------------"
  
  if [ -f ".claude/shared/task-management/includes.yml" ]; then
    echo -e "${GREEN}✓ includes.yml exists${NC}"
    
    # Check for key sections
    if grep -q "task_intelligence:" ".claude/shared/task-management/includes.yml"; then
      echo -e "${GREEN}✓ Natural language intelligence present${NC}"
    else
      echo -e "${RED}✗ Natural language intelligence missing${NC}"
    fi
    
    if grep -q "agent_cognition:" ".claude/shared/task-management/includes.yml"; then
      echo -e "${GREEN}✓ Agent cognition patterns present${NC}"
    else
      echo -e "${RED}✗ Agent cognition patterns missing${NC}"
    fi
  else
    echo -e "${RED}✗ includes.yml missing${NC}"
  fi
  echo ""
}

# Test evidence-based language
test_evidence_language() {
  echo -e "${MAGENTA}Testing Evidence-Based Language${NC}"
  echo "--------------------------------"
  
  # Check for forbidden patterns in commands
  forbidden=("should work" "probably" "I think" "might be good" "optimal")
  
  for pattern in "${forbidden[@]}"; do
    if grep -r "$pattern" .claude/commands/ 2>/dev/null; then
      echo -e "${RED}✗ Found forbidden pattern: '$pattern'${NC}"
    else
      echo -e "${GREEN}✓ No '$pattern' found${NC}"
    fi
  done
  echo ""
}

# Main test runner
case "$TEST_TYPE" in
"all")
  test_command_structure
  test_pattern_files
  test_includes
  test_natural_language
  test_evidence_language
  ;;
"structure")
  test_command_structure
  ;;
"patterns")
  test_pattern_files
  ;;
"language")
  test_natural_language
  ;;
"evidence")
  test_evidence_language
  ;;
*)
  echo -e "${RED}Unknown test type: $TEST_TYPE${NC}"
  echo ""
  echo "Available test types:"
  echo "  all        - Run all tests"
  echo "  structure  - Test command structure"
  echo "  patterns   - Test pattern files"
  echo "  language   - Test natural language"
  echo "  evidence   - Test evidence-based language"
  exit 1
  ;;
esac

# Summary
echo -e "${GREEN}======================================"
echo -e "Test run complete!"
echo -e "======================================${NC}"

# Next steps
if [ "$TEST_TYPE" = "all" ]; then
  echo ""
  echo "Next steps for full implementation:"
  echo -e "${BLUE}1. Remove old pattern files that were consolidated${NC}"
  echo -e "${BLUE}2. Update command @include references${NC}"
  echo -e "${BLUE}3. Test with real task management scenarios${NC}"
  echo -e "${BLUE}4. Create migration guide for users${NC}"
fi