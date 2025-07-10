---
description: Clear all tasks and reset the task management system to start fresh
allowed-tools: [Read, Write, Bash]
---

@include shared/task-management/registry-patterns.yml#Registry_Structure
@include shared/task-management/thinking-patterns.yml#Default_Behavior

# Task Management System Clear

I'll help you clear the task management system to start fresh.

## Command Arguments
$ARGUMENTS

@include shared/task-management/command-patterns.yml#Help_Detection

## Check for Help
!bash -c 'if [[ "$ARGUMENTS" == *"--help"* ]]; then
  echo "# Task Clear Help"
  echo ""
  echo "Usage: /task-clear [options]"
  echo ""
  echo "Options:"
  echo "  --all          Clear everything (default)"
  echo "  --active       Clear only active tasks"
  echo "  --completed    Clear only completed tasks"
  echo "  --keep-specs   Keep specification files"
  echo "  --preserve-context  Keep verification targets and thinking logs"
  echo "  --backup       Create backup before clearing"
  echo "  --force        Skip confirmation prompt"
  echo "  --help         Show this help message"
  echo ""
  echo "Examples:"
  echo "  /task-clear                    # Clear all with confirmation"
  echo "  /task-clear --force            # Clear all without confirmation"
  echo "  /task-clear --backup           # Backup then clear all"
  echo "  /task-clear --active --force   # Clear only active tasks"
  echo ""
  echo "WARNING: This will delete task data permanently!"
  exit 0
fi'

## Parse Options
!bash -c '
CLEAR_ALL=true
CLEAR_ACTIVE=false
CLEAR_COMPLETED=false
KEEP_SPECS=false
PRESERVE_CONTEXT=false
CREATE_BACKUP=false
FORCE=false

for arg in $ARGUMENTS; do
  case $arg in
    --active) CLEAR_ALL=false; CLEAR_ACTIVE=true ;;
    --completed) CLEAR_ALL=false; CLEAR_COMPLETED=true ;;
    --keep-specs) KEEP_SPECS=true ;;
    --preserve-context) PRESERVE_CONTEXT=true ;;
    --backup) CREATE_BACKUP=true ;;
    --force) FORCE=true ;;
  esac
done

echo "Clear Configuration:"
echo "  Clear all: $CLEAR_ALL"
echo "  Clear active: $CLEAR_ACTIVE"
echo "  Clear completed: $CLEAR_COMPLETED"  
echo "  Keep specs: $KEEP_SPECS"
echo "  Preserve context: $PRESERVE_CONTEXT"
echo "  Create backup: $CREATE_BACKUP"
echo "  Force: $FORCE"
'

## Step 1: Confirmation

!bash -c '
if [[ "$FORCE" != "true" ]]; then
  echo ""
  echo "⚠️  WARNING: This will permanently delete task data!"
  echo ""
  echo "The following will be cleared:"
  if [[ "$CLEAR_ALL" == "true" ]]; then
    echo "  ✗ All active tasks and workspaces (tasks/active/)"
    echo "  ✗ All completed tasks (tasks/completed/)"
    if [[ "$KEEP_SPECS" != "true" ]]; then
      echo "  ✗ All task specifications and scratchpads"
    fi
    if [[ "$PRESERVE_CONTEXT" != "true" ]]; then
      echo "  ✗ All verification targets and thinking logs"
    fi
    echo "  ✗ Task registry (reset to initial state)"
  elif [[ "$CLEAR_ACTIVE" == "true" ]]; then
    echo "  ✗ Active tasks only (tasks/active/task-*/)"
    if [[ "$KEEP_SPECS" != "true" ]]; then
      echo "  ✗ Active task specifications and scratchpads"
    fi
  elif [[ "$CLEAR_COMPLETED" == "true" ]]; then
    echo "  ✗ Completed tasks only (tasks/completed/task-*/)"
  fi
  echo ""
  echo "Type YES to confirm (use --force to skip this prompt)"
else
  echo "Force mode enabled - skipping confirmation"
fi
'

## Step 2: Create Backup (if requested)

!bash -c '
if [[ "$CREATE_BACKUP" == "true" ]]; then
  echo ""
  echo "Creating backup..."
  BACKUP_DIR="tasks_backup_$(date +%Y%m%d_%H%M%S)"
  cp -r tasks "$BACKUP_DIR"
  echo "✓ Backup created: $BACKUP_DIR"
fi
'

## Step 3: Clear Active Tasks

