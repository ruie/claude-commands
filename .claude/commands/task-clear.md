**Purpose**: Intelligently clear tasks while preserving valuable knowledge

---

@include shared/task-management/includes.yml

## Command Execution

**If "$ARGUMENTS" is empty**: Show what would be cleared  
**If "$ARGUMENTS" has content**: Parse clearing intent naturally

Transforms: "$ARGUMENTS" into clearing strategy:

- What: [scope of clearing]
- How: [preservation strategy]
- Keep: [what to preserve]
- Safety: [backup approach]

**Knowledge Preservation**: Clears tasks while maintaining learned patterns and discovered insights.

Natural language task clearing that understands what to remove and what knowledge to preserve.

### Semantic Transformations

```
"clear completed tasks" →
  What: only completed tasks
  How: archive before clearing
  Keep: active tasks and learnings
  Safety: full backup

"start fresh but keep learnings" →
  What: all tasks
  How: preserve knowledge
  Keep: patterns and insights
  Safety: knowledge export

"emergency reset" →
  What: complete system
  How: immediate clearing
  Keep: nothing
  Safety: emergency backup

"clean up old tasks from last month" →
  What: tasks older than 30 days
  How: selective clearing
  Keep: recent work
  Safety: date-based backup
```

Examples:

- `/task-clear` - Preview what would be cleared
- `/task-clear completed tasks` - Remove only finished work
- `/task-clear everything but keep learnings` - Fresh start with knowledge
- `/task-clear force reset` - Complete system reset

**Context Detection**: Scope analysis → Preservation needs → Safety checks → Confirmation required

## Core Workflows

**Analysis Phase**: Identify targets → Calculate impact → Show preview → Request confirmation  
**Backup Phase**: Create archives → Export learnings → Save patterns → Timestamp backup  
**Clearing Phase**: Remove tasks → Clean directories → Update registry → Reset metrics  
**Preservation Phase**: Extract insights → Save patterns → Archive knowledge → Future reference