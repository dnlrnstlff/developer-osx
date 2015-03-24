separator

read -r -p "Do you want to install heroku toolbelt? [y/N] " response
response=${response}
if [[ $response =~ ^(yes|y)$ ]]
then
  echo "install Heroku Toolbelt..."
  wget -qO- https://toolbelt.heroku.com/install.sh | sh
else
  echo "skipped Heroku Toolbelt"
fi