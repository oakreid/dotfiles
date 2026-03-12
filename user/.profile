# source bashrc
if [ -f ~/.bashrc ]; then
     . ~/.bashrc
fi

# set PATH so it includes user's private bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# start ssh agent
eval $(ssh-agent -s)

# start i3
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
