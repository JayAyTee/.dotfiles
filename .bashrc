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
# source ~/.colors
# PS1="${color_red}[${color_yellow}\u${color_cyan}|${color_blue}\w${color_red}]${color_purple}\$ ${color_reset}"
source ~/git-prompt.sh
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; 
PS1='\[\e[91;1m\][\[\e[93m\]\u\[\e[36m\]|\[\e[94m\]\w\[\e[35m\]${PS1_CMD1}\[\e[91m\]]\[\e[92m\]\\$\[\e[0m\] '

source ~/.zoxide

. "$HOME/.cargo/env"

# Enable colored man pages
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # Green blink (start)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # Cyan bold (headings)
export LESS_TERMCAP_me=$(tput sgr0)               # Reset (end)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # Yellow on blue (status line)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)    # Reset (end of so)
export LESS_TERMCAP_us=$(tput smul; tput setaf 7) # White underline (subheadings)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)    # Reset (end of underline)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1                             # Important for konsole and gnome-terminal
 
# Finally, set the LESS options for general less behavior
export LESS='-R --use-color -Dd+r$Du+b'
export PAGER="less"
