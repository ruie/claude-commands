---
description: Interactive task planning with automatic specification generation and registry management. Critical priority only with explicit request or --critical flag.
allowed-tools: [Read, Write, MultiEdit, Task, mcp__sequential-thinking__sequentialthinking]
---

# Task Planning Assistant

I'll help you plan and specify tasks for the $PROJECT_NAME project with clear boundaries and registry tracking.

## Command Arguments
$ARGUMENTS

## Check for Help
!bash -c 'if [[ "$ARGUMENTS" == *"--help"* ]]; then
  echo "# Task Planning Help"
  echo ""
  echo "Usage: /task-plan [options]"
  echo ""
  echo "Options:"
  echo "  --priority <level>    Set default priority (high/medium/low)"
  echo "  --critical           Allow critical priority for urgent issues"
  echo "  --ultrathink         Enable deep analysis and planning"
  echo "  --type <type>        Task type (feature/bug/refactor/hotfix)"
  echo "  --parent <task_id>   Create bug fix task linked to parent task"
  echo "  --related <ids>      Related task IDs (comma-separated)"
  echo "  --help               Show this help message"
  echo ""
  echo "Examples:"
  echo "  /task-plan                         # Interactive planning"
  echo "  /task-plan --priority high         # Set high priority default"
  echo "  /task-plan --type bug              # Create bug fix task"
  echo "  /task-plan --critical              # Plan emergency hotfix"
  echo "  /task-plan --type bug --parent 1   # Bug fix for Task #1"
  echo ""
  echo "Task IDs are simple numbers: 1, 2, 3..."
  exit 0
fi
echo "Arguments received: $ARGUMENTS"'

## Initialize Planning Session

First, let me check the current task registry:

@tasks/task-registry.json

Based on your arguments, I'll configure the planning session:
- **--priority**: Default priority level (high/medium/low) for all tasks
- **--critical**: Set critical priority (only when explicitly requested)
- **--ultrathink**: Use deep sequential thinking for comprehensive analysis
- **--type**: Task type (feature/bug/refactor/hotfix)
- **--parent**: Create a bug fix task linked to a parent task (for post-completion bugs)
- **--related**: Link to related tasks for context

**Note**: Critical priority is reserved for urgent production issues and will only be set when you explicitly request it or use the --critical flag.

## Parent Task Handling

If --parent is specified, I'll:
1. Load the parent task details from registry
2. Create a linked bug fix task
3. Inherit context from parent task
4. Set up proper relationships

## IMPORTANT: Task Registry Usage

**DO NOT use TodoWrite tool for project tasks!**
- All tasks MUST be tracked in tasks/task-registry.json
- TodoWrite is for internal Claude operations only
- Project work uses the task management system exclusively

## Deep Analysis Mode

!bash -c 'echo "🧠 Think-hard mode active by default - Using deep analysis (8-10 thoughts)"'
!bash -c 'if [[ "$ARGUMENTS" == *"--ultrathink"* ]]; then
  echo "🧠 ULTRATHINK mode activated - Maximum thinking budget allocated (10-15 thoughts)"
fi'

If --ultrathink is specified, I'll use the mcp__sequential-thinking__sequentialthinking tool to:
- Analyze all aspects of the task systematically
- Consider edge cases and potential issues
- Evaluate multiple implementation approaches
- Create optimal subtask breakdown
- Identify hidden dependencies and risks

**Implementation**: When --ultrathink is in arguments, I will:
1. Use sequential thinking with 10-15 thoughts to analyze the task deeply
2. Consider complexity, risks, dependencies, and optimal breakdown
3. Generate a comprehensive task plan based on the analysis
4. Present the refined plan with detailed subtasks
5. Create verification steps to ensure implementation doesn't "overfit" initial constraints

**Thinking Budget Escalation**:
- Default planning: Standard analysis
- --think: Enhanced analysis (5-7 thoughts)
- --think-hard: Deep analysis (8-10 thoughts)  
- --ultrathink: Maximum analysis (10-15 thoughts)

## Planning Process

