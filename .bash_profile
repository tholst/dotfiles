export BASH_SILENCE_DEPRECATION_WARNING=1

# Load dotfiles:
for file in ~/.{bash_prompt,aliases,private}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#Git auto-complete
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# Setting PATH for Python 3.7
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Setting workspace path for Go
export GOPATH=${HOME}/dev/go/__workspace
