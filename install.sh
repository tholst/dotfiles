#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_prompt aliases gitconfig"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download Git Auto-Completion
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${homedir}/.git-completion.bash

# Run the Homebrew Script
./brew.sh

# Download Docker Auto-Completion
curl -L https://raw.githubusercontent.com/docker/compose/1.25.4/contrib/completion/bash/docker-compose -o /usr/local/etc/bash_completion.d/docker-compose
curl -L https://raw.githubusercontent.com/docker/machine/v0.16.0/contrib/completion/bash/docker-machine.bash -o `brew --prefix`/etc/bash_completion.d/docker-machine
curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o `brew --prefix`/etc/bash_completion.d/docker
