# Load custom env variables & aliases
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
if [ -f ~/.env_variables ]; then
  . ~/.env_variables
fi
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# Useful packages
# direnv - load/unload environment variables based on $PWD (from Rails 7 book)

# Zsh plugins
# Spaceship
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
# Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load Rbenv
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

