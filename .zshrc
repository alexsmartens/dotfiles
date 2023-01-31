# Load custom env variables & aliases
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

# Load NVM
# Note: nvm conflicts with zsh global alias, the solution is to turn off
# alias expansion and then turn it back on, more: https://github.com/nvm-sh/nvm/issues/2362
setopt no_aliases
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
setopt aliases

# Load Rbenv
eval "$(rbenv init -)"

## INSTALLATION of Zsh & Plugins (with brew)
# brew install zsh
# brew install spaceship
# [? maybe later instead of spaceship ?] brew install starship
# brew install autojump
# brew install zsh-autosuggestions
# brew install zsh-syntax-highlighting

# Zsh plugins
# [? maybe later instead of spaceship ?] Starship
# [? maybe later instead of spaceship ?] eval "$(starship init zsh)"
# Spaceship
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
# Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

