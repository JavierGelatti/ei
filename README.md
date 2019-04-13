# Edit Interactively (ei)
A way to get instant feedback while programming.

Everytime you save the file you're editing, its contents get executed.

![](https://media.giphy.com/media/gFECBcXYhudnkLctdH/source.gif)

## Installation
1. Install dependencies (tmux and when-changed): `sudo apt install tmux && sudo apt install python-pip && pip install https://github.com/joh/when-changed/archive/master.zip`.
2. Clone this repo: `git clone git@github.com:JavierGelatti/ei.git`.
3. Link the executable from your local `bin` folder: `ln ei/ei.sh ~/.local/bin/ei`.
4. Use it: `ei <filename>`.