!bash -c '
if [[ "$CLEAR_ALL" == "true" || "$CLEAR_ACTIVE" == "true" ]]; then
  echo ""
  echo "Clearing active tasks..."
  
  # Clear active workspaces (includes specs, scratchpads, and files)
  if [[ -d "tasks/active" ]]; then
    if [[ "$KEEP_SPECS" == "true" ]]; then
      # Keep spec files but clear everything else
      for task_dir in tasks/active/task-*; do
        if [[ -d "$task_dir" ]]; then
          # Save spec temporarily
          [[ -f "$task_dir/spec.md" ]] && cp "$task_dir/spec.md" "$task_dir.spec.tmp"
          # Save context if requested
          if [[ "$PRESERVE_CONTEXT" == "true" ]]; then
            [[ -d "$task_dir/targets" ]] && cp -r "$task_dir/targets" "$task_dir.targets.tmp"
            [[ -f "$task_dir/thinking.log" ]] && cp "$task_dir/thinking.log" "$task_dir.thinking.tmp"
          fi
          # Clear directory
          rm -rf "$task_dir"/*
          # Restore spec
          [[ -f "$task_dir.spec.tmp" ]] && mkdir -p "$task_dir" && mv "$task_dir.spec.tmp" "$task_dir/spec.md"
          # Restore context if saved
          if [[ "$PRESERVE_CONTEXT" == "true" ]]; then
            [[ -d "$task_dir.targets.tmp" ]] && mv "$task_dir.targets.tmp" "$task_dir/targets"
            [[ -f "$task_dir.thinking.tmp" ]] && mv "$task_dir.thinking.tmp" "$task_dir/thinking.log"
          fi
        fi
      done
      echo "✓ Cleared active workspaces (kept specifications)"
    else
      rm -rf tasks/active/*
      echo "✓ Cleared active workspaces"
    fi
  fi
fi
'

## Step 4: Clear Completed Tasks

!bash -c '
if [[ "$CLEAR_ALL" == "true" || "$CLEAR_COMPLETED" == "true" ]]; then
  echo ""
  echo "Clearing completed tasks..."
  
  if [[ -d "tasks/completed" ]]; then
    if [[ "$PRESERVE_CONTEXT" == "true" ]]; then
      # Archive thinking logs and targets before clearing
      mkdir -p tasks/archived-context
      find tasks/completed -name "targets" -type d -exec cp -r {} tasks/archived-context/ \; 2>/dev/null
      find tasks/completed -name "thinking.log" -type f -exec cp {} tasks/archived-context/ \; 2>/dev/null
      echo "✓ Archived verification targets and thinking logs"
    fi
    rm -rf tasks/completed/*
    echo "✓ Cleared completed tasks"
  fi
fi
'

## Step 5: Clean up empty directories

!bash -c '
echo ""
echo "Cleaning up empty directories..."

# Remove any empty task directories
if [[ -d "tasks/active" ]]; then
  find tasks/active -type d -empty -delete 2>/dev/null
fi

if [[ -d "tasks/completed" ]]; then
  find tasks/completed -type d -empty -delete 2>/dev/null
fi

echo "✓ Cleaned up empty directories"
'

## Step 6: Reset Task Registry

### Check current state
@tasks/task-registry.json

### Reset registry to initial state
I'll reset the task registry with:
- Version 2.0.0
- All counters reset to 1
- Empty task queues
- Clear execution history
- Fresh timestamp

@include shared/task-management/registry-patterns.yml#Registry_Structure
@include shared/task-management/thinking-patterns.yml#Budget_Tracking

The registry will be reset to this exact state:
```json
{
  "metadata": {
    "version": "2.0.0",
    "created": "[CURRENT_DATE]",
    "project": "[PROJECT_NAME]",
    "description": "Central registry for task management - CRITICAL: Must be updated after EVERY subtask"
  },
  "settings": {
    "parallel_execution_limit": 5,
    "auto_save_interval": 300,
    "critical_mode": false,
    "next_task_id": 1,
    "next_agent_id": 1,
    "default_thinking_mode": "think-hard",
    "subagent_tracking": true
  },
  "sync_rules": {
    "update_frequency": "after_every_subtask",
    "failure_mode": "halt_execution",
    "validation": "checksum_verification",
    "conflict_resolution": "timestamp_based"
  },
  "priority_queue": {
    "critical": [],
    "high": [],
    "medium": [],
    "low": []
  },
  "active_tasks": {},
  "completed_tasks": {},
  "task_locks": {},
  "execution_history": [],
  "thinking_metrics": {
    "default_mode": "think-hard",
    "total_thoughts": 0,
    "subagent_delegations": 0,
    "ultrathink_uses": 0
  },
  "last_registry_update": "[CURRENT_TIMESTAMP]",
  "registry_checksum": ""
}
```

## Step 7: Verification

!bash -c '
echo ""
echo "Verifying clear operation..."
echo ""

# Check active tasks
ACTIVE_COUNT=$(find tasks/active -type f 2>/dev/null | wc -l)
echo "Active task files: $ACTIVE_COUNT"

# Check completed tasks  
COMPLETED_COUNT=$(find tasks/completed -type f 2>/dev/null | wc -l)
echo "Completed task files: $COMPLETED_COUNT"

# Check task directories
ACTIVE_DIRS=$(find tasks/active -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
COMPLETED_DIRS=$(find tasks/completed -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
echo "Active task directories: $ACTIVE_DIRS"
echo "Completed task directories: $COMPLETED_DIRS"

echo ""
if [[ $ACTIVE_COUNT -eq 0 && $COMPLETED_COUNT -eq 0 ]] || 
   ([[ "$KEEP_SPECS" == "true" ]] && [[ $ACTIVE_DIRS -gt 0 || $COMPLETED_DIRS -gt 0 ]]); then
  echo "✓ Task system successfully cleared!"
else
  echo "⚠️  Some files may remain - check manually"
fi
'

## Step 8: Final Summary

!bash -c '
echo ""
echo "========================================="
echo "Task Management System Clear Complete"
echo "========================================="
echo ""
echo "The system has been reset to initial state."
echo ""
echo "Next steps:"
echo "1. Run: /task-plan    # Create new tasks"
echo "2. Run: /task-status  # Verify empty state"
echo ""
if [[ "$CREATE_BACKUP" == "true" ]]; then
  echo "Your backup is saved in: $BACKUP_DIR"
fi
'