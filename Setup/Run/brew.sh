separator
echo "install homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

small_separator
echo "update homebrew..."
brew update

small_separator
echo "upgrade homebrew..."
brew upgrade

bi caskroom/cask/brew-cask true
bi node true
bi rbenv true
bi git true
bi wget true
bi bash-completion true
bi mongodb
bi redis
bi mysql
bi postgresql
bi sbt 
bi the_silver_searcher
bi ruby-build