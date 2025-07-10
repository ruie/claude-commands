---
description: Execute tasks in parallel with strict agent isolation and mandatory registry updates
allowed-tools: [Read, Write, MultiEdit, Bash, mcp__sequential-thinking__sequentialthinking]
---

# Task Execution Manager

I'll execute tasks from the registry with proper agent isolation and continuous registry synchronization.

## Command Arguments
$ARGUMENTS

## Check for Help
!bash -c 'if [[ "$ARGUMENTS" == *"--help"* ]]; then
  echo "# Task Execution Help"
  echo ""
  echo "Usage: /task-execute [options]"
  echo ""
  echo "Options:"
  echo "  --all                Execute all pending tasks (default)"
  echo "  --tasks <selector>   Execute specific tasks"
  echo "  --parallel <n>       Max parallel agents (default: 5)"
  echo "  --ultrathink         Enable maximum thinking (default: think-hard)"
  echo "  --dry-run            Preview execution plan"
  echo "  --continue           Resume from last checkpoint"
  echo "  --critical           Execute critical tasks only"
  echo "  --priority <level>   Execute tasks of specific priority"
  echo "  --help               Show this help message"
  echo ""
  echo "Task Selectors:"
  echo "  1,2,3               Specific task numbers"
  echo "  1-5                 Range of tasks"
  echo "  last                Most recent task"
  echo "  last:3              Last 3 tasks"
  echo "  blocked             All blocked tasks"
  echo "  high/medium/low     By priority level"
  echo ""
  echo "Examples:"
  echo "  /task-execute                    # Execute all pending"
  echo "  /task-execute --tasks 1,2,3      # Specific tasks"
  echo "  /task-execute --tasks 1-5        # Task range"
  echo "  /task-execute --tasks blocked    # All blocked tasks"
  echo "  /task-execute --dry-run          # Preview only"
  exit 0
fi
echo "Execution options: $ARGUMENTS"'

## Load Task Registry
@tasks/task-registry.json

## Execution Configuration

Based on your arguments:
- **--all**: Execute all pending tasks (default if no options)
- **--tasks**: Execute specific task IDs (comma-separated)
- **--parallel**: Maximum parallel agents (default: 5)
- **--ultrathink**: Upgrade agents to maximum thinking (default: think-hard)
- **--dry-run**: Preview execution plan without running
- **--continue**: Resume from last checkpoint
- **--critical**: Execute only critical priority tasks
- **--priority**: Execute only tasks of specific priority

**Note**: All agents use think-hard mode (8-10 thoughts) by default for thorough analysis

## Deep Thinking Mode

!bash -c 'echo "🧠 Think-hard mode active by default - Agents will use deep analysis (8-10 thoughts)"'
!bash -c 'if [[ "$ARGUMENTS" == *"--ultrathink"* ]]; then
  echo "🧠 ULTRATHINK mode activated - Maximum thinking budget allocated (10-15 thoughts)"
  echo "Agents will use extended computational resources for exhaustive analysis"
fi'

**Default Behavior**: All agents use "think-hard" mode automatically:
- Use mcp__sequential-thinking__sequentialthinking with 8-10 thoughts
- Thorough analysis of implementation decisions
- Document thinking process in scratchpad
- Early subagent delegation for research
- Track against verification targets

**Ultrathink Mode**: When --ultrathink is specified, agents expand to:
- Maximum thinking budget (10-15 thoughts) for complex decisions
- Exhaustive edge case analysis
- Multiple implementation approach evaluation
- Comprehensive verification strategies
- Prevent "overfitting" to initial constraints

## Pre-Execution Validation

### 0. Verify No TodoWrite Usage
I will ensure:
- TodoWrite tool is NOT in allowed-tools
- Agents cannot use TodoWrite for project work
- Only task registry updates are allowed

### 1. Task Selection
I'll identify tasks to execute based on:
- Specific task IDs (if provided)
- Priority queue (critical → high → medium → low)
- Task dependencies
- Current task status (only "planned" or "blocked" tasks)

### 2. Dependency Check
Verify all dependencies are met:
- Check if dependent tasks are completed
- Validate no circular dependencies
- Ensure resources are available

### 3. Lock Acquisition
For each task:
- Acquire exclusive lock in registry
- Prevent multiple agents on same task
- Set lock timeout (30 minutes default)
- Verify task folder structure exists:
  - tasks/active/task-X/spec.md
  - tasks/active/task-X/scratchpad.md
  - tasks/active/task-X/files/

## CRITICAL: Execution Rules

**NEVER use TodoWrite for project tasks!**
- Project tasks are tracked ONLY in tasks/task-registry.json
- Update registry after EVERY subtask completion
- TodoWrite is forbidden for project work

## Agent Execution Instructions

