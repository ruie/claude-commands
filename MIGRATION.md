# Migration Guide: Task Management SimpleClaude DNA

This guide helps you migrate from the flag-based task management system to the new natural language version.

## Quick Start

**Important**: This version uses natural language exclusively. Flag-based commands are no longer supported.

```bash
# Old (no longer supported):
/task-plan --type feature --priority high --ultrathink

# New (required):
/task-plan create urgent feature with deep analysis
```

## What Changed

### 1. Commands Simplified (300→65 lines)
All commands now follow a consistent 65-line template with natural language parsing.

### 2. Natural Language Processing
The system understands conversational requests:

| Intent | Old Syntax | New Natural Language |
|--------|-----------|---------------------|
| Create feature | `--type feature` | "create feature" or "add feature" |
| High priority | `--priority high` | "urgent" or "high priority" |
| Deep thinking | `--ultrathink` | "deeply analyze" or "with deep analysis" |
| Bug fix | `--type bug` | "fix bug" or "bug fix" |
| Specific tasks | `--tasks 1,2,3` | "tasks 1, 2, and 3" or "task 1" |

### 3. Pattern Files Consolidated
- **11 files → 7 files** with clearer organization
- Old pattern files must be removed
- New structure focuses on AI agent workflows

### 4. Thinking Modes Natural
```bash
# Old way (no longer supported)
/task-plan --ultrathink
/task-execute --ultrathink

# New way (detected from language)
/task-plan deeply analyze the payment system
/task-execute carefully work on authentication
```

## Command-by-Command Migration

### /task-plan

**Old (no longer supported):**
```bash
/task-plan --type feature --priority high
/task-plan --type bug --parent 1
/task-plan --ultrathink --critical
```

**New (required):**
```bash
/task-plan create urgent email notifications
/task-plan fix bug in task 1
/task-plan deeply analyze critical security issue
```

### /task-execute

**Old (no longer supported):**
```bash
/task-execute --all
/task-execute --tasks 1,2,3
/task-execute --tasks last --ultrathink
/task-execute --priority high
```

**New (required):**
```bash
/task-execute
/task-execute tasks 1, 2, and 3
/task-execute the last task carefully
/task-execute all high priority tasks
```

### /task-status

**Old (no longer supported):**
```bash
/task-status --analyze
/task-status --task 1
/task-status --format json
/task-status --priority high
```

**New (required):**
```bash
/task-status analyze why tasks are blocked
/task-status how is task 1 progressing
/task-status show everything as json
/task-status high priority tasks only
```

### /task-init

**Old (no longer supported):**
```bash
/task-init --with-examples
/task-init --minimal
/task-init --restore
```

**New (required):**
```bash
/task-init with example tasks
/task-init minimal setup
/task-init restore from backup
```

### /task-clear

**Old (no longer supported):**
```bash
/task-clear --completed
/task-clear --all --force
/task-clear --preserve-specs
```

**New (required):**
```bash
/task-clear completed tasks
/task-clear everything forcefully
/task-clear but keep specifications
```

## Registry Compatibility

Your existing `tasks/task-registry.json` continues to work:
- Same structure and format
- Same task IDs and organization
- Natural language commands read/write same registry
- No data migration needed

## Pattern File Changes

**Clean Installation Required**: Old pattern files must be removed.

### Old Files to Remove

```bash
# These old files should be deleted after migration:
rm .claude/shared/task-management/agent-patterns.yml
rm .claude/shared/task-management/command-patterns.yml
rm .claude/shared/task-management/planning-patterns.yml
rm .claude/shared/task-management/registry-patterns.yml
rm .claude/shared/task-management/scratchpad-patterns.yml
rm .claude/shared/task-management/task-core-patterns.yml
rm .claude/shared/task-management/thinking-patterns.yml
rm .claude/shared/task-management/verification-patterns.yml
```

### New Pattern Files

The system now uses 7 consolidated files:
- `natural-intelligence.yml` - Language understanding
- `agent-cognition.yml` - How agents think
- `task-workflows.yml` - Task lifecycle
- `knowledge-management.yml` - Registry & memory
- `coordination-patterns.yml` - Multi-agent orchestration
- `thinking-integration.yml` - Cognitive depth
- `error-recovery.yml` - Failure handling

## New Features to Try

### 1. Living Memory
Agents now maintain consciousness through enhanced scratchpads:
```bash
/task-plan create feature with living memory documentation
```

### 2. Natural Complexity Detection
System automatically selects thinking depth:
- "quickly" → standard thinking
- "carefully" → think-hard (default)
- "deeply analyze" → ultrathink

### 3. Evidence-Based Language
All decisions require evidence:
```markdown
Decision: Using async/await
Because: Consistent with existing patterns
Evidence: Found in 23 files (src/modules/*.ts)
```

## Testing Your Migration

Run tests to verify everything works:
```bash
# Test all aspects
./test-task-commands.sh all

# Test specific areas
./test-task-commands.sh structure  # 65-line commands
./test-task-commands.sh language   # Natural language
./test-task-commands.sh patterns   # 7 consolidated files
```

## Clean Installation Recommended

For best results:
1. Back up your current `.claude` directory
2. Remove old task management files
3. Run the install script
4. Verify with test suite

## Getting Help

### Common Issues

**"Command not understanding my request"**
- Be more specific: "create task" → "plan new feature"
- Use migration guide examples
- Natural language only (no flags)

**"Pattern file not found"**
- Remove old pattern files
- Install fresh with new structure
- Check that all 7 new files are present

**"Different behavior than before"**
- Natural language may interpret differently
- Use examples from this guide
- Report specific issues for improvement

## Benefits After Migration

1. **Simpler Commands**: 75% less code to maintain
2. **Natural Interaction**: No memorizing flags
3. **Smarter Agents**: Better thinking integration
4. **Living Memory**: Knowledge accumulates
5. **Evidence-Based**: Higher quality decisions

## Next Steps

1. Remove old pattern files
2. Try natural language with your next task
3. Observe how agents use living memory
4. Watch knowledge accumulate in registry
5. Provide feedback on what works/doesn't

Remember: **Natural language is now the only supported interface.** The system no longer accepts flag-based commands.