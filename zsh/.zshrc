# 1. The Logic (Creates file if missing, prints path)
function daily_path() {
    local target_date="${1:-$(date +%Y-%m-%d)}"
    local file_dir="$HOME/notes/daily"
    local file_path="${file_dir}/${target_date}.md"
    local template_path="$HOME/notes/templates/daily_template.md"

    # Ensure daily directory exists
    mkdir -p "$file_dir"

    # Create file if it doesn't exist (Side Effect)
    if [ ! -f "$file_path" ]; then
        echo "Creating new note for $target_date..." >&2
        if [ -f "$template_path" ]; then
            sed "s/{{DATE}}/$target_date/g" "$template_path" > "$file_path"
        else
            echo "# Daily Note: $target_date" > "$file_path"
        fi
    fi

    # Only print the path (so the caller can use it)
    echo "$file_path"
}

# 2. The Command (Moves to ~/notes and opens editor)
function edaily() {
    # This runs daily_path. If the file is missing, it gets created NOW.
    # The path is captured in the variable.
    local full_path=$(daily_path "$1")
    
    # Change CWD to the parent 'notes' directory
    cd "$HOME/notes" || return
    
    # Open Neovim with the full path we captured earlier
    nvim "$full_path"
}

# Alias for when you just want the path string
alias daily="daily_path"
