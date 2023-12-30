# install
apt install tmux

# start
tmux

# to de-attach from a session
ctrl + B then D

# to terminate 

ctrl + B then type
:kill-session


As with most environments, tmux offers kill-* commands:
Ctrl+B :kill-session – kill the active session, all its windows and panes.
Ctrl+B :kill-window or Ctrl+B & – kill the active window and all panes within it.
Ctrl+B :kill-pane or Ctrl+B x – kill the active pane.
