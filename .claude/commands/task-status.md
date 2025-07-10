---
description: Monitor task execution progress and analyze blockers with registry synchronization checks
allowed-tools: [Read, mcp__sequential-thinking__sequentialthinking, Task]
---

@include shared/task-management/task-core-patterns.yml#Task_States
@include shared/task-management/thinking-patterns.yml#Budget_Tracking

# Task Status Monitor

I'll show you the current status of all tasks and verify registry synchronization.

## Command Arguments
$ARGUMENTS

@include shared/task-management/command-patterns.yml#Help_Detection

## Check for Help
!bash -c 'if [[ "$ARGUMENTS" == *"--help"* ]]; then
  echo "# Task Status Help"
  echo ""
  echo "Usage: /task-status [options]"
  echo ""
  echo "Options:"
  echo "  --task <id>          Show specific task details"
  echo "  --format <type>      Output format (table/json/markdown)"
  echo "  --ultrathink         Maximum analysis of blockers (default: think-hard)"
  echo "  --analyze            Deep status analysis with thinking mode"
  echo "  --watch              Live updates every 5 seconds"
  echo "  --priority <level>   Filter by priority level"
  echo "  --include-related    Show parent/child task relationships"
  echo "  --help               Show this help message"
  echo ""
  echo "Examples:"
  echo "  /task-status                     # Quick overview"
  echo "  /task-status --task 1            # Details for task 1"
  echo "  /task-status --watch             # Live monitoring"
  echo "  /task-status --priority high     # Show high priority only"
  echo "  /task-status --format json       # JSON output"
  echo "  /task-status --task 1 --include-related  # Show with relationships"
  echo ""
  echo "Status Icons:"
  echo "  🚨 Critical task    ⚡ Active task    ⟳ In progress"
  echo "  ✓ Completed        ❌ Failed/Blocked  🔒 Locked"
  exit 0
fi
echo "Status options: $ARGUMENTS"'

## Load Current Registry
@tasks/task-registry.json

@include shared/task-management/thinking-patterns.yml#Thinking_Modes

## Status Configuration

!bash -c 'echo "🧠 Think-hard mode active by default for analysis (8-10 thoughts)"'
!bash -c 'if [[ "$ARGUMENTS" == *"--ultrathink"* ]]; then
  echo "🧠 ULTRATHINK mode activated - Maximum analysis (10-15 thoughts)"
fi'

Options parsed:
- **--task**: Show specific task details
- **--format**: Output format (table/json/markdown)
- **--ultrathink**: Maximum analysis mode (10-15 thoughts)
- **--analyze**: Deep status analysis (think-hard by default)
- **--watch**: Live updates every 5 seconds
- **--priority**: Filter by priority level
- **--include-related**: Show parent/child task relationships

## Registry Health Check

### 1. Synchronization Status
- Last update: ${last_registry_update}
- Update count: ${total_updates}
- Checksum: ${registry_checksum}
- Active locks: ${active_lock_count}
- **TodoWrite Check**: Verify agents using registry, not todos

### 2. Data Integrity
- Task count validation
- Subtask consistency check
- Priority queue integrity
- Lock timeout verification
- **Execution verification**: Ensure registry is sole source of truth
- **No parallel todo lists**: Confirm TodoWrite not used for tasks
- **Scratchpad quality**: Check continuous updates with substance
- **Learning documentation**: Verify discoveries are recorded

## Task Overview

### Priority Distribution
```
┌──────────┬────────┬──────────┬────────────┐
│ Priority │ Total  │ Active   │ Completed  │
├──────────┼────────┼──────────┼────────────┤
│ Critical │ X      │ X        │ X          │
│ High     │ X      │ X        │ X          │
│ Medium   │ X      │ X        │ X          │
│ Low      │ X      │ X        │ X          │
└──────────┴────────┴──────────┴────────────┘
```

### Execution Status
```
┌─────┬─────────┬──────────┬──────────────┬────────────────┐
│ ID  │ Priority│ Status   │ Progress     │ Last Update    │
├─────┼─────────┼──────────┼──────────────┼────────────────┤
│ 1   │ High    │ Active   │ 3/5 (60%)    │ 2 mins ago     │
│ 2   │ Critical│ Blocked  │ 1/3 (33%)    │ 10 mins ago    │
│ 3   │ Medium  │ Planned  │ 0/4 (0%)     │ Never          │
└─────┴─────────┴──────────┴──────────────┴────────────────┘
```

