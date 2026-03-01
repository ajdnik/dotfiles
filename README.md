# dotfiles

Repository containing configuration files to set up a MacOS system for my personal usage.

# git

```
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
```

# gpg

```
gpg --batch --gen-key ./gpg/keygen
gpg --list-secret-keys --with-colons --keyid-format LONG | awk -F: '/^sec:/ { print $5 }' | gpg --armor --export --
```

# homebrew

```
brew bundle --file=~/.brewfile
```
