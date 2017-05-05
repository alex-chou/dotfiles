EDITOR=vim

PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$PATH:/usr/local/go/bin:$(go env GOPATH)/bin"

# turn on ssh-agent if it is not on at the moment
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add
