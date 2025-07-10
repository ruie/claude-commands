**Purpose**: Orchestrate parallel agent execution with natural language control and continuous learning

---

@include shared/task-management/includes.yml

## Command Execution

**If "$ARGUMENTS" is empty**: Execute all pending tasks with smart prioritization  
**If "$ARGUMENTS" has content**: Parse execution preferences naturally

Transforms: "$ARGUMENTS" into execution strategy:

- What: [task selection criteria]
- How: [execution approach]
- Depth: [thinking mode for agents]  
- Agents: [parallel orchestration plan]

**Think-Hard Default**: All agents automatically use deep thinking (8-10 thoughts) for thorough analysis.

Intelligent task execution that spawns specialized agents working in parallel with strict isolation and continuous knowledge capture.

### Semantic Transformations

```
"execute all high priority tasks" →
  What: tasks with high priority
  How: parallel execution
  Depth: think-hard (default)
  Agents: up to 5 parallel

"carefully work on the authentication task" →
  What: authentication task specifically
  How: sequential with extra care
  Depth: ultrathink mode
  Agents: single focused agent

"quickly run task 3" →
  What: task ID 3
  How: fast execution
  Depth: standard thinking
  Agents: single agent

"continue blocked tasks with deep analysis" →
  What: all blocked tasks
  How: unblock with research
  Depth: ultrathink
  Agents: research + implementation
```

Examples:

- `/task-execute` - Run all pending tasks with smart prioritization
- `/task-execute the last task carefully` - Single task with ultrathink mode
- `/task-execute high priority only` - Filter by priority naturally
- `/task-execute preview the plan` - Dry run to see what would execute

**Context Detection**: Task selection → Agent allocation → Thinking depth → Parallel strategy → Progress tracking

## Core Workflows

**Selection Phase**: Parse criteria → Check dependencies → Verify readiness → Acquire locks  
**Agent Phase**: Spawn specialists → Assign boundaries → Monitor progress → Coordinate sharing  
**Execution Phase**: Think deeply → Update continuously → Document learnings → Verify targets  
**Synthesis Phase**: Merge work → Validate completeness → Archive knowledge → Update registry