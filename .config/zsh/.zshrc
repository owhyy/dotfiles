# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
#[[ -s /home/snooze/.autojump/etc/profile.d/autojump.sh ]] && source /home/snooze/.autojump/etc/profile.d/autojump.sh

# Open lf
bindkey -s '^o' 'lfrun \n'
# Book finding script
bindkey -s '^b' 'find-books \n'
# Open most used projects in new tmux session
bindkey -s '^t' 'tmux-sessionizer \n'


# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Fuzzy-find
bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'
[ -f "${XDG_CACHE_HOME:-$HOME}/fzf.zsh" ] && source "${XDG_CACHE_HOME:-$HOME}/fzf.zsh"

# Sources
[[ ! -r /home/snooze/.opam/opam-init/init.zsh ]] || source /home/snooze/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# do paru -S autojump before
[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
autoload -U compinit && compinit -u
