# Task Management System - SimpleClaude Architecture

This task management system implements SimpleClaude's elegant @include architecture for maximum reusability and minimal redundancy.

## Architecture Overview

```
.claude/
├── commands/               # Thin command wrappers
│   ├── task-plan.md       # Planning command
│   ├── task-execute.md    # Execution command
│   ├── task-status.md     # Status monitoring
│   ├── task-init.md       # System initialization
│   └── task-clear.md      # System cleanup
└── shared/task-management/ # Reusable patterns
    ├── includes.yml       # Include registry
    ├── README.md          # This file
    ├── registry-patterns.yml
    ├── task-core-patterns.yml
    ├── agent-patterns.yml
    ├── thinking-patterns.yml
    ├── planning-patterns.yml
    ├── scratchpad-patterns.yml
    ├── verification-patterns.yml
    ├── error-patterns.yml
    └── command-patterns.yml
```

## How It Works

### 1. Include System
Commands use `@include` directives to pull in shared patterns:
```markdown
@include shared/task-management/thinking-patterns.yml#Default_Behavior
@include shared/task-management/registry-patterns.yml#Update_Protocol
```

### 2. Pattern Files
Each pattern file contains reusable components:
- **registry-patterns.yml**: Registry structure, update protocols, validation
- **task-core-patterns.yml**: Task lifecycle, states, priorities, types
- **agent-patterns.yml**: Agent isolation, boundaries, instructions, monitoring
- **thinking-patterns.yml**: Thinking modes, budget tracking, subagent delegation
- **planning-patterns.yml**: Planning workflow, complexity analysis, subtask guidelines
- **scratchpad-patterns.yml**: Scratchpad requirements and structure
- **verification-patterns.yml**: Verification targets and acceptance criteria
- **error-patterns.yml**: Error recovery, registry corruption, deadlock prevention
- **command-patterns.yml**: Help detection, argument parsing, command modes

### 3. Command Structure
Commands are now thin wrappers that:
1. Include necessary patterns
2. Parse arguments
3. Execute using shared logic

## Benefits

1. **DRY (Don't Repeat Yourself)**: Patterns defined once, used everywhere
2. **Consistency**: All commands use same core patterns
3. **Maintainability**: Update pattern once, affects all commands
4. **Extensibility**: Easy to add new patterns or commands
5. **Clarity**: Commands focus on flow, patterns handle details

## Usage Example

```markdown
# In task-plan.md
---
description: Task planning command
allowed-tools: [Read, Write, Task]
---

@include shared/task-management/thinking-patterns.yml#Default_Behavior
@include shared/task-management/planning-patterns.yml#Planning_Workflow

# Task Planning Assistant

[Command-specific implementation using included patterns]
```

## Pattern Registry (includes.yml)

The includes.yml file acts as a central registry mapping pattern categories to their locations:

```yaml
task-core:
  task_lifecycle: shared/task-management/task-core-patterns.yml#Task_Lifecycle
  task_states: shared/task-management/task-core-patterns.yml#Task_States
  # ... more mappings
```

## Adding New Patterns

1. Create or update pattern file in shared/task-management/
2. Add section with unique anchor (e.g., #New_Pattern)
3. Register in includes.yml
4. Use @include in commands

## Pattern Naming Conventions

- Use PascalCase for pattern anchors: #Task_Lifecycle
- Group related patterns in same file
- Keep patterns focused and single-purpose
- Document each pattern's purpose and usage

## Integration with Projects

Add to your project's CLAUDE.md:
```markdown
## Task Management System

This project uses SimpleClaude-inspired task management with @include patterns.

Commands:
- /task-plan - Plan new tasks
- /task-execute - Execute tasks
- /task-status - Monitor progress
- /task-init - Initialize system
- /task-clear - Clear tasks

All commands use shared patterns from .claude/shared/task-management/
```

## Debugging Includes

If an @include isn't working:
1. Check file path is correct
2. Verify anchor exists in target file
3. Ensure no typos in pattern name
4. Check includes.yml registry

## Future Enhancements

1. **Dynamic includes**: Include patterns based on conditions
2. **Pattern versioning**: Support multiple versions of patterns
3. **Cross-project sharing**: Share patterns between projects
4. **Pattern validation**: Automated testing of pattern integrity

This architecture brings SimpleClaude's elegance to task management, creating a maintainable, extensible system that grows with your needs.