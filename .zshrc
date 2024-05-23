# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.local/bin:$PATH"


export PATH=/opt/nvim-linux64/bin:$PATH
source /usr/share/nvm/init-nvm.sh
#eval "$(starship init zsh)"
alias ls='exa --icons -F -H --group-directories-first --git -1'
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