## Detailed Task View

For each active task:

### Task: #X
- **Title**: ${task_title}
- **Type**: ${task_type} (feature/bug/refactor/hotfix)
- **Agent**: ${assigned_agent}
- **Lock Status**: ${lock_status} (expires in X minutes)
- **Task Folder**: tasks/active/task-${task_id}/
- **Spec File**: tasks/active/task-${task_id}/spec.md
- **Scratchpad**: tasks/active/task-${task_id}/scratchpad.md
- **Started**: ${start_time}
- **Duration**: ${elapsed_time}

### Task Relationships
- **Parent Task**: ${parent_task} (if applicable)
- **Child Tasks**: ${child_tasks} (bug fixes for this task)
- **Related Tasks**: ${related_tasks}

### Subtask Progress
```
□ Subtask 1: Create module structure [completed] ✓
■ Subtask 2: Implement API client [in_progress] ⟳
□ Subtask 3: Add validation logic [pending]
□ Subtask 4: Write tests [pending]
```

### Allowed Paths
- src/modules/data/
- tests/data/
- tasks/active/task-X/ (task workspace)

### Recent Registry Updates
```
10:45:23 - Subtask 1.1 marked complete by AGENT-1
10:47:15 - Subtask 1.2 started by AGENT-1
10:48:02 - Registry sync successful
```

@include shared/task-management/thinking-patterns.yml#Budget_Tracking

### Thinking Budget Usage
- **Mode**: ${thinking_mode} (think-hard/ultrathink)
- **Thoughts Used**: ${thoughts_count}
- **Subagent Delegations**: ${subagent_count}
- **Average Thinking Time**: ${avg_thinking_time}

### Scratchpad Activity
- Last update: [timestamp]
- Update frequency: [X updates/hour]
- Content quality: [detailed/basic/missing]
- Learnings documented: [yes/no]
- Thinking process recorded: [yes/no]
- Verification targets tracked: [X/Y completed]

@include shared/task-management/error-patterns.yml#Error_Recovery

## Blocker Analysis

!bash -c 'if [[ "$ARGUMENTS" == *"--analyze"* ]]; then
  echo "Performing deep analysis with think-hard mode (8-10 thoughts)..."
fi'

### Currently Blocked Tasks
For each blocked task, I'll analyze:
1. Blocking reason
2. Dependencies waiting on
3. Resource conflicts
4. Suggested resolution
5. Subagent opportunities for unblocking
6. Visual targets that could clarify issues

### Common Issues Detected
- **Registry Sync Failures**: Tasks not updating properly
- **Lock Timeouts**: Agents holding locks too long
- **Dependency Chains**: Circular dependencies
- **Resource Conflicts**: Multiple tasks need same file

## Performance Metrics

### Execution Efficiency
- Average task completion time
- Subtask update frequency
- Registry sync latency
- Agent utilization rate
- Think-hard usage: X% of decisions
- Ultrathink usage: X% of complex tasks
- Subagent delegation rate: X per task
- Visual target completion: X%

### Registry Statistics
- Updates per minute: X
- Sync failures: X
- Average lock duration: X minutes
- Conflict resolutions: X

## Watch Mode

If --watch enabled:
```bash
while true; do
  clear
  # Display updated status
  # Check for changes
  # Alert on critical issues
  sleep 5
done
```

## Recommendations

Based on current status:
1. Tasks that can be parallelized
2. Bottlenecks to address
3. Registry optimization suggestions
4. Priority adjustments needed

## Alert Conditions

I'll highlight:
- 🚨 Critical tasks blocked
- ⚠️  Registry sync failures
- 🔒 Lock timeout warnings
- ❌ Failed tasks
- ✅ Recently completed

## Example Usage

### Example 1: Quick status overview
```
/task-status

Output:
"Task Summary:
- Critical: 1 active (🚨 needs attention)
- High: 3 active, 2 completed
- Medium: 5 planned, 1 active
- Low: 8 planned

Active Tasks: 5 | Completed Today: 2 | Registry Health: ✓"
```

