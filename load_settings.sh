# This script will allow the user to load all the settings from one Mac to another

# Load the settings

file_path=~/settings

########################################
#         Oh My Zsh Settings           #
########################################

# Load the .zshrc file
cp $file_path/.zshrc ~/.zshrc

# Load the .oh-my-zsh directory
cp -r $file_path/.oh-my-zsh ~/.oh-my-zsh

########################################
#         Homebrew Settings            #
########################################

# Load the Homebrew settings
brew install $(cat $file_path/brew_list.txt)
brew cask install $(cat $file_path/brew_cask_list.txt)

# Load the Homebrew Cask settings
brew install --cask $(cat $file_path/brew_cask_list.txt)

########################################
#         Git Settings                 #
########################################

# Load the Git settings
cp $file_path/.gitconfig ~/.gitconfig

# Load password settings
cp $file_path/.git-credentials ~/.git-credentials

########################################
#         VS Code Settings             #
########################################

# Load the VS Code settings
cp $file_path/settings.json ~/Library/Application\ Support/Code/User/settings.json
cp $file_path/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
cp -r $file_path/snippets ~/Library/Application\ Support/Code/User/snippets