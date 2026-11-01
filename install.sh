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
wget -qO ~/.bashrc "" # get raw blob link

# Step 2!
# Set up aliases.
echo "Getting aliases file..."
if [[ -f ~/bash_aliases ]]; then
    mv ~/bash_aliases ~/bash_aliases.old;
fi
wget -qO ~/bash_aliases "" # get raw blob link

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
