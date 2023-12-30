# install netcat on linux
sudo apt-get -y install ncat

# install tmux
sudo apt install tmux

#FOR LINUX

# LISTENER
ncat -lvp 9000 --exec "/bin/bash"

# CONNECTER
ncat 10.147.17.162 9000
