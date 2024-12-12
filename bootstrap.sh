#!/usr/bin/env bash

isPackageInstalled() {
  if [ -n "$(command -v $1)" ]; then
    return 0
  else
    return 1
  fi
}

installRequired() {
  if [ -f /etc/os-release ]; then
    source /etc/os-release

    if [ "$ID" == "debian" ] || [ "$ID" == "ubuntu" ]; then
      echo "Detected Debian/Ubuntu."
      package_manager="apt"
    elif [ "$ID" == "arch" ]; then
      echo "Detected Arch Linux."
      package_manager="pacman"
    else
      echo "Unsupported distribution. Cannot install packages."
      exit 1
    fi
  fi

  if ! isPackageInstalled zsh; then
    echo "Zsh is not installed. Installing..."
    if [ "$package_manager" == "apt" ]; then
      sudo apt update
      sudo apt install zsh -y
    elif [ "$package_manager" == "pacman" ]; then
        sudo pacman -Sy zsh --noconfirm
    fi
  fi

  if ! isPackageInstalled nvim; then
    echo "Neovim is not installed. Installing..."
    if [ "$package_manager" == "apt" ]; then
      sudo apt update
      sudo apt install fd-find ripgrep -y

      wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz --no-verbose

      tar -xzf nvim-linux64.tar.gz
      sudo cp -r nvim-linux64/* /usr
    elif [ "$package_manager" == "pacman" ]; then
      sudo pacman -Sy neovim ripgrep --noconfirm
    fi
  fi

  if ! isPackageInstalled tmux; then
    echo "Tmux is not installed. Installing..."
    if [ "$package_manager" == "apt" ]; then
      sudo apt update
      sudo apt install tmux -y
    elif [ "$package_manager" == "pacman" ]; then
      sudo pacman -Sy tmux --noconfirm
    fi
  fi

  # check for tmux tpm
  if ! [ -d  ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  if ! isPackageInstalled rsync; then
    echo "Rsync is not installed. Installing..."
    if [ "$package_manager" == "apt" ]; then
      sudo apt install rsync -y
    elif [ "$package_manager" == "pacman" ]; then
      sudo pacman -Sy rsync --noconfirm
    fi
  fi
}

copyToHome() {
  rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "nvim-linux64" \
    --exclude "nvim-linux64.tar.gz" \
    -avh --no-perms . ~;
}

installRequired
copyToHome

echo "Sync neovim lazy packages..."
nvim --headless "+Lazy! sync" +qa > /dev/null
echo "Synced neovim lazy."

sudo chsh -s "$(command -v zsh)" "$USER"
