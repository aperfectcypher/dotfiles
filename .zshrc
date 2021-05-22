
eval $(thefuck --alias)

# Path to oh-my-zsh-custom folder
  export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="spaceship"
 
  # Spaceship customization
 
 SPACESHIP_PROMPT_ORDER=(
   user          # Username section
   dir           # Current directory section
   host          # Hostname section
   golang        # Go section
   rust          # Rust section
   docker        # Docker section
   venv          # virtualenv section
   conda         # conda virtualenv section
   pyenv         # Pyenv section
   kubectl       # Kubectl context section
   exec_time     # Execution time
   line_sep      # Line break
   jobs          # Background jobs indicator
   exit_code     # Exit code section
   char          # Prompt character
 )
 
 SPACESHIP_RPROMPT_ORDER=(
    git           # Git section (git_branch + git_status)
 )
 
 SPACESHIP_CHAR_SYMBOL='$ '
 SPACESHIP_CHAR_SYMBOL_ROOT='# '
# Number of folders of cwd to show in prompt, 0 to show all
 SPACESHIP_DIR_TRUNC=4
# While in git repo, show only root directory and folders inside it
 SPACESHIP_DIR_TRUNC_REPO=false
# Character to be shown before Docker versionCharacter to be shown before Docker version
 SPACESHIP_DOCKER_SYMBOL='Docker '
# The minimum number of seconds for showing execution time section
 SPACESHIP_EXEC_TIME_ELAPSED=1
# Show exit code of last command
 SPACESHIP_EXIT_CODE_SHOW=true
 SPACESHIP_EXIT_CODE_SYMBOL='✘ ' 

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git-auto-fetch
    colored-man-pages
    command-not-found
    thefuck
    themes
    zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666,underline"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='em'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls="exa"
alias em="emacsclient --socket-name instance1 -c -nw"
alias msfconsole="msfconsole -x \"db_connect ${USER}@msf\""

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tla/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tla/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tla/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tla/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# /bin override for this host
export PATH="$HOME/bin/$HOST:$PATH"

#if conda is installed on the system, remove the environement prompt
conda -V $> /dev/null
if [ $? -eq 0 ]; then
    conda config --set changeps1 false 
fi

#TMUX 
session_name="def-sess"
window_name="def_win"

# 1. First you check if a tmux session exists with a given name.
tmux has-session -t=$session_name 2> /dev/null

# 2. Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
    TMUX='' tmux new-session -d -s "$session_name" -n "$window_name"
fi

# 3. Attach if outside of tmux.
if [[ -z "$TMUX" ]]; then
    tmux attach -t "$session_name"
fi

export DISPLAY=:0.0
