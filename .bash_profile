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

# Setting PATH and JAVA_HOME for GraalVM (but putting /usr/local/bin in front of it, so we won't use GraalVM's bundled node.js engine)
GRAALVM_HOME="/Library/Java/JavaVirtualMachines/graalvm-ce-java11-19.3.1/Contents/Home"
if [ -d $GRAALVM_HOME ]; then
    export GRAALVM_HOME
    JAVA_HOME=$GRAALVM_HOME
    export JAVA_HOME
    PATH="${GRAALVM_HOME}/bin:${PATH}"
    PATH="/usr/local/bin:${PATH}"
    export PATH
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Setting workspace path for Go
export GOPATH=${HOME}/dev/go/__workspace
