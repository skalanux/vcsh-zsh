#export QT_QPA_PLATFORMTHEME=qt5ct
export ZSH="$HOME/.oh-my-zsh"
#eval "$(oh-my-posh init zsh --config ~/ohmyphosh-tonybaloney.json)"
source $ZSH/oh-my-zsh.sh
alias kit="kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty"
alias vimdiff="nvim -d"
alias venv="source env/bin/activate"
#source /home/ska/.config/broot/launcher/bash/br
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
source /usr/share/doc/mcfly/mcfly.zsh
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=/opt/nvim-linux64/bin:$PATH
source /usr/share/nvm/init-nvm.sh
eval "$(starship init zsh)"

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
