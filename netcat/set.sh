# install netcat on linux
sudo apt-get -y install ncat

# install tmux
sudo apt install tmux

#FOR LINUX

# LISTENER
ncat -lvp 9000 --exec "/bin/bash"

# CONNECTER
ncat 10.147.17.162 9000

# run at background
nohup ncat -lvp 9000 --exec "/bin/bash" > ncat_output.log 2>&1 &

# Explanation:

# nohup: Prevents the command from being terminated when the terminal is closed.
# ncat -lvp 4848 --exec "/bin/bash": The ncat command with the necessary options.
# > ncat_output.log 2>&1: Redirects both standard output and standard error to a file called ncat_output.log.
# &: Runs the command in the background.
# After running this command, you should see output in ncat_output.log, and the ncat process will continue running in the background.