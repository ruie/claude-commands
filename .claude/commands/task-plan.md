**Purpose**: Create intelligent task specifications through natural conversation and deep analysis

---

@include shared/task-management/includes.yml

## Command Execution

**If "$ARGUMENTS" is empty**: Show conversational examples for task planning  
**If "$ARGUMENTS" has content**: Parse intent and guide task specification

Transforms: "$ARGUMENTS" into structured planning:

- What: [task goal and scope]
- How: [planning approach]  
- Depth: [analysis depth - think-hard default]
- Agents: [research agents for exploration]

**Research First**: Spawn exploration agents to understand problem space before planning implementation.

Interactive task planning that transforms natural language into detailed specifications with subtasks, boundaries, and verification targets.

### Semantic Transformations

```
"plan email notification feature" →
  What: email notification system
  How: feature planning with research
  Depth: think-hard
  Agents: pattern researchers first

"deeply analyze user authentication redesign" →
  What: authentication system overhaul
  How: comprehensive planning
  Depth: ultrathink (10-15 thoughts)
  Agents: security + architecture researchers

"quick fix for login bug" →
  What: authentication bug fix
  How: focused debugging plan
  Depth: standard
  Agents: minimal research needed

"emergency patch for data loss" →
  What: critical data integrity issue
  How: immediate action plan
  Depth: think-hard
  Priority: critical (emergency detected)
```

Examples:

- `/task-plan add email notifications` - Standard feature planning with research phase
- `/task-plan deeply analyze payment system` - Ultrathink mode for complex architecture  
- `/task-plan fix bug in task 1` - Create linked bug fix for completed task
- `/task-plan urgent security patch` - Critical priority emergency planning

**Context Detection**: Request analysis → Complexity scoring → Research needs → Thinking depth → Agent delegation

## Core Workflows

**Research Phase**: Spawn agents → Explore codebase → Find patterns → Document constraints → No code writing  
**Analysis Phase**: Synthesize findings → Score complexity → Break down tasks → Define boundaries  
**Specification Phase**: Create detailed spec → Set verification targets → Establish success criteria  
**Registry Phase**: Initialize task entry → Set up workspace → Create scratchpad → Enable tracking

**Planning Boundary**: Creates specification only. Execution requires explicit `/task-execute`.