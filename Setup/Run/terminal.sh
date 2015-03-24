separator
cp $THISPATH/Assets/Bash/.bashrc ~/.bashrc
cp $THISPATH/Assets/Bash/.bashrc ~/.profile
echo ".bashrc and .profile done"

small_separator
cp $THISPATH/Assets/Bash/.gitconfig ~/.gitconfig
echo ".gitconfig done"

small_separator
cp $THISPATH/Assets/Bash/.jump ~/.jump
echo ".jump done"

small_separator
cp $THISPATH/Assets/Fonts/* ~/Library/Fonts/
echo "Fonts done"

small_separator
echo "Set bash as default"
chsh -s /bin/bash

small_separator
echo 'Done!'
echo 'run `source ~/.profile` or restart your terminal'