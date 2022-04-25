# Setup fzf
# ---------
if [[ ! "$PATH" == */home/snooze/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/snooze/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/snooze/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/home/snooze/.fzf/shell/key-bindings.zsh"
