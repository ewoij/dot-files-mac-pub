# tmux project
tp() {
    projects_dir=$(cat ~/.projects_dir.tmux.txt)
    dir=$(find "$projects_dir" -mindepth 1 -maxdepth 1 -type d | sed 's/^.*\///g' | sort | fzf --reverse)
    [[ $status != 0 ]] && return

    tmux list-sessions -F '#{session_name}' | grep ^$dir$
    if [[ $status != 0 ]]; then
        dir_path="$projects_dir/$dir"
        tmux new-session -c $dir_path -s "$dir" -d
        tmux send-keys -t "$dir:0.0" vim Enter
        tmux send-keys -t "$dir:0.0" :NERDTree Enter

        tmux new-window -c $dir_path -t "$dir" -d
        tmux send-keys -t "$dir:1.0" 'git lg' Enter
    fi

    tmux switch-client -t "$dir"
}
