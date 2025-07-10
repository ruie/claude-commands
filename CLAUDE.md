# Task Management System - CLAUDE.md Template

Add this section to your project's CLAUDE.md file for optimal task management integration.

```markdown
## Task Management System

### Overview
This project uses a custom task management system with strict isolation and registry-based tracking. All project work MUST use this system - no exceptions.

### 🚨 CRITICAL RULES (MEMORIZE THESE)
1. **NEVER use TodoWrite for project tasks** - Only use task registry
2. **Update registry after EVERY subtask** - Failure = task failure  
3. **Update scratchpad CONTINUOUSLY** - Document every learning
4. **Stay within task boundaries** - Only modify allowed_paths
5. **Default think-hard mode** - 8-10 thoughts minimum

### Registry Protocol
\`\`\`bash
# After EVERY subtask completion:
1. Read tasks/task-registry.json
2. Update subtask status + timestamp
3. Write atomically
4. Verify success
5. Update scratchpad with learnings
\`\`\`

### Task Command Quick Reference
\`\`\`bash
# Planning
/task-plan --type feature           # Standard feature (think-hard)
/task-plan --type bug --parent 1    # Bug fix for completed task
/task-plan --ultrathink            # Complex feature (10-15 thoughts)

# Execution  
/task-execute --tasks 1,2,3        # Specific tasks
/task-execute --tasks last         # Most recent task
/task-execute --ultrathink         # Maximum thinking for agents

# Monitoring
/task-status                       # Quick overview
/task-status --analyze             # Deep blocker analysis
/task-status --task 2 --include-related  # Task relationships
\`\`\`

### Agent Isolation Rules
\`\`\`yaml
Allowed to modify:
  - Your task folder: tasks/active/task-X/
  - Assigned modules: src/modules/[specific]/
  - Test files: tests/[specific]/

FORBIDDEN to modify:
  - Other task folders: tasks/active/task-Y/
  - Task registry (except status updates)
  - System files: .claude/, wrangler.toml
  - Other modules outside your scope
\`\`\`

### Thinking Mode Guidelines
- **Default**: Think-hard (8-10 thoughts) for all operations
- **Use --ultrathink when**:
  - Designing new architecture
  - Debugging complex issues  
  - Tasks with 5+ subtasks
  - Integration with external APIs
  - Performance optimization

### Subagent Delegation Triggers
Delegate to subagents for:
1. **API Research**: External API endpoints, rate limits
2. **Documentation**: Framework patterns, library usage
3. **Error Investigation**: Stack traces, dependency conflicts
4. **Pattern Discovery**: Finding similar implementations

### Common Workflows

#### Feature Development
\`\`\`bash
/task-plan --type feature
# Describe feature clearly
# Let planner create 1-3 hour subtasks
# Review spec before executing
/task-execute --tasks last
\`\`\`

#### Bug Fix for Completed Task
\`\`\`bash
/task-plan --type bug --parent 1
# Describe bug found in Task #1
# Creates linked task preserving context
/task-execute --tasks 2
\`\`\`

#### Complex Feature with Research
\`\`\`bash
/task-plan --type feature --ultrathink
# Describe complex requirements
# Planner uses 10-15 thoughts
# Creates multi-phase approach
# Identifies subagent opportunities
\`\`\`

### Quality Checklist (Before Marking Complete)
- [ ] All subtasks completed in registry
- [ ] Tests passing
- [ ] No console.log or debug code
- [ ] Scratchpad documents learnings
- [ ] No modifications outside allowed_paths

### Task File Structure
\`\`\`
tasks/active/task-X/
├── spec.md          # Task specification (read-only)
├── scratchpad.md    # Working notes (UPDATE CONTINUOUSLY)
├── files/           # Task-specific files
├── targets/         # Verification targets
└── thinking.log     # Thinking process (auto-generated)
\`\`\`
```