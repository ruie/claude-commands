#!/bin/bash

# Task Management Commands - SimpleClaude DNA Install Script
# Installs/updates task management commands with safety and intelligence
# Preserves user customizations and provides natural language feedback

set -e  # Exit on error
set -o pipefail  # Exit on pipe failure

# Colors for output
if [[ -t 1 ]] && [[ "$(tput colors 2>/dev/null)" -ge 8 ]]; then
    readonly GREEN='\033[0;32m'
    readonly YELLOW='\033[1;33m'
    readonly RED='\033[0;31m'
    readonly BLUE='\033[0;34m'
    readonly MAGENTA='\033[0;35m'
    readonly NC='\033[0m' # No Color
else
    readonly GREEN=''
    readonly YELLOW=''
    readonly RED=''
    readonly BLUE=''
    readonly MAGENTA=''
    readonly NC=''
fi

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/.claude"
DEFAULT_TARGET="$HOME/.claude"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')

# Function: show_usage
show_usage() {
    cat << EOF
Task Management Commands Install Script - SimpleClaude DNA Edition

Natural language task management for AI agents that gets smarter over time.

Usage: $0 [OPTIONS]

Options:
    --target <dir>     Target .claude directory (default: ~/.claude)
    --execute          Actually perform the installation (default: preview)
    --no-backup        Skip backup creation (not recommended)
    --dry-run          Preview changes without installing (default)
    --verbose, -v      Show detailed progress
    --help             Show this help message

Examples:
    $0                                    # Preview what would be installed
    $0 --execute                          # Install to ~/.claude
    $0 --target ~/project/.claude         # Preview for specific project
    $0 --execute --verbose                # Install with detailed output

What's New:
    • Natural language commands (no more flags!)
    • 65-line commands (85% smaller)
    • 7 core pattern files (simplified from 11)
    • Living memory system
    • Evidence-based decisions

EOF
}

# Parse arguments
TARGET_DIR="$DEFAULT_TARGET"
CREATE_BACKUP=true
DRY_RUN=true  # Default to dry-run for safety
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --target)
            TARGET_DIR="$2"
            shift 2
            ;;
        --no-backup)
            CREATE_BACKUP=false
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --execute)
            DRY_RUN=false
            shift
            ;;
        --verbose|-v)
            VERBOSE=true
            shift
            ;;
        --help|-h)
            show_usage
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            show_usage
            exit 1
            ;;
    esac
done

# Resolve symlinks
if [[ -L "$TARGET_DIR" ]]; then
    REAL_TARGET=$(readlink "$TARGET_DIR")
    echo -e "${BLUE}Note: $TARGET_DIR is a symlink to $REAL_TARGET${NC}"
    TARGET_DIR="$REAL_TARGET"
fi

# Validate directories
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo -e "${RED}Error: Source directory not found: $SOURCE_DIR${NC}"
    echo "Please run this script from the task-management-commands repository root."
    exit 1
fi

# Display header
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${MAGENTA}    Task Management Commands - SimpleClaude DNA Edition${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}Natural language task management that learns and evolves${NC}"
echo ""

# Check if target exists and show what's there
if [[ -d "$TARGET_DIR" ]]; then
    echo "Target: $TARGET_DIR ${GREEN}(exists)${NC}"
    
    # Check for existing task management
    if [[ -d "$TARGET_DIR/commands" ]]; then
        task_cmd_count=$(find "$TARGET_DIR/commands" -name "task-*.md" 2>/dev/null | wc -l)
        if [[ $task_cmd_count -gt 0 ]]; then
            echo -e "${YELLOW}Found $task_cmd_count existing task management commands${NC}"
        fi
    fi
    
    if [[ -d "$TARGET_DIR/shared/task-management" ]]; then
        echo -e "${YELLOW}Found existing task-management patterns${NC}"
    fi
else
    echo "Target: $TARGET_DIR ${YELLOW}(will be created)${NC}"
fi

echo "Source: $SOURCE_DIR"

if [[ "$DRY_RUN" = true ]]; then
    echo -e "${YELLOW}Mode: PREVIEW (no changes will be made)${NC}"
    echo -e "${BLUE}→ Use --execute to perform actual installation${NC}"
