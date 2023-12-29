# install netcat on linux
sudo apt-get -y install ncat

# install tmux
sudo apt install tmux

#FOR LINUX

# LISTENER
ncat -lvp 4848 --exec "/bin/bash"

# CONNECTER
ncat 10.147.17.162 4848
