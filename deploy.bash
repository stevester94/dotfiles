# Backup all existing config
mkdir backups
mv ~/.vim backups
mv ~/.vimrc  backups
mv ~/.bashrc backups
mv ~/.config/sublime-text-3  backups
mv ~/.config/terminator backups


ln -s $PWD/vim ~/.vim
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/bashrc ~/.bashrc
ln -s $PWD/sublime-text-3 ~/.config/sublime-text-3
ln -s $PWD/terminator ~/.config/terminator
