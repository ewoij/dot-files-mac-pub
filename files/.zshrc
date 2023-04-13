# zsh
source ~/.zsh/stuff.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/vim.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'

# editor
export EDITOR='nvim'
export VISUAL='nvim'

# aliases
source ~/.zsh/git.zsh
alias ll='ls --color -lah'
alias md='mkdir -p'
alias copy="pbcopy"
alias paste="pbpaste"
alias shellcheck='docker run --rm -it -v "$PWD:/mnt" koalaman/shellcheck'
alias docker_kill="docker ps -q | xargs docker kill"
alias chrome_no_sec='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'
alias http_server='python3 -m http.server' # append port number
alias tmux_use_personal="echo $HOME/Documents/personal-projects > ~/.projects_dir.tmux.txt"
alias tmux_use_rc2="echo $HOME/Documents/personal-projects/reservation-cours-2 > ~/.projects_dir.tmux.txt"
alias pip='python3 -m pip'
# alias gp='echo dont push'

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# node
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

# functions
source ~/Documents/personal-projects/dot-files-mac/functions.sh
source ~/.functions.tmux.sh
source ~/.functions.stuff.sh

# completion
# curl -L https://raw.githubusercontent.com/docker/cli/18.06/contrib/completion/zsh/_docker -o ~/.zsh/completion/_docker
# curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose -o ~/.zsh/completion/_docker-compose
fpath=(~/.zsh/completion $fpath)
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# ruby
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="/Users/myuser/.gem/ruby/2.6.0/bin:$PATH"

# flutter
export FLUTTER_PATH="/Users/myuser/installations/flutter"
export PATH="/System/Volumes/Data/Users/myuser/Library/Android/sdk/platform-tools:$PATH"
export PATH="/Users/myuser/installations/flutter/bin:$PATH"

# pip
export PATH="$PATH:/Users/myuser/Library/Python/3.9/bin"

# use nvim as man pager
export MANPAGER='nvim +Man!'

# my scripts
export PATH="$PATH:/Users/myuser/Documents/projects/my_scripts"
