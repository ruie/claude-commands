# Claude Commands - Task Management System

A comprehensive task management system for Claude Code with strict isolation, registry-based tracking, and deep thinking modes.

## Overview

This repository contains custom Claude Code commands that implement a powerful task management workflow with:
- Registry-based task tracking
- Agent isolation and boundaries
- Think-hard mode by default (8-10 thoughts)
- Ultrathink mode for complex tasks (10-15 thoughts)
- Visual targets and verification
- Subagent delegation patterns

## Commands

### `/task-init`
Initialize the task management system with exact folder structure and configuration files.

### `/task-plan` 
Interactive task planning with automatic specification generation and registry management.
- Default: Think-hard mode (8-10 thoughts)
- `--ultrathink`: Maximum analysis (10-15 thoughts)

### `/task-execute`
Execute tasks in parallel with strict agent isolation and mandatory registry updates.
- All agents use think-hard mode by default
- `--ultrathink`: Upgrade agents to maximum thinking

### `/task-status`
Monitor task execution progress and analyze blockers with registry synchronization checks.
- `--analyze`: Deep analysis with think-hard mode
- `--ultrathink`: Maximum analysis for complex issues

### `/task-clear`
Clear all tasks and reset the task management system to start fresh.
- `--preserve-context`: Keep verification targets and thinking logs

## Key Features

### 🧠 Thinking Modes
- **Default**: Think-hard mode (8-10 sequential thoughts)
- **Enhanced**: Ultrathink mode (10-15 thoughts) for complex tasks

### 📋 Registry Protocol
Every task is tracked in a central registry with mandatory updates after each subtask completion.

### 🔒 Agent Isolation
Strict boundaries ensure agents only modify allowed paths and cannot interfere with other tasks.

### 🎯 Verification Targets
Visual targets, test outputs, and acceptance criteria prevent solutions from "overfitting" initial requirements.

### 🤖 Subagent Delegation
Early delegation for research and investigation tasks to preserve main context.

## Installation

1. Clone this repository
2. Copy the `.md` files to your project's `.claude/commands/` directory
3. Initialize with `/task-init`

## Usage Example

```bash
# Initialize the system
/task-init

# Plan a new feature
/task-plan --type feature --ultrathink

# Execute the task
/task-execute --tasks last

# Monitor progress
/task-status --watch
```

## Best Practices

1. **Always use the task registry** - Never use TodoWrite for project tasks
2. **Update registry after every subtask** - This is mandatory
3. **Document in scratchpad continuously** - Not just status, but learnings
4. **Stay within task boundaries** - Only modify allowed paths
5. **Use think-hard by default** - 8-10 thoughts minimum

## Based on Claude Code Best Practices

This system implements recommendations from [Anthropic's Claude Code best practices](https://www.anthropic.com/engineering/claude-code-best-practices), including:
- Graduated thinking budgets
- Four-phase workflow (Explore → Plan → Implement → Verify)
- Early subagent delegation
- Visual target verification
- Context preservation

## License

MIT License - See LICENSE file for details

## Contributing

Contributions are welcome! Please submit pull requests with clear descriptions of changes.