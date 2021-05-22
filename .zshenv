# /bin override for this host
export PATH="$HOME/bin:$HOME/bin/$HOST:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='em'
fi
