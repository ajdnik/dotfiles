#!/usr/bin/env bash

#
# macos.sh
# Install and configure commonly used apps in macOS.
#

# Include output library
source ./output.sh

# If set to false no command will be executed. Acts like a dry run.
EXECUTE_COMMANDS=false

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
print_command "cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/Valiev/almostontop.git" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/Valiev/almostontop.git || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh zsh-notify plugin."
print_command "cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/marzocchi/zsh-notify.git" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/marzocchi/zsh-notify.git || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install terminal-notifier for zsh-notify plugin."
print_command "brew install terminal-notifier" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && brew install terminal-notifier || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Copy assets for zsh-notify."
print_command "cp ./zsh-notify/*.png $HOME/.oh-my-zsh/custom/plugins/zsh-notify/" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cp ./zsh-notify/*.png $HOME/.oh-my-zsh/custom/plugins/zsh-notify/ || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh zsh-syntax-highlighting plugin."
print_command "cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Oh-My-Zsh zsh-autosuggestions plugin."
print_command "cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cd $HOME/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions || echo "EXECUTE_COMMANDS is set to false."
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
print_command "touch $HOME/.hushlogin" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && touch $HOME/.hushlogin || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Copy zshrc file."
print_command "cp ./zsh/zshrc $HOME/.zshrc" 
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cp ./zsh/zshrc $HOME/.zshrc || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_footer "SETUP FINISHED"