Each agent receives these CRITICAL instructions:

!bash -c 'if [[ "$ARGUMENTS" == *"--ultrathink"* ]]; then
  echo "Note: Agents will be instructed to use deep thinking mode"
fi'

```markdown
## AGENT EXECUTION CONTEXT

### YOUR ASSIGNED TASK
- **Task ID**: [NUMBER] (e.g., 1, 2, 3...)
- **Priority**: [critical/high/medium/low]
- **Task Folder**: /absolute/path/to/tasks/active/task-[NUMBER]/
- **Spec File**: /absolute/path/to/tasks/active/task-[NUMBER]/spec.md
- **Scratchpad**: /absolute/path/to/tasks/active/task-[NUMBER]/scratchpad.md

### CRITICAL RULES
1. **READ YOUR SPEC FIRST**: Always start by reading the spec file
2. **STAY IN BOUNDS**: Only modify files in allowed_paths
3. **UPDATE REGISTRY**: After EVERY subtask completion
4. **EXCLUSIVE ACCESS**: You have exclusive lock on this task

### ALLOWED PATHS
- src/modules/specific/
- tests/specific/

### FORBIDDEN PATHS
- tasks/task-registry.json (except for status updates)
- Other agent workspaces
- System configuration files

### REGISTRY UPDATE PROTOCOL
After completing each subtask:
1. Read current registry: tasks/task-registry.json
2. Update your task's subtask status
3. Add timestamp
4. Write back atomically
5. Log: "Registry updated for subtask X"

### FAILURE PROTOCOL
If you encounter any issues:
1. Mark subtask as "blocked"
2. Update registry with error details
3. Stop execution
4. Wait for intervention

### COMPLETION PROTOCOL
When all subtasks are done:
1. Mark task as "completed"
2. Move files to tasks/completed/
3. Release task lock
4. Final registry update
```

## Parallel Execution Strategy

### 1. Task Queue Management
```python
priority_order = ["critical", "high", "medium", "low"]
execution_queue = []
for priority in priority_order:
    tasks = registry["priority_queue"][priority]
    execution_queue.extend(tasks)
```

### 2. Agent Spawning
- Spawn up to N agents (based on --parallel)
- Each agent gets one task
- Monitor agent status continuously
- Replace completed agents with new tasks

### 3. Registry Synchronization
- Monitor registry file for changes
- Detect conflicts (concurrent updates)
- Resolve using timestamp-based ordering
- Alert on sync failures

## Execution Monitoring

### Real-time Status Updates
Every 5 seconds:
1. Check agent progress
2. Verify registry sync
3. Update execution metrics
4. Handle any failures
5. **Verify no TodoWrite usage** - Critical check
6. **Confirm registry is being updated** - Not internal todos
7. **Verify scratchpad is being updated** - Must see continuous updates
8. **Check scratchpad has substance** - Not just status, but learnings
9. **Monitor thinking budget usage** - Track if agents need more time
10. **Check for subagent delegation** - Ensure complex tasks use subagents
11. **Verify visual targets** - Check progress against screenshots/examples
12. **Monitor context preservation** - Ensure key info transfers between subtasks

### Progress Tracking
```
Executing Tasks:
┌─────────────┬────────────┬──────────┬───────────────┐
│ Task ID     │ Agent      │ Progress │ Status        │
├─────────────┼────────────┼──────────┼───────────────┤
│ 1           │ AGENT-1    │ 3/5      │ In Progress   │
│ 2           │ AGENT-2    │ 1/3      │ In Progress   │
│ 3           │ [waiting]  │ 0/4      │ Queued        │
└─────────────┴────────────┴──────────┴───────────────┘
```

## Error Recovery

### Registry Corruption
1. Detect checksum mismatch
2. Load backup registry
3. Replay recent updates
4. Alert user

### Agent Failure
1. Detect non-responsive agent
2. Mark task as "blocked"
3. Release task lock
4. Log failure details

### Deadlock Prevention
1. Implement lock timeouts
2. Detect circular waits
3. Force lock release if needed
4. Requeue affected tasks

## Dry Run Mode

If --dry-run specified:
1. Show execution plan
2. List task order
3. Show dependencies
4. Estimate completion time
5. Exit without executing

## Critical Mode

If --critical flag set:
1. Pause all non-critical tasks
2. Execute only critical priority
3. Allocate all agents to critical
4. Send alerts on completion

## Example Usage

### Example 1: Execute all pending high priority tasks
```
/task-execute --priority high --parallel 3

Output:
"Found 3 high priority tasks ready for execution:
- Task #1: Implement minute data fetching
- Task #4: Fix RSI calculation bug  
- Task #7: Add error handling to telegram bot

Spawning 3 agents to work in parallel...
[Live progress updates follow]"
```

