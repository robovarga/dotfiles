# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{prompt,exports,cloudrc,aliases}; do	
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
# . ~/code/z/z.sh

# init rvm
#source ~/.rvm/scripts/rvm


# Case-insensitive globbing (used in pathname expansion)
#shopt -s nocaseglob

# Prefer US English and use UTF-8
#export LC_ALL="en_US.UTF-8"
#export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Ensure all SSH keys are added
ssh-add ~/.ssh/id_rsa >/dev/null 2>&1


# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults


# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
