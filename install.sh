ln -sv ~/dotfiles/.inputrc ~
ln -sv ~/dotfiles/.gitconfig ~
ln -sv ~/dotfiles/.bash_profile ~
ln -sv ~/dotfiles/.vimrc ~
ln -sv ~/dotfiles/.tern-config ~
ln -sv ~/dotfiles/.ideavimrc ~
mkdir ~/.vim
mkdir ~/.vim/.undo
rm -rf ~/.vim/UltiSnips
cp -rf UltiSnips ~/.vim/UltiSnips
