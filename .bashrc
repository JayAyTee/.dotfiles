#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH="$PATH:/home/alvin/.cargo/bin"

export EDITOR="nvim"
alias v="nvim"
alias vim="nvim"

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias dev="cd ~/dev/"
alias media="cd /mnt/Media/"

#alias ls='eza -la --color=always --group-directories-first --git-ignore'
#hiddeninhome=".bash_*|.npm|.var|.vscode*|.yarn|.rustup|.librewolf"
hiddeninhome=$(~/.scripts/generatehidden);
alias lsa='eza -la --color=always --group-directories-first'
ls() {
  if [[ "$PWD" == "$HOME" ]]; then
    eza -la --color=always --group-directories-first --ignore-glob="$hiddeninhome" "$@"
  else
    eza -la --color=always --group-directories-first "$@"
  fi
}
alias grep='grep --color=auto'
source ~/.colors
PS1="${color_red}[${color_yellow}\u${color_cyan}|${color_blue}\w${color_red}]${color_purple}\$ ${color_reset}"

source ~/.zoxide

. "/home/alvin/.local/share/bob/env/env.sh"
. "$HOME/.cargo/env"
