function daily_path() {
    local target_date="${1:-$(date +%Y-%m-%d)}"
    local file_path="$HOME/notes/daily/$target_date.md"
    local template_path="$HOME/notes/templates/daily_template.md"

    if [ ! -f "$file_path" ]; then
        # >&2 redirects this text to "Standard Error"
        # This means you see the message, but nvim won't try to open the text "Creating..."
        echo "Creating new note for $target_date..." >&2
        sed "s/{{DATE}}/$target_date/g" "$template_path" > "$file_path"
    fi

    # This is the "Return Value"
    echo "$file_path"
}

alias daily="daily_path"
alias edaily="nvim \$(daily_path)"
