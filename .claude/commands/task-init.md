---
description: Initialize task management system with exact folder structure and configuration files. No ambiguity, no guesswork.
allowed-tools: [Write, Bash]
---

# Task Management System Initialization

I will set up the complete task management system with the exact structure required. No guessing, no assumptions.

## Command Arguments
$ARGUMENTS

## Check for Help
!bash -c 'if [[ "$ARGUMENTS" == *"--help"* ]]; then
  echo "# Task Init Help"
  echo ""
  echo "Usage: /task-init [options]"
  echo ""
  echo "Options:"
  echo "  --force      Overwrite existing files (default: skip existing)"
  echo "  --help       Show this help message"
  echo ""
  echo "This command will create:"
  echo "  - tasks/                    # Root task directory"
  echo "  - tasks/task-registry.json  # Central registry (v2.0)"
  echo "  - tasks/active/             # Active tasks workspace"
  echo "  - tasks/completed/          # Completed tasks archive"
  echo "  - tasks/verification-targets/ # Visual targets & examples"
  echo "  - Each task folder contains: spec.md, scratchpad.md, files/, targets/"
  echo "  - tasks/task-template-spec.md # Specification template"
  echo "  - tasks/README.md           # Task system documentation"
  echo ""
  echo "Example:"
  echo "  /task-init                  # Initialize with defaults"
  echo "  /task-init --force          # Overwrite existing setup"
  exit 0
fi'

## Parse Options
!bash -c '
FORCE=false
PROJECT_NAME=$(basename "$PWD")

for arg in $ARGUMENTS; do
  case $arg in
    --force) FORCE=true ;;
  esac
done

echo "Configuration:"
echo "  Force overwrite: $FORCE"
echo "  Project name: $PROJECT_NAME (from current directory)"
'

## Step 1: Create Directory Structure

### 1.1 Create main directories
!bash -c 'mkdir -p tasks/active tasks/completed tasks/verification-targets'

### 1.2 Verify directory creation
!bash -c 'ls -la tasks/'

## Step 2: Create Task Registry

### Check if registry exists
!bash -c '[[ -f "tasks/task-registry.json" ]] && echo "EXISTS" || echo "CREATE"'

### Create registry with exact structure
I will now create the task registry with the following exact content:
- Version: 2.0.0
- Project name: Current directory name
- Timestamps: Current UTC time
- All required sections with empty initial state

The registry will have these exact keys:
- metadata (version, created, project, description)
- settings (limits, counters starting at 1, thinking_defaults)
- sync_rules (update protocol)
- priority_queue (critical, high, medium, low arrays)
- active_tasks (empty object)
- completed_tasks (empty object)
- task_locks (empty object)
- execution_history (empty array)
- thinking_metrics (default_mode, subagent_tracking)
- last_registry_update (current timestamp)
- registry_checksum (empty string)

## Step 3: Create Task Template

### Check if template exists
!bash -c '[[ -f "tasks/task-template-spec.md" ]] && echo "EXISTS" || echo "CREATE"'

### Template will contain exact structure
The template file will have these exact sections:
1. CRITICAL registry update protocol (mandatory)
2. Task identification (ID, title, priority, timestamps)
3. Task boundaries (allowed/forbidden directories)
4. Dependencies (task IDs, external deps)
5. Implementation steps (subtasks with registry updates)
6. Verification targets (visual targets, expected outputs)
7. Success criteria (checklist format)
8. Testing requirements
9. Error handling procedures
10. Documentation requirements
11. Registry update JSON example

```markdown
# Task #X Specification

## CRITICAL: Registry Update Protocol
**FAILURE TO UPDATE REGISTRY AFTER EACH SUBTASK = TASK FAILURE**

1. After EVERY subtask completion, update `tasks/task-registry.json`
2. Include: task_id, subtask_id, status, timestamp
3. Use atomic writes to prevent corruption
4. Verify update success before proceeding

## Task Identification
- **Task ID**: X (simple number)
- **Title**: [Clear, descriptive title]
- **Type**: [feature/bug/refactor/hotfix]
- **Priority**: [critical/high/medium/low]
- **Parent Task**: [ID if this is a bug fix for completed task]
- **Related Tasks**: [IDs of related tasks]
- **Created**: [timestamp]
- **Assigned Agent**: [AGENT-X or null]

## Task Boundaries

### Allowed Directories (ONLY modify files here)
- `src/modules/[specific]/`
- `tests/[specific]/`
- `tasks/active/task-X/` (your workspace)
  - `spec.md` (task specification)
  - `scratchpad.md` (working notes)
  - `files/` (task-specific files)
  - `targets/` (verification targets)

### Forbidden Directories (NEVER modify)
- `tasks/task-registry.json` (except status updates)
- `tasks/active/task-Y/` (other agent workspaces)
- `.claude/` (command definitions)
- Any paths not explicitly listed in allowed

## Dependencies
- Required tasks to complete first: [2, 3] (task IDs)
- External dependencies: [APIs, services, packages]
- Shared resources: [files that multiple tasks need]

## Implementation Steps

### Subtask 1: [Title] (1.1)
**Objective**: Clear goal for this subtask
**Steps**:
1. Specific action
2. Another action
3. Validate result

**Registry Update**: Mark subtask 1.1 as complete

### Subtask 2: [Title] (1.2)
**Objective**: Clear goal for this subtask
**Steps**:
1. Specific action
2. Another action
3. Test implementation

**Registry Update**: Mark subtask 1.2 as complete

### Subtask 3: [Title] (1.3)
**Objective**: Clear goal for this subtask
**Steps**:
1. Specific action
2. Another action
3. Document changes

**Registry Update**: Mark subtask 1.3 as complete

## Success Criteria
- [ ] All subtasks marked complete in registry
- [ ] No registry sync errors
- [ ] All tests passing
- [ ] Code follows project conventions
- [ ] No modifications outside allowed paths

## Testing Requirements
- Unit tests for new functionality
- Integration tests if applicable
- Manual testing steps
- Performance benchmarks

## Error Handling
- Expected errors and how to handle
- Rollback procedures if needed
- Who to notify on critical failures

## Documentation
- Update relevant documentation
- Add inline comments for complex logic
- Update README if needed

## Notes and Considerations
- Special considerations
- Performance implications
- Security considerations
- Future improvements

## Registry Update Example
```json
{
  "1": {
    "subtasks": [
      {
        "id": "1.1",
        "description": "Subtask description",
        "status": "completed",
        "completed_at": "2025-07-10T10:30:00Z",
        "completed_by": "AGENT-1"
      }
    ],
    "last_updated": "2025-07-10T10:30:00Z",
    "progress_percentage": 33
  }
}
```

Remember: **UPDATE REGISTRY AFTER EVERY SUBTASK!**
```

