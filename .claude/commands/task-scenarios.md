# Task Management System - Real-World Scenarios

This guide demonstrates the task management system through practical scenarios based on actual usage in the ai-investor project.

## 📚 Table of Contents
1. [Quick Start](#quick-start)
2. [Feature Development](#feature-development)
3. [Bug Fixing](#bug-fixing)
4. [Complex Features with Deep Analysis](#complex-features)
5. [Emergency Hotfixes](#emergency-hotfixes)
6. [Multi-Task Execution](#multi-task-execution)
7. [Status Monitoring](#status-monitoring)
8. [System Maintenance](#system-maintenance)

## Quick Start

### First Time Setup
```bash
# Initialize the task management system
/task-init

# This creates:
# - tasks/task-registry.json (central registry)
# - tasks/active/ (for active tasks)
# - tasks/completed/ (for finished tasks)
# - tasks/verification-targets/ (for visual targets)
```

### Your First Task
```bash
# Plan a simple feature
/task-plan --type feature

User: "Add a health check endpoint to the worker"

# System will ask clarifying questions:
# 1. What should the endpoint return?
# 2. Any specific health checks needed?
# 3. Should it check database connectivity?

# Creates Task #4 with subtasks:
# - 4.1: Design health check response format
# - 4.2: Implement /health endpoint
# - 4.3: Add database connectivity check
# - 4.4: Write tests
# - 4.5: Update documentation
```

## Feature Development

### Scenario: Market Data Collection (Task #1 - Completed)
This was an actual feature implemented in your project.

```bash
/task-plan --type feature --priority high

User: "Implement market data collection for IVV.AX with 5-minute intervals 
during market hours and daily summaries. Include 2-month retention for 
intraday data."

# Task #1 Created with subtasks:
# 1.1: Create Market Collector Module Structure
# 1.2: Implement 5-Minute Data Collection
# 1.3: Implement Daily Summary Collection
# 1.4: Implement Data Retention System
# 1.5: Add Cloudflare Worker Integration
# 1.6: Implement Comprehensive Tests
# 1.7: Add Configuration and Documentation

# Execute the task
/task-execute --tasks 1

# Result: Successfully implemented in 2.5 hours
# - Created src/modules/market-collector/
# - Yahoo Finance integration
# - Database storage with retention
# - Comprehensive test suite
```

### Key Learnings from Task #1:
- **Module Structure**: Clean separation of concerns
- **Database Integration**: Drizzle ORM with type safety
- **Testing**: Real API calls with database verification
- **Documentation**: Updated CLAUDE.md with new module

## Bug Fixing

### Scenario: Test Suite Issues (Task #2 - Completed)
Real bug fix task that addressed 34 failing tests.

```bash
/task-plan --type bug --parent 1

User: "Market collector tests are failing with verbose logging, timing issues, 
and using simulation instead of real data. Also seeing import errors."

# Task #2 Created as bug fix for Task #1:
# 2.1: Fix Test Logging Verbosity
# 2.2: Fix Mock and Import Issues
# 2.3: Fix Timing and Synchronization Problems
# 2.4: Address Data Type and Validation Errors
# 2.5: Fix Environment Configuration Issues
# 2.6: Implement Real Data Operations
# 2.7: Update Test Structure and Organization
# 2.8: Complete Task 2 Verification

/task-execute --tasks 2

# Result: Fixed all 34 failing tests
# - Removed verbose console.log statements
# - Fixed mock conflicts
# - Implemented real Yahoo Finance API calls
# - Added proper database verification
```

### Scenario: TypeScript Compilation Errors (Task #3 - Completed)
Emergency fix for build-breaking compilation errors.

```bash
/task-plan --type bug --priority high

User: "TypeScript compilation failing due to missing types and deleted modules. 
Can't build the project."

# Task #3 Created:
# 3.1: Fix missing types/index module and type imports
# 3.2: Remove references to deleted modules
# 3.3: Fix market-collector type issues
# 3.4: Fix telegram module imports and dependencies
# 3.5: Clean up old test files with missing dependencies
# 3.6: Verify TypeScript compilation passes

/task-execute --tasks 3

# Result: Fixed all compilation errors in 15 minutes
# - Updated import paths
# - Created stub implementations
# - Fixed type mismatches
# - Project builds successfully
```

## Complex Features with Deep Analysis

### Scenario: Portfolio Rebalancing System
Using ultrathink mode for complex architecture decisions.

```bash
/task-plan --type feature --ultrathink

User: "Add portfolio rebalancing with automated trading based on target 
allocations. Should check monthly and suggest rebalancing trades."

# 🧠 ULTRATHINK activated (10-15 thoughts)
# System performs deep analysis...

# Creates 3 linked tasks:

# Task #4: Portfolio Foundation (8 hrs)
# - 4.1: Design portfolio data model
# - 4.2: Create allocation tracking schema
# - 4.3: Implement portfolio calculations
# - 4.4: Add target allocation configuration
# - 4.5: Write comprehensive tests

# Task #5: Rebalancing Logic (10 hrs)
# - 5.1: Research rebalancing algorithms
# - 5.2: Implement threshold calculations
# - 5.3: Create trade recommendation engine
# - 5.4: Add tax optimization logic
# - 5.5: Test with historical data

# Task #6: Trading Integration (8 hrs)
# - 6.1: Design trading safety checks
# - 6.2: Implement broker API integration
# - 6.3: Add order execution with limits
# - 6.4: Create audit trail
# - 6.5: End-to-end testing
```

### Benefits of Ultrathink:
- **Comprehensive Planning**: Considers all edge cases
- **Risk Mitigation**: Identifies potential issues early
- **Optimal Structure**: Creates logical task boundaries
- **Subagent Opportunities**: Identifies research needs

## Emergency Hotfixes

### Scenario: Production API Timeout
Critical issues require immediate attention.

```bash
/task-plan --critical --type hotfix

User: "Production API timing out - users can't fetch market data!"

# 🚨 CRITICAL MODE ACTIVATED
# Minimal subtasks for quick resolution:

# Task #4 (CRITICAL):
# 4.1: Identify timeout source (logs/metrics)
# 4.2: Implement immediate mitigation
# 4.3: Deploy emergency fix
# 4.4: Monitor and verify

/task-execute --tasks 4 --critical

# All agents focus on this task
# Other tasks paused
# Alerts on completion
```

## Multi-Task Execution

### Scenario: Parallel Development
Execute multiple independent tasks simultaneously.

```bash
# Check what's ready to execute
/task-status

# Output:
# Ready for execution:
# - Task #4: Health check endpoint (HIGH)
# - Task #5: Add rate limiting (MEDIUM)
# - Task #6: Improve error messages (LOW)

# Execute specific tasks in parallel
/task-execute --tasks 4,5,6 --parallel 3

# Or execute by priority
/task-execute --priority high --parallel 2

# Monitoring shows:
# Task #4 [HIGH] Health Check
# Agent: AGENT-1 | Progress: ███████░░░ 70%
# 
# Task #5 [MEDIUM] Rate Limiting
# Agent: AGENT-2 | Progress: ███░░░░░░░ 30%
# 
# Task #6 [LOW] Error Messages
# Agent: AGENT-3 | Progress: █████░░░░░ 50%
```

## Status Monitoring

### Scenario: Daily Standup
Quick overview of project status.

```bash
/task-status

# Summary Output:
# Task Overview:
# - Completed Today: 3 (Tasks #1, #2, #3)
# - In Progress: 0
# - Planned: 1 (Task #4)
# 
# Recent Completions:
# ✓ Task #1: Market Data Collection (2.5 hrs)
# ✓ Task #2: Test Suite Fixes (3 hrs)
# ✓ Task #3: TypeScript Fixes (15 mins)
# 
# Thinking Metrics:
# - Default Mode: think-hard
# - Total Thoughts Used: 127
# - Subagent Delegations: 12
# - Efficiency: 2.4% (3 tasks / 127 thoughts)
```

### Scenario: Deep Task Analysis
Investigate a specific task in detail.

```bash
/task-status --task 2 --include-related

# Detailed Output:
# Task #2: Bug Fix: Market Collector Test Suite
# Type: bug_fix | Priority: HIGH | Status: COMPLETED
# Parent Task: #1 (Market Data Collection Feature)
# 
# Completion Timeline:
# - Started: 05:20 UTC
# - Completed: 08:47 UTC
# - Duration: 3 hours 27 minutes
# 
# Subtasks Completed:
# ✓ 2.1: Fix Test Logging Verbosity (20 min)
# ✓ 2.2: Fix Mock and Import Issues (25 min)
# ✓ 2.3: Fix Timing Problems (15 min)
# ✓ 2.4: Fix Data Validation (30 min)
# ✓ 2.5: Fix Environment Config (20 min)
# ✓ 2.6: Real Data Operations (45 min)
# ✓ 2.7: Update Test Structure (25 min)
# ✓ 2.8: Final Verification (7 min)
# 
# Key Achievements:
# - Fixed 34 failing tests
# - Removed verbose logging
# - Implemented real API calls
# - Added database verification
```

### Scenario: Blocker Analysis
When tasks are stuck, analyze why.

```bash
/task-status --analyze --ultrathink

# 🧠 Deep analysis with ultrathink mode...
# 
# Blocked Task Analysis:
# 
# Task #7: Email Notifications
# Status: BLOCKED at subtask 3
# Blocker: AWS SES credentials not configured
# 
# Root Cause Analysis:
# 1. Environment variables missing
# 2. AWS account not verified for SES
# 3. Domain verification pending
# 
# Suggested Resolution:
# 1. Add AWS_ACCESS_KEY_ID to .env
# 2. Add AWS_SECRET_ACCESS_KEY to .env
# 3. Verify domain in AWS console
# 4. Update wrangler.toml with secrets
# 
# Subagent Opportunity:
# - Research AWS SES setup for Cloudflare Workers
# - Find example configurations
```

## System Maintenance

### Scenario: Clean Slate
Reset system while preserving important data.

```bash
# Backup and clear completed tasks
/task-clear --completed --backup

# Output:
# Creating backup: tasks_backup_20250710_140523/
# Clearing completed tasks...
# ✓ Backed up 3 completed tasks
# ✓ Cleared completed task folders
# ✓ Registry updated

# Full reset with context preservation
/task-clear --all --preserve-context --backup

# Preserves:
# - Verification targets
# - Thinking logs
# - Learnings from scratchpads
```

### Scenario: Archive and Rotate
Keep system performant by archiving old tasks.

```bash
# Check system health
/task-status --health

# Output:
# Registry Health: ✓
# - Size: 45KB
# - Updates: 147
# - Last sync: 2 min ago
# 
# Recommendations:
# - Archive tasks older than 30 days
# - Compress completed task folders
# - Clear execution history > 1000 entries
```

## Best Practices from Real Usage

### 1. **Task Planning**
- Be specific in descriptions
- Include acceptance criteria
- Provide context and examples
- Use --ultrathink for complex features

### 2. **Task Execution**
- Execute related tasks together
- Monitor with /task-status --watch
- Check scratchpads for learnings
- Verify registry updates

### 3. **Bug Fixes**
- Always link to parent task with --parent
- Include error messages in description
- Provide steps to reproduce
- Verify original functionality preserved

### 4. **Status Monitoring**
- Daily /task-status for overview
- Use --analyze for blocked tasks
- Check thinking metrics regularly
- Review execution history

### 5. **System Hygiene**
- Weekly backup with /task-clear --backup
- Archive completed tasks monthly
- Monitor registry size
- Clean up old workspaces

## Common Patterns

### Pattern: Feature → Bug → Enhancement
```bash
# 1. Initial feature
/task-plan --type feature
# Creates Task #1

# 2. Bug found after completion
/task-plan --type bug --parent 1
# Creates Task #2 linked to #1

# 3. Enhancement request
/task-plan --type feature --related 1,2
# Creates Task #3 with context
```

### Pattern: Research → Design → Implement
```bash
# Complex feature with phases
/task-plan --ultrathink

# Creates linked tasks:
# - Research phase (gather requirements)
# - Design phase (architecture decisions)
# - Implementation phase (build it)
# - Verification phase (ensure quality)
```

### Pattern: Hotfix → Post-mortem
```bash
# 1. Emergency fix
/task-plan --critical --type hotfix

# 2. After resolution
/task-plan --type feature --related 4
# "Add monitoring to prevent future timeouts"
```

## Troubleshooting

### Registry Sync Issues
```bash
# If registry corrupted
/task-status --health
# System auto-recovers from backup

# Force registry rebuild
/task-init --force
```

### Stuck Tasks
```bash
# Identify stuck task
/task-status --analyze

# Clear specific task
/task-clear --active --task 5

# Restart execution
/task-execute --tasks 5
```

### Performance Issues
```bash
# Check metrics
/task-status --format json | jq '.thinking_metrics'

# High thought usage?
# - Break complex tasks into smaller ones
# - Use subagent delegation more
# - Avoid --ultrathink unless needed
```

---

This scenarios guide is based on actual tasks completed in your ai-investor project, showing real-world usage patterns and best practices developed through experience.