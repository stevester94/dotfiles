echo source /etc/bash_completion.d/git >> ~/.bashrc
echo PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ ' >> ~/.bashrc
echo export TERM=xterm-256color >> ~/.bashrc