else
    echo -e "${GREEN}Mode: INSTALL${NC}"
fi
echo ""

# Function: file_hash
file_hash() {
    local file="$1"
    if [[ -f "$file" ]]; then
        if command -v sha256sum &> /dev/null; then
            sha256sum "$file" | cut -d' ' -f1
        elif command -v shasum &> /dev/null; then
            shasum -a 256 "$file" | cut -d' ' -f1
        else
            cksum "$file" | cut -d' ' -f1
        fi
    fi
}

# Create target directory if needed
if [[ ! -d "$TARGET_DIR" ]] && [[ "$DRY_RUN" = false ]]; then
    echo -e "${YELLOW}Creating target directory...${NC}"
    mkdir -p "$TARGET_DIR"
fi

# Create backups
if [[ "$CREATE_BACKUP" = true ]] && [[ "$DRY_RUN" = false ]] && [[ -d "$TARGET_DIR" ]]; then
    BACKUP_DIR="$TARGET_DIR/backups/task-management-$TIMESTAMP"
    echo -e "${YELLOW}Creating safety backup...${NC}"
    
    mkdir -p "$BACKUP_DIR"
    
    # Backup existing task commands
    if [[ -d "$TARGET_DIR/commands" ]]; then
        for file in "$TARGET_DIR/commands"/task-*.md; do
            if [[ -f "$file" ]]; then
                if [[ ! -d "$BACKUP_DIR/commands" ]]; then
                    mkdir -p "$BACKUP_DIR/commands"
                fi
                cp "$file" "$BACKUP_DIR/commands/"
                [[ "$VERBOSE" = true ]] && echo "  Backed up: $(basename "$file")"
            fi
        done
    fi
    
    # Backup task-management patterns
    if [[ -d "$TARGET_DIR/shared/task-management" ]]; then
        echo "  Backing up shared/task-management..."
        cp -r "$TARGET_DIR/shared/task-management" "$BACKUP_DIR/shared-task-management"
    fi
    
    echo -e "${GREEN}✓ Backup created at: $BACKUP_DIR${NC}"
    echo ""
fi

