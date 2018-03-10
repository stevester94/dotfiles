cat << 'EOF' >> ~/.bashrc
source /etc/bash_completion.d/git >> ~/.bashrc
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)") \$ '
export TERM=xterm-256color >> ~/.bashrc
EOF
