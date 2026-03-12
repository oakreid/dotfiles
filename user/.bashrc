# stop weird ctrl-s/ctrl-q behavior
stty -ixon

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# auto-use colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# redo last command with sudo
alias please='sudo $(history -p !!)'

# greg
alias greg='git grep'

# connect/disconnect galaxy buds
alias connect-buds='bluetoothctl connect 08:BF:A0:A7:52:C5'
alias disconnect-buds='bluetoothctl disconnect 08:BF:A0:A7:52:C5'
alias reconnect-buds='disconnect-buds && connect-buds'

# enable mic on earbuds
alias mic-check='connect-buds && pactl set-card-profile bluez_card.08_BF_A0_A7_52_C5 handsfree_head_unit'

# disable mic on earbuds (better sound)
alias mic-drop='connect-buds && pactl set-card-profile bluez_card.08_BF_A0_A7_52_C5 a2dp_sink'

# restart pulseaudio
alias bounce-audio='pulseaudio --kill && pulseaudio --start'

# prevent accidental reboot
alias reboot='echo "You probably didn'"'"'t mean to do that"'

# xclip to system clipboard
alias clip='xclip -selection clipboard'

# add current directory to path
alias path-here='export PATH=$PATH:$(pwd)'

# configure personal local repo
alias config-oakreid='git config --add --local user.email oakreid@gmail.com; git config --add --local user.signingkey ~/.ssh/id_ed25519_personal.pub'

# create empty commit
alias tci="git commit -m 'Trigger CI' --allow-empty"

# run git commands with oakreid ssh key
as-oakreid () {
    GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_personal -o IdentitiesOnly=yes" $@
}

# open man page in vim
viman() {
    man ${2:-} $1 | vim -c "set nonumber" -R -
}

# strip ANSI characters from a file in-place
strip-ansi() {
    sed -i 's/\x1b\[[0-9;]*m//g' $1
}

# decrypt ansible-vault ciphertext
vault-decrypt () {
    printf "%s\n" $1 | ansible-vault decrypt && echo
}

# create a secure password and encrypt it with ansible-vault
vault-pwgen () {
    ansible-vault encrypt_string $(pwgen -s 32 1 | tr -d "\n")
}


# Environment variables

# gpg
export GPG_TTY=$(tty)

# golang
# export GOPATH=/home/oreid/.local/share/gopath
# export GOROOT=/home/oreid/.local/share/goroot
# export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# nodejs
# export PATH=$PATH:/home/oreid/.local/share/node-v20.13.1-linux-x64/bin

# rust
# . "$HOME/.cargo/env"

# secrets
source ~/.bashrc_private

# other
export TERM=xterm
