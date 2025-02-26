# This script will allow the user to load all the settings from one Mac to another

# Load the settings

file_path=./settings

########################################
# Install for brand new Macs           #
########################################

# Install function, parameters: $1 = package name, $2 = package installation command, $3 = package installation update command
install() {
    if [ -z $(which $1) ]; then
        echo "Installing $1..."
        $2
    else
        echo "$1 is already installed. Updating $1..."
        $3
    fi
}



########################################
#         Homebrew Installation        #
########################################

# Install Homebrew
install "brew" "/bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" "brew update"

# Install Homebrew Cask
install "brew-cask" "brew tap homebrew/cask" "brew tap homebrew/cask"

########################################
#         Package Installation          #
########################################

# Install Git
install "git" "brew install git" "brew upgrade git"

# Install MacTeX
install "mactex" "brew install --cask mactex" "brew upgrade --cask mactex"

# Install Conda
install "conda" "brew install --cask miniconda" "brew upgrade --cask miniconda"


# Install Oh My Zsh
install "oh-my-zsh" "sh -c $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "sh -c $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/upgrade.sh)"

# Install VS Code
install "code" "brew install --cask visual-studio-code" "brew upgrade --cask visual-studio-code"


#########################################
#         Application Installation      #
#########################################

# Anki
install "anki" "brew install --cask anki" "brew upgrade --cask anki"

# ChatGPT
install "chatgpt" "brew install --cask chatgpt" "brew upgrade --cask chatgpt"

# VS Code
# Install VS Code
install "code" "brew install --cask visual-studio-code" "brew upgrade --cask visual-studio-code"
# Set code command
install "code" "ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code" "ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code"





########################################
#         Oh My Zsh Settings           #
########################################

# Load the .zshrc file
cp $file_path/.zshrc ~/.zshrc
cp $file_path/mb.txt ~/mb.txt

# Load the .oh-my-zsh directory
cp -r $file_path/.oh-my-zsh ~/.oh-my-zsh

########################################
#         Homebrew Settings            #
########################################

# Load the Homebrew settings
brew install $(cat $file_path/brew_list.txt)

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