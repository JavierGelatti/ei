#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of arguments"
    echo "Usage: ei <filename>"
    exit
fi

SESSION_ID=$(cat /proc/sys/kernel/random/uuid)
FILE_NAME=$1

case $FILE_NAME in
    *.rb)
        SCRIPT="ruby $FILE_NAME";;
    *.c)
        SCRIPT="gcc $FILE_NAME -o $SESSION_ID && ./$SESSION_ID && rm $SESSION_ID";;
    *.cpp)
        SCRIPT="g++ $FILE_NAME -o $SESSION_ID && ./$SESSION_ID && rm $SESSION_ID";;
    *.hs)
        SCRIPT="runhaskell $FILE_NAME";;
    *.js)
        SCRIPT="node $FILE_NAME";;
    *.st)
        SCRIPT="gst $FILE_NAME";;
    *.sh)
        SCRIPT="./$FILE_NAME";;
    *)
        echo "I don't know what to do with file $FILE_NAME :("
        exit;;
esac

tmux new -d -s $SESSION_ID

tmux send-keys "editor $1" C-m
tmux split-window -h
tmux send-keys "when-changed $FILE_NAME \"clear && $SCRIPT\"" C-m
tmux select-pane -L

tmux attach -t $SESSION_ID