# Install task management commands
echo -e "${YELLOW}Installing task management commands...${NC}"
if [[ -d "$SOURCE_DIR/commands" ]]; then
    if [[ "$DRY_RUN" = false ]]; then
        mkdir -p "$TARGET_DIR/commands"
    fi
    
    updated_count=0
    added_count=0
    unchanged_count=0
    
    for file in "$SOURCE_DIR/commands"/*.md; do
        if [[ -f "$file" ]]; then
            basename_file=$(basename "$file")
            target_file="$TARGET_DIR/commands/$basename_file"
            
            if [[ -f "$target_file" ]]; then
                # File exists, check if different
                source_hash=$(file_hash "$file")
                target_hash=$(file_hash "$target_file")
                
                if [[ "$source_hash" != "$target_hash" ]]; then
                    if [[ "$DRY_RUN" = true ]]; then
                        echo "  Would update: $basename_file"
                    else
                        cp "$file" "$target_file"
                        echo "  Updated: $basename_file"
                    fi
                    ((updated_count++))
                else
                    [[ "$VERBOSE" = true ]] && echo "  Unchanged: $basename_file"
                    ((unchanged_count++))
                fi
            else
                # New file
                if [[ "$DRY_RUN" = true ]]; then
                    echo "  Would add: $basename_file"
                else
                    cp "$file" "$target_file"
                    echo "  Added: $basename_file"
                fi
                ((added_count++))
            fi
        fi
    done
    
    # Summary
    echo -e "${GREEN}  Commands: $added_count new, $updated_count updated, $unchanged_count unchanged${NC}"
fi

# Install task-management patterns
echo -e "${YELLOW}Installing task management patterns...${NC}"
if [[ -d "$SOURCE_DIR/shared/task-management" ]]; then
    if [[ "$DRY_RUN" = false ]]; then
        mkdir -p "$TARGET_DIR/shared/task-management"
    fi
    
    updated_count=0
    added_count=0
    unchanged_count=0
    
    for file in "$SOURCE_DIR/shared/task-management"/*.yml; do
        if [[ -f "$file" ]]; then
            basename_file=$(basename "$file")
            target_file="$TARGET_DIR/shared/task-management/$basename_file"
            
            if [[ -f "$target_file" ]]; then
                source_hash=$(file_hash "$file")
                target_hash=$(file_hash "$target_file")
                
                if [[ "$source_hash" != "$target_hash" ]]; then
                    if [[ "$DRY_RUN" = true ]]; then
                        echo "  Would update: $basename_file"
                    else
                        cp "$file" "$target_file"
                        echo "  Updated: $basename_file"
                    fi
                    ((updated_count++))
                else
                    [[ "$VERBOSE" = true ]] && echo "  Unchanged: $basename_file"
                    ((unchanged_count++))
                fi
            else
                if [[ "$DRY_RUN" = true ]]; then
                    echo "  Would add: $basename_file"
                else
                    cp "$file" "$target_file"
                    echo "  Added: $basename_file"
                fi
                ((added_count++))
            fi
        fi
    done
    
    # Install README if it doesn't exist
    if [[ -f "$SOURCE_DIR/shared/task-management/README.md" ]]; then
        target_readme="$TARGET_DIR/shared/task-management/README.md"
        if [[ ! -f "$target_readme" ]]; then
            if [[ "$DRY_RUN" = true ]]; then
                echo "  Would add: README.md"
            else
                cp "$SOURCE_DIR/shared/task-management/README.md" "$target_readme"
                echo "  Added: README.md"
            fi
        fi
    fi
    
    echo -e "${GREEN}  Patterns: $added_count new, $updated_count updated, $unchanged_count unchanged${NC}"
fi

# Check for old pattern files that can be removed
echo ""
if [[ -d "$TARGET_DIR/shared/task-management" ]]; then
    old_patterns=(
        "agent-patterns.yml"
        "command-patterns.yml"
        "planning-patterns.yml"
        "registry-patterns.yml"
        "scratchpad-patterns.yml"
        "task-core-patterns.yml"
        "thinking-patterns.yml"
        "verification-patterns.yml"
    )
    
    found_old=false
    for pattern in "${old_patterns[@]}"; do
        if [[ -f "$TARGET_DIR/shared/task-management/$pattern" ]]; then
            if [[ "$found_old" = false ]]; then
                echo -e "${YELLOW}Old pattern files detected (consolidated in new version):${NC}"
                found_old=true
            fi
            echo "  • $pattern"
        fi
    done
    
    if [[ "$found_old" = true ]]; then
        echo -e "${BLUE}  → These are now consolidated into 7 core files${NC}"
        echo -e "${BLUE}  → Old files are safe to remove after verifying the new system${NC}"
    fi
fi

# Final summary
echo ""
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
if [[ "$DRY_RUN" = true ]]; then
    echo -e "${YELLOW}Preview complete. No changes were made.${NC}"
    echo ""
    echo -e "${BLUE}Ready to install? Run:${NC}"
    echo "  $0 --execute"
else
    echo -e "${GREEN}✓ Installation complete!${NC}"
    echo ""
    echo -e "${BLUE}What's new with SimpleClaude DNA:${NC}"
    echo "  • Natural language commands (no more --flags!)"
    echo "  • Commands reduced to ~65 lines (from 300-500)"
    echo "  • Smart thinking modes (automatic depth selection)"
    echo "  • Living memory system (agents learn and share)"
    echo "  • Evidence-based decisions (no assumptions)"
    echo ""
    
    if [[ "$CREATE_BACKUP" = true ]]; then
        echo -e "${BLUE}Your previous configuration was backed up to:${NC}"
        echo "  $BACKUP_DIR"
        echo ""
    fi
    
    echo -e "${GREEN}Try these natural language commands:${NC}"
    echo "  /task-plan create urgent email notification system"
    echo "  /task-execute all high priority tasks carefully"
    echo "  /task-status why are tasks blocked"
    echo ""
    echo -e "${BLUE}Initialize task management system:${NC}"
    echo "  /task-init"
fi
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"