### Example 2: Check specific task details
```
/task-status --task 1

Output:
"Task #1: Implement minute data fetching
Type: FEATURE | Priority: HIGH | Status: COMPLETED
Completed: 2 hours ago | Duration: 2.5 hours

Task Files:
- Spec: tasks/completed/task-1/spec.md
- Scratchpad: tasks/completed/task-1/scratchpad.md
- Files: tasks/completed/task-1/files/

Subtasks:
✓ Create Yahoo client module [completed]
✓ Add data validation logic [completed]  
✓ Implement error handling [completed]
✓ Write comprehensive tests [completed]
✓ Update documentation [completed]

Related Tasks:
└── Bug Fix #2: Validation issue with nulls [ACTIVE]
    Status: Fixing null value crashes in 5-min data
    Progress: 40% complete"
```

### Example 3: Watch mode for live monitoring
```
/task-status --watch

Output updates every 5 seconds:
"[LIVE] Task Execution Monitor - 14:35:20
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚡ #4 [CRITICAL] Fix API timeout
   Progress: ████████░░ 80% | Agent: AGENT-3
   
📊 #1 [HIGH] Data fetching  
   Progress: ███████░░░ 70% | Agent: AGENT-1
   
🔧 #2 [HIGH] RSI calculation
   Progress: ███░░░░░░░ 33% | Agent: AGENT-2
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Next update in 5 seconds... (Ctrl+C to exit)"
```

### Example 4: Filter by priority with analysis
```
/task-status --priority critical --analyze --ultrathink

Output:
"🧠 ULTRATHINK mode activated - Maximum analysis (10-15 thoughts)
Analyzing critical tasks with deep thinking...

Critical Tasks Analysis:

Task #4: Production API Timeout Issue
- Status: BLOCKED at subtask 2
- Blocker: Cannot reproduce in dev environment
- Analysis: The timeout appears environment-specific
  
Suggested Resolution:
1. Check production logs for correlation
2. Compare env variables between prod/dev
3. Look for rate limiting or firewall rules
4. Consider adding detailed timing logs

Impact if not resolved: Users cannot fetch data
Escalation needed: Yes - DevOps team support"
```

### Example 5: JSON format for automation
```
/task-status --format json

Output:
{
  "registry_health": {
    "last_update": "2025-07-10T14:35:20Z",
    "sync_status": "healthy",
    "active_locks": 3
  },
  "task_summary": {
    "critical": {"active": 1, "completed": 0},
    "high": {"active": 3, "completed": 2},
    "medium": {"active": 1, "completed": 5},
    "low": {"active": 0, "completed": 3}
  },
  "thinking_metrics": {
    "default_mode": "think-hard",
    "ultrathink_tasks": 2,
    "subagent_delegations": 8,
    "avg_thoughts_per_decision": 8.5
  },
  "active_tasks": [
    {
      "id": 2,
      "title": "Bug Fix: Validation issue with nulls",
      "type": "bugfix",
      "parent_task": 1,
      "progress": 40,
      "agent": "AGENT-2"
    }
  ],
  "relationships": {
    "1": {
      "parent": null,
      "children": [2],
      "related": []
    },
    "2": {
      "parent": 1,
      "children": [],
      "related": []
    }
  }
}
```

@include shared/task-management/task-core-patterns.yml#Task_Priorities
@include shared/task-management/task-core-patterns.yml#Task_States

## Status Icons Reference
- 🚨 Critical task (requires immediate attention)
- ⚡ Task in active execution
- ⟳ Subtask in progress
- ✓ Completed successfully
- ❌ Failed/Blocked
- ⏸️ Paused/Waiting
- 🔒 Lock active
- ⚠️ Warning/Issue detected

## Common Issues Detection

The status command automatically detects:
1. **Stale Locks**: Tasks locked >30 mins without updates
2. **Sync Failures**: Registry updates failing
3. **Circular Dependencies**: Tasks waiting on each other
4. **Abandoned Tasks**: Started but no recent progress
5. **Queue Bottlenecks**: Too many tasks waiting

### Step 5: Scratchpad Analysis

I'll examine scratchpad files within task folders to understand agent context:

@tasks/active/

Let me analyze the current task status...