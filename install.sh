USERNAME="verymintyfresh"
USERMAIL="mint@mintyfresh.love"
REPOS=("holbertonschool-shell")
NAME="Mint Raines"

# Step 1!
# Collect the bash RC
echo "Hello! Getting .bashrc..."
if [[ -f ~/.bashrc ]]; then
	mv ~/.bashrc ~/.bashrc.old;
fi
wget -qO ~/.bashrc "https://raw.githubusercontent.com/verymintyfresh/holberton-sandbox-init/refs/heads/main/.bashrc"

# Step 2!
# Set up aliases.
echo "Getting aliases file..."
if [[ -f ~/bash_aliases ]]; then
    mv ~/bash_aliases ~/bash_aliases.old;
fi
wget -qO ~/bash_aliases "https://raw.githubusercontent.com/verymintyfresh/holberton-sandbox-init/refs/heads/main/bash_aliases"

# Step 3!
# Set up git.
git config --global user.name "$NAME";
git config --global user.email "$USERMAIL";
git config --global credential.helper "cache --timeout=7200";

# Step 4!
# Clone work repos.
for r in "${REPOS[@]}"; do
    if [ ! -d "$HOME/$r" ]; then
        git clone "https://github.com/$USERNAME/$r.git";
    fi
done

# Step 5!
# Remove Holberton default stuff.


# Step 6!
# Reload .bashrc
. "$HOME/.bashrc"