### Step 1: Requirements Gathering
I'll work with you to understand:
- What needs to be built/fixed/improved
- Success criteria and acceptance conditions
- Dependencies and constraints
- Which parts of the codebase will be affected
- Expected complexity and timeline
- Potential risks and challenges

### Step 2: Task Complexity Analysis & Breakdown

!bash -c 'if [[ "$ARGUMENTS" == *"--ultrathink"* ]]; then
  echo "Starting deep analysis with sequential thinking..."
  echo "Following explore → plan → implement → verify workflow"
fi'

I'll analyze the task complexity and create an appropriate breakdown.

**Best Practice**: For complex tasks, I'll follow the four-phase approach:
1. **Explore**: Research and understand the problem space
2. **Plan**: Create detailed implementation strategy  
3. **Implement**: Execute with clear subtask boundaries
4. **Verify**: Ensure solution meets all requirements

#### Complexity Factors:
- **Scope**: How many files/modules need changes
- **Dependencies**: External APIs, libraries, or other tasks
- **Risk**: Potential for breaking existing functionality
- **Testing**: Amount of test coverage needed
- **Documentation**: Required documentation updates

#### Subtask Guidelines:
- **Small subtasks**: 1-2 hours of focused work
- **Clear boundaries**: Each subtask has specific inputs/outputs
- **Testable**: Can verify completion independently
- **Context-rich**: Include relevant docs, examples, patterns
- **Verification targets**: Visual targets, test cases, or acceptance criteria
- **Early subagent usage**: Delegate research/investigation to preserve context

#### Example Breakdown:
```
Main Task #1: Add Email Notifications
├── Subtask 1.1: Design Email Service Interface (1-2 hrs)
│   └── Context: Similar telegram interface, SOLID principles
├── Subtask 1.2: Implement Email Provider Integration (2-3 hrs)
│   └── Context: Provider docs, rate limits, error handling
├── Subtask 1.3: Create Email Templates (1-2 hrs)
│   └── Context: Existing notification formats, branding
├── Subtask 1.4: Add Queue System (2-3 hrs)
│   └── Context: Prevent blocking, handle failures
├── Subtask 1.5: Implement Tests (2 hrs)
│   └── Context: Mock providers, edge cases
└── Subtask 1.6: Add Configuration & Docs (1 hr)
    └── Context: Environment vars, deployment guide
```

### Step 3: Boundary Definition
For each task, I'll define:
- **Allowed directories**: Where agents can make changes
- **Forbidden areas**: Files/directories that must not be touched
- **Dependencies**: Other tasks that must complete first
- **Isolation**: Ensure no conflicts with other tasks
- **Verification targets**: Screenshots, test outputs, or specific acceptance criteria
- **Context preservation**: Key information that must persist across subtasks

### Step 4: Specification Generation
I'll create detailed specs including:
```markdown
# Task #X Specification

## Task Complexity Assessment
- **Estimated Total Hours**: X-Y hours
- **Number of Subtasks**: N (optimal: 3-8)
- **Risk Level**: Low/Medium/High
- **External Dependencies**: [List APIs, services]

## CRITICAL: Registry Update Protocol
- Update registry after EVERY subtask
- Use atomic writes to prevent corruption
- Include timestamp with each update

## Task Boundaries
- Task ID: X
- Allowed Directories: [specific paths]
- Forbidden: [paths to avoid]

## Subtask Breakdown
### Subtask X.1: [Title] (Est: X hrs)
**Purpose**: Clear, focused objective
**Context**: 
- Relevant documentation: [links/files]
- Similar patterns in: [existing code]
- Key considerations: [gotchas, tips]
**Success Criteria**: [Specific, measurable]
**Verification Target**: [Screenshot, test output, or specific check]
**Subagent Opportunity**: [If research/investigation needed]
**Thinking Mode**: Think-hard (8-10 thoughts) by default

### Subtask X.2: [Title] (Est: X hrs)
[Similar structure...]

## Implementation Guidelines
- Work on ONE subtask at a time
- Test each subtask independently
- Document discoveries in scratchpad
- Request help if blocked > 30 mins

## Success Criteria
- All subtasks marked complete
- Registry in sync
- Tests passing
- No regressions
```