### Example 2: Execute specific task with ultrathink
```
/task-execute --tasks 1 --ultrathink

Output:
"🧠 Deep thinking mode activated - Agents will use sequential thinking for thorough analysis
Executing Task #1 with deep thinking enabled
Agent AGENT-1 assigned with exclusive lock
Reading spec: tasks/active/task-1/spec.md
Agent will use sequential thinking for complex decisions..."
```

### Example 3: Dry run to preview execution plan
```
/task-execute --dry-run

Output:
"DRY RUN - No changes will be made

Execution Plan:
1. Task #4 (critical) - Fix production outage
   Dependencies: None
   Est. time: 30 mins
   
2. Task #1 (high) - Implement minute data  
   Dependencies: None
   Est. time: 2 hours
   
3. Task #2 (high) - Fix RSI calculation
   Dependencies: Task #1
   Est. time: 1 hour

Total estimated time: 3.5 hours with 3 parallel agents"
```

### Example 4: Resume after interruption
```
/task-execute --continue

Output:
"Resuming execution from checkpoint:
- Task #1: 60% complete (subtask 3/5)
- Task #2: 33% complete (subtask 1/3)

Reacquiring locks and continuing..."
```

## Agent Instructions Template

Each agent receives these exact instructions:
```
=== AGENT EXECUTION INSTRUCTIONS ===

TASK ASSIGNMENT:
- Task ID: 1
- Title: Implement minute-level data fetching
- Priority: high
- Your Agent ID: AGENT-1

MANDATORY READING:
- Spec file: /home/vdelapena/Personal/ai-investor/tasks/active/task-1/spec.md
- READ THIS FIRST - it contains all implementation details

WORKSPACE BOUNDARIES:
✅ ALLOWED to modify:
- src/modules/data/
- tests/data/
- tasks/active/task-X/ (YOUR ENTIRE TASK FOLDER)
  - spec.md (read-only)
  - scratchpad.md (update continuously)
  - files/ (store any task files here)

❌ FORBIDDEN to modify:
- Any other directories
- Other task folders (tasks/active/task-Y/)
- System files

⛔ FORBIDDEN TOOLS:
- TodoWrite (NEVER use for project tasks)
- Only use task registry for tracking

📋 MANDATORY SCRATCHPAD USAGE:
- **REQUIRED**: Write to tasks/active/task-X/scratchpad.md
- Document EVERY step you take
- Record what you learn, discover, or figure out
- Note any decisions, assumptions, or context
- Write down helpful commands, patterns, or solutions
- Document errors and how you resolved them
- Store any generated files in tasks/active/task-X/files/
- THIS IS NOT OPTIONAL - failing to update scratchpad = task failure

REGISTRY UPDATE PROTOCOL:
After EVERY subtask:
1. Read: tasks/task-registry.json
2. Update your subtask status
3. Add timestamp
4. Write atomically
5. Log: "Registry updated: Task #1 subtask X complete"

CURRENT SUBTASKS:
□ 1.1: Create Yahoo client
□ 1.2: Add data validation  
□ 1.3: Implement error handling
□ 1.4: Write tests
□ 1.5: Update documentation

REMEMBER - ALL ARE MANDATORY:
1. NO TodoWrite for project work
2. Update registry after EVERY subtask
3. Update scratchpad CONTINUOUSLY as you work
4. Document EVERYTHING you learn or discover
5. Write down ANY helpful information
6. Record your thought process and decisions

FAILURE TO UPDATE SCRATCHPAD = TASK FAILURE

BEGIN EXECUTION

[IF --ultrathink specified, add:]  
🧠 DEEP THINKING MODE ENABLED:
- Use mcp__sequential-thinking__sequentialthinking for complex decisions
- Analyze thoroughly before implementing
- Document your thinking process in scratchpad
- Consider edge cases and alternatives
- Quality over speed
```

## Execution Monitoring Format

```
Task Execution Status [14:32:15]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Task #1 [HIGH] Data Fetching Implementation
Agent: AGENT-1 | Progress: ███████░░░ 70% (3.5/5 subtasks)
Status: Working on subtask 4 - Writing tests
Last update: 30 seconds ago

Task #2 [HIGH] Fix RSI Calculation  
Agent: AGENT-2 | Progress: ███░░░░░░░ 33% (1/3 subtasks)
Status: Implementing calculation fix
Last update: 2 minutes ago

Task #3 [MEDIUM] Telegram Error Handling
Agent: [waiting] | Progress: ░░░░░░░░░░ 0% (0/4 subtasks)
Status: Queued - waiting for available agent
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Active Agents: 2/3 | Queue: 1 task | Registry synced ✓
```

Let me analyze the task registry and prepare the execution plan...