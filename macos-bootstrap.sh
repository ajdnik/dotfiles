#
# macos-bootstrap.sh
# Install and configure a Git environment for MacOS.
#

main() {
  printf "#\n"
  printf "# Bootstraping MacOS Git environment...\n"
  printf "#\n\n"
  printf ">> xcode-select --install\n\n"
  xcode-select --install
  printf "\n>> git config --global user.name Rok Ajdnik\n"
  git config --global user.name "Rok Ajdnik"
  printf "\n>> git config --global user.email r.ajdnik@gmail.com\n"
  git config --global user.email r.ajdnik@gmail.com
  printf "\n>> ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa\n\n"
  ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
  printf "\n>> cat ~/.ssh/id_rsa.pub"
  cat ~/.ssh/id_rsa.pub
  printf "\n#\n"
  printf "# Bootstraping complete.\n"
  printf "#\n"
}

main