### Step 5: Registry Integration
I'll update the task registry with:
```json
{
  "1": {
    "id": 1,
    "title": "Task title",
    "priority": "high",
    "status": "planned",
    "type": "feature",
    "spec_file": "tasks/active/task-X/spec.md",
    "allowed_paths": ["src/specific/"],
    "forbidden_paths": ["src/critical/"],
    "subtasks": [],
    "dependencies": [],
    "parent_task": null,
    "related_tasks": [],
    "created": "timestamp",
    "last_updated": "timestamp",
    "assigned_agent": null,
    "lock_status": "unlocked"
  }
}
```

**CRITICAL REQUIREMENTS**: When working on this task:
- Use ONLY the task registry for tracking
- NEVER use TodoWrite for project tasks
- Update registry after EVERY subtask
- **MANDATORY**: Update `tasks/active/task-X/scratchpad.md` CONTINUOUSLY
- Document EVERY step, learning, discovery, and helpful information
- Record all commands, patterns, errors, and resolutions
- Scratchpad must show detailed work progress
- All task files stay within `tasks/active/task-X/`
- Failing to maintain scratchpad = TASK FAILURE

## Registry Update Protocol

**CRITICAL**: Every change must update the registry:
1. Read current registry
2. Validate checksum
3. Make updates
4. Calculate new checksum
5. Write atomically
6. Verify write success

## Task Types

### Feature Type
- User story and requirements
- Technical design
- Implementation steps
- Testing strategy
- Rollout plan

### Bug Type
- Issue description
- Parent task reference (if applicable)
- Root cause analysis
- Fix implementation
- Regression tests
- Verification steps
- Validation of original functionality

### Hotfix Type
- Issue severity and impact
- Immediate fix steps
- Emergency testing
- Deployment process
- Post-mortem plan

### Refactor Type
- Current implementation issues
- Proposed improvements
- Risk assessment
- Migration strategy
- Testing approach

**Note**: For critical priority hotfixes, explicitly use --critical flag

## Intelligent Task Chunking

### Optimal Subtask Size
Each subtask should be:
- **Completable in 1-3 hours** by a focused agent
- **Self-contained** with clear start/end points
- **Independently testable** without full context
- **Context-rich** with relevant docs and examples

### When to Split Tasks
Split into multiple subtasks when:
- Creating new modules (structure → implementation → tests → docs)
- Multiple file types involved (backend → frontend → config)
- External dependencies (research → implementation → integration)
- High risk changes (backup → modify → verify → rollback plan)

### Context Enrichment
For each subtask, provide:
- **Relevant documentation links** (API docs, guides)
- **Code examples** from similar implementations
- **Common pitfalls** and how to avoid them
- **Testing strategies** specific to that subtask
- **Dependencies** that must be checked first

### Example: Complex Feature Breakdown
```
Feature: Add Real-time Notifications
├── Research Phase (Task #1)
│   ├── 1.1: Evaluate WebSocket libraries (2 hrs)
│   ├── 1.2: Design message protocol (1 hr)
│   └── 1.3: Create proof of concept (2 hrs)
├── Implementation Phase (Task #2)
│   ├── 2.1: Set up WebSocket server (2 hrs)
│   ├── 2.2: Implement client connection (2 hrs)
│   ├── 2.3: Add authentication (3 hrs)
│   └── 2.4: Handle reconnection (2 hrs)
└── Integration Phase (Task #3)
    ├── 3.1: Connect to existing events (2 hrs)
    ├── 3.2: Add UI components (3 hrs)
    ├── 3.3: Test edge cases (2 hrs)
    └── 3.4: Documentation (1 hr)
```

## Output Structure

All planning results in:
1. Task entry in registry (with lock mechanism)
2. Task folder created at `tasks/active/task-X/`
3. Specification saved as `tasks/active/task-X/spec.md`
4. Scratchpad created as `tasks/active/task-X/scratchpad.md`
5. Files directory created as `tasks/active/task-X/files/`
6. Priority queue update

## Important Guidelines

