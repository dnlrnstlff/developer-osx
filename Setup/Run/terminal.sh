separator
echo 'Which login shell do you use?'
echo ''
echo '1 Bash(default)'
echo '2 Fish'
echo ''

read -r -p "number of the chosen shell [1/2] " response
response=${response}
if [[ $response == '2' ]]
then
  bi fish true
  echo "Fish installed"

  cp $THISPATH/Assets/Bash/config.fish ~/.config/fish/config.fish
  echo "config.fish done"

  small_separator
  cp $THISPATH/Assets/Bash/.gitconfig ~/.gitconfig
  echo ".gitconfig done"

  small_separator
  cp $THISPATH/Assets/Fonts/* ~/Library/Fonts/
  echo "Fonts done"

  small_separator
  echo "Set fish as default"
  chsh -s /usr/local/bin/fish

  small_separator
  echo 'Done!'
  echo 'restart your terminal'
else
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
  echo 'restart your terminal'
fi
