function notifyMe
    if [ $status -eq 0 ]
        osascript -e 'display notification "The command worked" with title "Success"'
        say "I completed successfully"
    else
        osascript -e 'display notification "The command failed" with title "Failed"'
        say "I failed to run successfully"
        echo $status
    end
end

function clear_system_caches --description "Clear user + system caches safely"
    echo "Clearing user caches..."
    rm -rf ~/Library/Caches/*

    echo "Clearing system caches (requires sudo)..."
    sudo rm -rf /Library/Caches/*

    echo "Clearing user logs..."
    rm -rf ~/Library/Logs/*

    echo "Done. You may want to restart your Mac."
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function dectohex
    echo "Type a dec number"
    read decNum
    printf "The hexadecimal value of $decNum=0x%x\n" $decNum
end

function hextodec
    echo "Type a hex number"
    read hexNum
    set dec (math "0x$hexNum")
    printf "The decimal value of $hexNum = $dec"
end

function activatepy
    source "./venv/bin/activate.fish"
end

#
# FZF - Fuzzy finder
function fftn --description "fuzzy find file and open in tmux split"
    fd --type f | fzf --bind 'alt-enter:execute(tmux split-window "nvim {}")'
end

function ffn --description "fuzzy find file and open in nvim"
    fd --type f | fzf --bind 'enter:execute(nvim {})'
end

function fdn --description "fuzzy find and cd to directory"
    set dir (fd --type d | fzf --preview "lsd -la {}")
    if test -n "$dir"
        nvim $dir
    end
end

function fcd --description "fuzzy find and cd to directory"
    set dir (fd --type d | fzf --preview "lsd -la {}")
    if test -n "$dir"
        cd $dir
    end
end

function ffpn --description "preview and open file in nvim"
    set file (fd --type f | fzf --preview "bat --style=numbers --color=always {}" --height 50% --reverse)
    if test -n "$file"
        nvim $file
    end
end

function tm --description "attach tmux to last session"
    if tmux has-session
        tmux attach-session
    else
        tmux new-session -s main
    end
end

function ts --description "attach tmux to a session by name"
    if test -z "$argv[1]"
        echo "Usage: ts <session_name>"
        return 1
    end
    set -l session_name "$argv[1]"

    if not tmux has-session -t $session_name
        tmux new-session -d -s $session_name
    end
    tmux attach-session -t $session_name
end

function mkcd --description 'create a directory and cd into it'
    mkdir $argv[1]
    cd $argv[1]
end

function git-cleanup --description "Clean up git branches and pull latest changes"
    echo "=== Git Branch Cleanup Script ==="
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end
    if not git diff-index --quiet HEAD --
        echo "Error: You have uncommitted changes in your working directory"
        echo "Please commit or stash your changes before running this script"
        git status --short
        return 1
    end
    if test -n (git ls-files --others --exclude-standard)
        echo "Warning: You have untracked files in your working directory"
        git ls-files --others --exclude-standard
        echo "Continue anyway? (y/N)"
        read -l response
        if not string match -qi y "$response"
            echo "Aborted."
            return 1
        end
    end
    set -l main_branch (git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'; or echo "main")

    echo "Detected main branch: $main_branch"
    echo "Checking out $main_branch branch..."
    git checkout "$main_branch"
    or return $status
    echo "Pulling latest changes..."
    git pull origin "$main_branch"
    or return $status
    echo "Pruning remote-tracking branches..."
    git remote prune origin
    or return $status
    echo "Deleting local branches that have been deleted upstream..."
    for branch in (git branch --format='%(refname:short)' | grep -v "^$main_branch\$")
        set -l upstream (git rev-parse --abbrev-ref "$branch@{upstream}" 2>/dev/null; or echo "")

        if test -n "$upstream"
            if not git show-ref --verify --quiet "refs/remotes/$upstream"
                echo "Deleting branch '$branch' (upstream '$upstream' was deleted)"
                git branch -d "$branch" 2>/dev/null; or git branch -D "$branch"
                or return $status
            end
        end
    end

    echo "=== Cleanup complete! ==="
end