!bash -c '
if [[ -f "tasks/task-template-spec.md" && "$FORCE" != "true" ]]; then
  echo "Template exists. Skipping (use --force to overwrite)"
else
  echo "Creating task-template-spec.md..."
fi
'

## Step 4: Create README Documentation

### Check if README exists
!bash -c '[[ -f "tasks/README.md" ]] && echo "EXISTS" || echo "CREATE"'

### README will contain exact sections
The README will have these exact sections in order:
1. Overview - System description
2. Quick Start - Basic commands
3. Task Lifecycle - States and transitions
4. Priority Levels - critical, high, medium, low
5. File Structure - Exact directory layout
6. Registry Synchronization Rules
7. Common Workflows - Feature, bug fix, hotfix
8. Task Specification Format
9. Agent Isolation - Security boundaries
10. Best Practices
11. Troubleshooting
12. Advanced Usage
13. Command Options Reference
14. Key Principles

## Step 5: Verification

### 5.1 Verify all directories exist
!bash -c '
echo "Verifying directory structure:"
for dir in tasks tasks/active tasks/completed tasks/verification-targets; do
  if [[ -d "$dir" ]]; then
    echo "✓ $dir exists"
  else
    echo "✗ $dir missing - ERROR"
  fi
done
'

### 5.2 Verify all files exist
!bash -c '
echo ""
echo "Verifying files:"
for file in tasks/task-registry.json tasks/task-template-spec.md tasks/README.md; do
  if [[ -f "$file" ]]; then
    echo "✓ $file exists"
  else
    echo "✗ $file missing (may need --force to create)"
  fi
done
'

### 5.3 Verify registry structure
!bash -c '
if [[ -f "tasks/task-registry.json" ]]; then
  echo ""
  echo "Verifying registry structure:"
  # Check for required keys
  for key in metadata settings sync_rules priority_queue active_tasks completed_tasks; do
    if grep -q "\"$key\"" tasks/task-registry.json; then
      echo "✓ Registry has $key section"
    else
      echo "✗ Registry missing $key section - ERROR"
    fi
  done
fi
'

## Step 6: Final Summary

!bash -c '
echo ""
echo "========================================="
echo "Task Management System Initialization"
echo "========================================="
echo ""
echo "Directory Structure:"
echo "tasks/"
echo "├── task-registry.json      # Central registry (v2.0.0)"
echo "├── README.md               # Documentation"
echo "├── active/                 # Active tasks"
echo "│   └── task-X/            # Task folder"
echo "│       ├── spec.md       # Task specification"
echo "│       ├── scratchpad.md # Working notes"
echo "│       ├── files/        # Task files"
echo "│       └── targets/      # Verification targets"
echo "├── completed/              # Completed task archives"
echo "└── verification-targets/   # Shared visual targets"
echo ""
echo "Next Steps:"
echo "1. Run: /task-plan              # Create your first task"
echo "2. Run: /task-execute           # Execute pending tasks"
echo "3. Run: /task-status            # Monitor progress"
echo ""
echo "For help with any command, add --help"
echo "Example: /task-plan --help"
'

## Implementation Details

### Exact File Creation Process

When CREATE is needed, I will:

1. **For task-registry.json**: Write exact JSON with:
   - Current timestamp in ISO format
   - Project name from current directory
   - Version 2.0.0
   - All counters starting at 1
   - Empty arrays and objects as specified
   - Thinking defaults: mode="think-hard", subagent_tracking=true

2. **For task-template-spec.md**: Write exact markdown with:
   - All mandatory sections
   - Placeholder values marked with [brackets]
   - Example JSON for registry updates
   - Critical warnings about registry sync

3. **For README.md**: Write exact documentation with:
   - All 14 sections listed above
   - Command examples with new number format
   - Troubleshooting for common issues
   - No assumptions about user's project

### Validation After Creation

I will verify:
1. All 3 directories exist with correct permissions
2. All 3 files exist and are readable
3. JSON file is valid and parseable
4. All required keys exist in registry
5. No extra files were created

### Error Handling

If any step fails:
1. Report exact error message
2. List what was successfully created
3. Provide exact fix command
4. Never proceed if critical step fails
5. No guessing - only factual reports