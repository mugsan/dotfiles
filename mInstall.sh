#### Variables

dir=~/dotfiles
olddir=~/dotfiles_old
if [[ $OSTYPE == 'darwin'* ]]; then
    files="nvimrc vimrc bash_aliases jshintrc tmux.conf"
elif [[ $OSTYPE == 'linux-gnu' ]]; then
    files="nvimrc xinitrc Xresources vimrc bash_aliases tmux.conf jshintrc i3 i3status.conf"
fi

#### Backup old dotfiles

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

#### 

echo "Changing to the $dir directory"
cd $dir
echo "...done"

#### 

for file in $files; do
    echo "Moving any existing dotfiles from ~to $olddir"
    mv ~/.$file ~/dotfiles_old/ 
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

