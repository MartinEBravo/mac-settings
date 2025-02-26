# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme: Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump alias-finder)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Conda Initialization
__conda_setup="$('/Users/martinbravodiaz/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/martinbravodiaz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/martinbravodiaz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/martinbravodiaz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Powerlevel10k Configuration
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status conda virtualenv)
POWERLEVEL9K_CONDA_BACKGROUND="green"
POWERLEVEL9K_CONDA_FOREGROUND="black"

# Source Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Auto-activate Conda environment
conda init
# Custom function to activate Conda environment
function c() {
    if [ -z "$1" ]; then
        conda activate
    else
        conda activate $1
    fi
}
clear
cat ./mb.txt

# Custom command to reload the terminal
reload() {
    source ~/.zshrc
    clear
    cd ~
    cat ./mb.txt
}


export DYLD_LIBRARY_PATH="/usr/local/opt/libomp/lib:$DYLD_LIBRARY_PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/martinbravodiaz/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/martinbravodiaz/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/martinbravodiaz/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/martinbravodiaz/google-cloud-sdk/completion.zsh.inc'; fi
export DYLD_LIBRARY_PATH=/opt/homebrew/opt/libomp/lib:$DYLD_LIBRARY_PATH
export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

