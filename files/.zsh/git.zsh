alias gaa='git add --all'
alias ga='git add'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gam='git am'
alias gamscp='git am --show-current-patch'
alias gams='git am --skip'
alias gapa='git add --patch'
alias gap='git apply'
alias gapt='git apply --3way'
alias gau='git add --update'
alias gav='git add --verbose'
alias gba='git branch -a'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gb='git branch'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbs='git bisect'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gcb='git checkout -b'
alias gcd='git checkout $(git_develop_branch)'
alias gcf='git config --list'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gclean='git clean -id'
alias gcl='git clone --recurse-submodules'
alias gcm='git checkout $(git_main_branch)'
alias gcmsg='git commit -m'
alias gcn!='git commit -v --no-edit --amend'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcount='git shortlog -sn'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcp='git cherry-pick'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gcss='git commit -S -s'
alias gcssm='git commit -S -s -m'
alias gdca='git diff --cached'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gdcw='git diff --cached --word-diff'
alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdu='git diff @{u}'
alias gdw='git diff --word-diff'
alias gfg='git ls-files | grep'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gga='git gui citool --amend'
alias gg='git gui citool'
alias g='git'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpur='ggu'
alias ggpush='git push origin "$(git_current_branch)"'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gignore='git update-index --assume-unchanged'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
alias gke='\gitk --all $(git log -g --pretty=%h)'
alias gk='\gitk --all --branches'
alias glgga='git log --graph --decorate --all'
alias glgg='git log --graph'
alias glg='git log --stat'
alias gl='git pull'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gloga='git log --oneline --decorate --graph --all'
alias glog='git log --oneline --decorate --graph'
alias glo='git log --oneline --decorate'
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glp="_git_log_prettily"
alias glum='git pull upstream $(git_main_branch)'
alias gma='git merge --abort'
alias gm='git merge'
alias gmom='git merge origin/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'
alias gpd='git push --dry-run'
alias gpf!='git push --force'
alias gpf='git push --force-with-lease'
alias gp='git push'
alias gpoat='git push origin --all && git push origin --tags'
alias gpr='git pull --rebase'
alias gpristine='git reset --hard && git clean -dffx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gra='git remote add'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grev='git revert'
alias gr='git remote'
alias grh='git reset'
alias grhh='git reset --hard'
alias grmc='git rm --cached'
alias grm='git rm'
alias grmv='git remote rename'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grs='git restore'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gst='git status'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='gsta --include-untracked'
alias gsu='git submodule update'
alias gswc='git switch -c'
alias gsw='git switch'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
