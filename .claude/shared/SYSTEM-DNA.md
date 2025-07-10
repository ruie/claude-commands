# system dna - command creation blueprint

this document captures the essential dna of our command system. use this as a blueprint when creating new commands to maintain consistency.

## core dna principles

### 1. simplicity over complexity
- **60-65 lines per command** - no exceptions
- **natural language only** - no flags, no complex syntax
- **single purpose** - each command does one thing well
- **conversational interface** - like talking to a helpful assistant

### 2. command structure template
every command follows this exact structure:
```markdown
**Purpose**: [single clear statement - what this command does]

---

@include shared/[domain]/includes.yml

## Command Execution

**If "$ARGUMENTS" is empty**: Display conversational usage examples  
**If "$ARGUMENTS" has content**: Parse natural language intent

Transforms: "$ARGUMENTS" into structured workflow:

- What: [extracted goal]
- How: [approach strategy]  
- Depth: [thinking mode]
- [Other relevant dimensions]

**Core Process**: [Main workflow description in one line]

[Brief description of what the command does with natural language]

### Semantic Transformations

```
"[natural example 1]" →
  What: [specific extraction]
  How: [approach taken]
  [Other dimensions]

"[natural example 2]" →
  What: [different case]
  How: [different approach]
  [Other dimensions]
```

Examples:

- `/[command] [conversational request]` - [what happens]
- `/[command] [different request]` - [different behavior]
- `/[command] [complex request]` - [advanced behavior]

**Context Detection**: [Input analysis] → [Intent extraction] → [Processing]

## Core Workflows

**Phase 1**: [Action] → [Action] → [Result]  
**Phase 2**: [Action] → [Action] → [Result]  
**Phase 3**: [Action] → [Action] → [Result]
```

### 3. pattern file architecture

#### pattern files should be 7-10 focused yaml files:
1. **natural-intelligence.yml** - language understanding
2. **[domain]-cognition.yml** - how the system thinks
3. **[domain]-workflows.yml** - step-by-step processes
4. **knowledge-management.yml** - memory and learning
5. **coordination-patterns.yml** - multi-component orchestration
6. **thinking-integration.yml** - cognitive depth management
7. **error-recovery.yml** - failure handling

#### pattern file structure:
```yaml
# Pattern Category Name
# Brief description of what these patterns handle

Pattern_Section:
  principle: "guiding philosophy"
  
  subsection:
    description: "what this handles"
    key_patterns:
      - "pattern 1"
      - "pattern 2"
    
    transformations:
      "input example" →
        field1: value1
        field2: value2
```

### 4. natural language principles

#### semantic understanding:
- detect intent from conversational input
- no flags or structured syntax ever
- context clues guide behavior
- graceful interpretation of ambiguity

#### transformation examples:
```yaml
"quickly process all pending items" →
  urgency: high
  scope: all_pending
  mode: fast_execution

"carefully analyze the payment system" →
  care_level: high
  target: payment_system
  mode: deep_analysis
```

### 5. evidence-based language

#### required patterns:
- "found in {location}"
- "based on {evidence}"
- "{count} occurrences"
- "tests show {result}"

#### forbidden patterns:
- "should work"
- "probably"
- "might be good"
- "seems optimal"
- any speculation without evidence

### 6. @include system usage

#### central registry (includes.yml):
```yaml
category_name:
  pattern_name: shared/[domain]/[file].yml#Section_Name
  another_pattern: shared/[domain]/[file].yml#Another_Section
```

#### in commands:
```markdown
@include shared/[domain]/includes.yml

# or specific includes:
@include shared/[domain]/[file].yml#Specific_Section
```

### 7. thinking modes integration

#### three modes (auto-detected):
- **standard**: 3-5 thoughts for simple tasks
- **think-hard**: 8-10 thoughts (default for most operations)
- **ultrathink**: 10-15 thoughts for complex analysis

#### natural triggers:
- "quickly" → standard
- "carefully" → think-hard
- "deeply analyze" → ultrathink

### 8. command naming conventions

#### follow verb-noun pattern:
- task-plan, task-execute, task-status
- file-analyze, file-transform, file-merge
- code-review, code-refactor, code-document

#### keep names:
- lowercase with hyphens
- 2-3 words maximum
- action-oriented
- domain-specific

### 9. error handling philosophy

- fail gracefully with helpful messages
- suggest corrections for common mistakes
- never leave user confused
- provide next steps

### 10. testing requirements

every new command needs:
- natural language parsing tests
- evidence language validation
- command length verification (<70 lines)
- pattern file existence checks

## example: creating a new command

let's say you want to create a code review command:

1. **choose domain**: `code-review`
2. **create command file**: `.claude/commands/code-review.md`
3. **follow template exactly**: 60-65 lines
4. **create pattern files**:
   - `code-review-intelligence.yml`
   - `review-workflows.yml`
   - `quality-patterns.yml`
5. **natural language examples**:
   - "review the authentication module"
   - "deeply analyze security in payment.ts"
   - "quick review of recent changes"
6. **test with test framework**

## dna preservation rules

1. **never add flags** - natural language only
2. **never exceed 70 lines** - split into patterns
3. **never skip evidence** - always cite sources
4. **never break boundaries** - respect isolation
5. **always document learning** - knowledge persists

## success metrics

a command follows dna when:
- ✓ humans use it conversationally
- ✓ agents understand it naturally
- ✓ code stays under 65 lines
- ✓ patterns are reusable
- ✓ knowledge accumulates
- ✓ errors are helpful
- ✓ simplicity is maintained

---

remember: surface simplicity, deep intelligence. 
make it feel like magic while being completely reliable.