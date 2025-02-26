# This script will allow the user to save all the settings from one Mac to another

# Save the settings

file_path=./settings

########################################
#         Oh My Zsh Settings           #
########################################

# Save the .zshrc file
cp ~/.zshrc $file_path/.zshrc
cp ~/mb.txt $file_path/mb.txt

# Save the .oh-my-zsh directory
cp -r ~/.oh-my-zsh $file_path/.oh-my-zsh

########################################
#         Homebrew Settings            #
########################################

# Save the Homebrew settings
brew list > $file_path/brew_list.txt

# Save the Homebrew Cask settings
brew list --cask > $file_path/brew_cask_list.txt

########################################
#         Git Settings                 #
########################################

# Save the Git settings
cp ~/.gitconfig $file_path/.gitconfig

# Save password settings
cp ~/.git-credentials $file_path/.git-credentials

########################################
#         VS Code Settings             #
########################################

# Save the VS Code settings
cp ~/Library/Application\ Support/Code/User/settings.json $file_path/settings.json
cp ~/Library/Application\ Support/Code/User/keybindings.json $file_path/keybindings.json
cp ~/Library/Application\ Support/Code/User/snippets $file_path/snippets
