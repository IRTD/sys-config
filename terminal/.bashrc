if tmux has-session 2> /dev/null; then
    tmux attach
else
    tmux new -d -s std -n std
    tmux send-keys -t std:std "source ~/.tmux_start_bashrc" Enter "clear" Enter
    
    tmux attach
fi
