# dotfiles
Configuration files for my OS environment.

## MacOS Setup

1. Make sure you have [iTerm2](https://www.iterm2.com/) installed on your device.
2. Bootstrap Git environment running: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ajdnik/dotfiles/master/macos-bootstrap.sh)"`
3. Install the SSH key printed out by the previous command into [GitHub](https://github.com/settings/keys).
4. Clone the repository: `git clone git@github.com:ajdnik/dotfiles.git`
5. Run the setup command: `./macos.sh`
6. Install the GPG key printed out by the previous command into [GitHub](https://github.com/settings/keys).