**I will ALWAYS ask for clarification when:**
- Task scope is unclear
- Multiple interpretations are possible
- Dependencies are not specified
- File paths are ambiguous
- Priority is not obvious

## Example Usage

### Example 1: Planning a new feature
```
/task-plan --priority high --type feature

User: "I want to add email notifications"
Assistant: "I need more details to create a clear specification:
1. What events should trigger emails? (new signals, errors, daily summary?)
2. Which module should handle this? (telegram module extension or new module?)
3. Any specific email service to use? (SendGrid, AWS SES, SMTP?)
4. Should this integrate with existing telegram notifications?"

Result: Creates Task #1 with detailed specification
```

### Example 2: Planning a bug fix
```
/task-plan --type bug

User: "Data fetching is broken"
Assistant: "To properly scope this bug fix, I need to understand:
1. Which data source is failing? (Yahoo Finance, Alpha Vantage, all?)
2. What error are you seeing? (timeout, invalid data, API error?)
3. When did this start? (after a deploy, specific time?)
4. Is it affecting all symbols or specific ones?"
```

### Example 4: Bug fix for completed task
```
/task-plan --type bug --parent 1

User: "Found issue with 5-minute data validation - nulls causing crashes"
Assistant: "I see this is a bug in the completed Task #1. Let me create a linked bug fix task:

Parent Task #1: Market Data Collection Feature
Bug: Null values in 5-minute data causing validation crashes

I'll create Task #2 as a bug fix that:
1. References the original implementation
2. Focuses on the validation issue
3. Preserves the parent task's completion status
4. Links both tasks for tracking"

Result: Creates Task #2 linked to Task #1
```

### Example 3: Critical hotfix
```
/task-plan --critical --type hotfix

User: "Production is down, telegram bot not responding"
Assistant: "Critical issue confirmed. Let me gather specifics:
1. Are webhook requests reaching the worker? (check logs)
2. Any recent deploys or config changes?
3. Is the bot token still valid?
4. Database accessible?
I'll create an emergency fix plan with minimal changes."

Result: Creates Task #3 with critical priority
```

### Example 5: Complex feature with deep analysis
```
/task-plan --type feature --ultrathink

User: "Add portfolio rebalancing with automated trading"
Assistant: "🧠 Deep thinking mode activated - Maximum thinking budget allocated for comprehensive analysis

Following explore → plan → implement → verify workflow

[Using sequential thinking to analyze:]

[Using sequential thinking to analyze:]
- Architecture implications
- Risk factors and safety measures
- Integration points with existing systems
- Optimal task breakdown for agent success

After deep analysis, I've identified this needs to be split into 3 separate tasks:

Task #4: Portfolio Foundation (8 hrs)
- Safe, isolated infrastructure setup
- No trading risk at this stage

Task #5: Rebalancing Logic (10 hrs)
- Pure calculation engine
- Extensive testing before integration

Task #6: Trading Integration (8 hrs)
- Careful integration with safety checks
- Phased rollout approach

Each task has 4-5 focused subtasks designed for optimal agent execution.

Phase 1: Explore (Task #4)
- Research existing patterns and constraints
- Investigate API capabilities and limitations
- Identify potential risks and mitigations

Phase 2: Plan (Task #5)
- Design system architecture
- Create detailed specifications
- Define verification targets

Phase 3: Implement (Task #6)
- Execute with clear boundaries
- Use subagents for complex investigations
- Verify against targets at each step

Phase 4: Verify
- Ensure solution doesn't overfit initial constraints
- Validate all requirements met
- Run comprehensive tests"

Result: Creates 3 linked tasks with comprehensive specifications
```

## Task ID Format
Tasks use simple sequential numbers: `1`, `2`, `3`...
- Example: Task 1, Task 2, Task 3
- Subtasks: `1.1`, `1.2`, `1.3` (for display)
- Auto-increments from registry counter

Let's start planning. What would you like to work on?

**Tip**: For best results with complex tasks:
- Be extremely specific in your initial description
- Provide any visual targets (screenshots, examples)
- Mention any specific constraints or requirements
- Use --ultrathink for tasks requiring deep analysis