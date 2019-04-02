#!/usr/bin/env bash

#
# macos.sh
# Install and configure commonly used apps in macOS.
#

# Include output library
source ./output.sh

# If set to false no command will be executed. Acts like a dry run.
EXECUTE_COMMANDS=true

#
# SYSTEM HARDENING
#

print_header "HARDENING OPERATING SYSTEM"

print_step "Enable firewall."
print_command "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Enable firewall logging."
print_command "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Enable firewall stealth mode."
print_command "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Disable captive portal."
print_command "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_header "SETUP ENVIRONMENT"

print_step "Install Homebrew."
print_command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Always show hidden files in Finder."
print_command "defaults write com.apple.finder AppleShowAllFiles YES" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && defaults write com.apple.finder AppleShowAllFiles YES || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install ZSH."
print_command "brew install zsh" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install zsh || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh."
print_command 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh almostontop plugin."
print_command "cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/Valiev/almostontop.git" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/Valiev/almostontop.git || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh zsh-notify plugin."
print_command "cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/marzocchi/zsh-notify.git notify" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/marzocchi/zsh-notify.git notify || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install terminal-notifier for zsh-notify plugin."
print_command "brew install terminal-notifier" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install terminal-notifier || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Link assets for zsh-notify."
print_command "ln -s $(pwd)/zsh/zsh-notify/*.png ~/.oh-my-zsh/custom/plugins/notify/" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && ln -s $(pwd)/zsh/zsh-notify/*.png ~/.oh-my-zsh/custom/plugins/notify/ || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh zsh-syntax-highlighting plugin."
print_command "cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh zsh-autosuggestions plugin."
print_command "cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install powerlevel9k."
print_command "brew tap sambadevi/powerlevel9k && brew install powerlevel9k" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew tap sambadevi/powerlevel9k && brew install powerlevel9k || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install nerd fonts."
print_command "brew tap caskroom/fonts && brew cask install font-hack-nerd-font" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew tap caskroom/fonts && brew cask install font-hack-nerd-font || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Disable terminal login prompt."
print_command "touch ~/.hushlogin" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && touch ~/.hushlogin || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Link zshrc file."
print_command "ln -s $(pwd)/zsh/zshrc ~/.zshrc" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && ln -s $(pwd)/zsh/zshrc ~/.zshrc || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Source zshrc file."
print_command "source ~/.zshrc" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && source ~/.zshrc || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Setup iTerm2 custom preferences directory."
print_command 'defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(pwd)/iterm"' 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(pwd)/iterm" || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Enable iTerm2 custom preferences directory."
print_command "defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Python 2."
print_command "brew install python@2" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install python@2 || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Python 3."
print_command "brew install python" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install python || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install neovim."
print_command "brew istall neovim" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install neovim || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Vundle."
print_command "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Python NVIM library."
print_command "pip3 install pynvim" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && pip3 install pynvim || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Link init.vim file."
print_command "mkdir -p ~/.config/nvim/ && ln -s $(pwd)/vim/init.vim ~/.config/nvim/init.vim" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && mkdir -p ~/.config/nvim/ && ln -s $(pwd)/vim/init.vim ~/.config/nvim/init.vim || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install neovim plugins."
print_command "nvim +PluginInstall +qall" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && nvim +PluginInstall +qall || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Update neovim remote plugins."
print_command "nvim +UpdateRemotePlugins +qall" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && nvim +UpdateRemotePlugins +qall || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install neovim go binaries."
print_command "nvim +GoInstallBinaries +qall" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && nvim +GoInstallBinaries +qall || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install gpg."
print_command "brew install gpg" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install gpg || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Setup gpg keys."
print_command "gpg --batch --gen-key ./gpg/keygen" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && gpg --batch --gen-key ./gpg/keygen || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Print gpg keys."
print_command "gpg --list-secret-keys --with-colons --keyid-format LONG | awk -F: '/^sec:/ { print $5 }' | gpg --armor --export --" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && gpg --list-secret-keys --with-colons --keyid-format LONG | awk -F: '/^sec:/ { print $5 }' | gpg --armor --export -- || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Remove old gitconfig file."
print_command "rm ~/.gitconfig" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && rm ~/.gitconfig || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Link gitconfig file."
print_command "ln -s $(pwd)/git/gitconfig ~/.gitconfig" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && ln -s $(pwd)/git/gitconfig ~/.gitconfig || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install go."
print_command "brew install go" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install go || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Create GOPATH directories."
print_command "mkdir -p ~/Documents/Go/{bin,src,pkg}" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && mkdir -p ~/Documents/Go/{bin,src,pkg} || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Delve."
print_command "go get -u github.com/go-delve/delve/cmd/dlv" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && go get -u github.com/go-delve/delve/cmd/dlv || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Gocode."
print_command "go get -u github.com/mdempsky/gocode" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && go get -u github.com/mdempsky/gocode || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Compile deoplete-go dependencies."
print_command "cd ~/.vim/bundle/deoplete-go && make" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd ~/.vim/bundle/deoplete-go && make || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_footer "SETUP FINISHED"
