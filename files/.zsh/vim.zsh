# if file on_before_vim.sh exists, load it
function vim()
(
    on_before_file=".stuff/on_before_vim.sh"
    if [[ -a "$on_before_file" ]]; then
        echo Sourcing "$on_before_file" 
        source "$on_before_file"
    fi

    nvim $@
)
