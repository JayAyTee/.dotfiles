# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alvin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# My zsh config

# Add cargo to path
PATH="$PATH:/home/alvin/.cargo/bin"

# Wonderful "alia"
export NVIM_APPNAME=nvim-minimal
export EDITOR="nvim"
alias v="nvim"
alias vim="nvim"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias dev="cd ~/dev/"
alias media="cd /mnt/Media/"
alias grep='grep --color=auto'
alias ssh='TERM=xterm-256color ssh'

hiddeninhome="$("$HOME/.scripts/generatehidden")"
alias lsa="eza -la --color=always --group-directories-first"
ls() {
  if [[ $PWD == $HOME ]]; then
    eza -la --color=always --group-directories-first \
      --ignore-glob="$hiddeninhome" "$@"
  else
    eza -la --color=always --group-directories-first "$@"
  fi
}

# Prompt
setopt PROMPT_SUBST
# Weird ass zsh-git syntax
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)'
export PROMPT='%B%F{red}[%F{yellow}%n%F{green}|%F{blue}%~%F{magenta}${vcs_info_msg_0_}%F{red}]%F{cyan}$ %f%b'

source ~/.zoxide

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
export PAGER='less'
