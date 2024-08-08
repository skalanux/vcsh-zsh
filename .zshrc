# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#export QT_QPA_PLATFORMTHEME=qt5ct
#export ZSH="$HOME/.oh-my-zsh"
#eval "$(oh-my-posh init zsh --config ~/ohmyphosh-tonybaloney.json)"
#source $ZSH/oh-my-zsh.sh
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

alias repy='export PATH=$VIRTUAL_ENV/bin:$PATH'

if [ -e /home/ska/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ska/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

## History wrapper
function omz_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    echo >&2 History file deleted. Reload the session to see its effects.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}

# Timestamp format
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
MCFLY_HISTORY=$HISTFILE
## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data


