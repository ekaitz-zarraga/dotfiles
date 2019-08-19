# Create .config if it doesn't exist and set XDG vars if they are unset
mkdir -p $HOME/.config
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.config}

# Load bashrc to mantain only one file
if [ -f "$HOME/.bashrc" ]; then
   source "$HOME/.bashrc"
fi
