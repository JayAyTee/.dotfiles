# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
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
export PROMPT='%B%F{red}[\
%F{yellow}%n\
%F{green}|\
%F{blue}%~\
%F{magenta}${vcs_info_msg_0_}\
%F{red}]\
%F{cyan}$\
 %f%b'

source ~/.zoxide
