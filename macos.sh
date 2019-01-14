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

print_step "Generate entropy for FileVault and randomness. Keep typing random things and press Control-D in a new line to exit."
print_command "cat > /dev/random"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && cat > /dev/random || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Changing computer name."
# Generate new computer name 
RANDOM_HEX=$(hexdump -n 4 -e '4/4 "%08X" 1 "\n"' /dev/urandom)
COMPUTER_NAME="Unknown${RANDOM_HEX}"

print_command "sudo scutil --set ComputerName ${COMPUTER_NAME}"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo scutil --set ComputerName $COMPUTER_NAME || echo "EXECUTE_COMMANDS is set to false."
end_command_output
print_command "sudo scutil --set LocalHostName ${COMPUTER_NAME}"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo scutil --set LocalHostName $COMPUTER_NAME || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Enable FileVault."
print_command "sudo fdesetup enable"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo fdesetup enable || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Secure FileVault keys when sleeping."
print_command "sudo sh -c 'pmset -a destroyfvkeyonstandby 1; pmset -a hibernatemode 25; pmset -a powernap 0; pmset -a standby 0; pmset -a standbydelay 0; pmset -a autopoweroff 0'"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo sh -c 'pmset -a destroyfvkeyonstandby 1; pmset -a hibernatemode 25; pmset -a powernap 0; pmset -a standby 0; pmset -a standbydelay 0; pmset -a autopoweroff 0' || echo "EXECUTE_COMMANDS is set to false."
end_command_output

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

print_step "Don't allow signed built-in applications to run automatically."
print_command "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Don't allow signed downloaded applications to run automatically."
print_command "sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Disable captive portal."
print_command "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_header "SETUP ENVIRONMENT"

print_step "Install XCode command line utilities."
print_command "xcode-select --install"
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && xcode-select --install || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_step "Install Homebrew."
print_command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
start_command_output
[ "$EXECUTE_COMMANDS" = true ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || echo "EXECUTE_COMMANDS is set to false."
end_command_output

print_footer "SETUP FINISHED"
