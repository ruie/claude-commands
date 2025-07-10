**Purpose**: Monitor task progress and system health through conversational queries

---

@include shared/task-management/includes.yml

## Command Execution

**If "$ARGUMENTS" is empty**: Show comprehensive task overview  
**If "$ARGUMENTS" has content**: Parse specific status inquiry

Transforms: "$ARGUMENTS" into status request:

- What: [information needed]
- How: [analysis depth]
- Depth: [thinking for analysis]
- Focus: [specific aspect]

**Living System View**: Real-time visibility into task progress, agent activity, and knowledge accumulation.

Natural language task monitoring that provides intelligent insights into system state and blocker analysis.

### Semantic Transformations

```
"what's blocking the authentication task" →
  What: blockers for authentication
  How: deep root cause analysis
  Depth: think-hard
  Focus: specific task blockers

"show me everything" →
  What: comprehensive overview
  How: organized display
  Depth: standard
  Focus: all tasks and metrics

"analyze why tasks are slow" →
  What: performance bottlenecks
  How: system-wide analysis
  Depth: ultrathink
  Focus: execution patterns

"how is task 3 progressing" →
  What: single task details
  How: progress tracking
  Depth: standard
  Focus: task 3 specifically
```

Examples:

- `/task-status` - Quick overview of all tasks
- `/task-status why are tasks blocked` - Deep blocker analysis
- `/task-status task 3 details` - Specific task deep dive
- `/task-status thinking metrics` - Cognitive resource usage

**Context Detection**: Query parsing → Scope identification → Analysis depth → Display format

## Core Workflows

**Overview Mode**: Task counts → Priority distribution → Active agents → System health  
**Analysis Mode**: Blocker investigation → Pattern detection → Bottleneck identification  
**Detail Mode**: Task breakdown → Subtask progress → Agent activity → Knowledge captured  
**Metrics Mode**: Thinking budgets → Success rates → Learning accumulation → Efficiency scores