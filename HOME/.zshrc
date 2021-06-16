# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd multios prompt_subst beep extendedglob nomatch notify

# The following lines were added by compinstall
zstyle :compinstall filename '/home/akshay/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


#---------------------------------------------------------------------------
# Custom_theme >>
# ls colors
autoload -U colors && colors
#enaable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

if [[ "$DISABLE_LS_COLORS" != "true" ]]; then  
	if [[ -z "$LS_COLORS" ]]; then
		(($+commands[dircolors])) && eval "$(dircolors -b)"
	fi

	ls --colors -d . &>/dev/null && alias ls='ls --color=tty' || {ls -G . &>/dev/null && alias ls='ls -G'}

	zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

#Enable_diff color if possible
if command diff --color . . &>/dev/null; then 
	alias diff='diff --color'
fi

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi
local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="╭─${user_host}${current_dir} 
╰─$PR_PROMPT "
RPROMPT="${return_code}"

}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
