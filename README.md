# dotfiles

macOS configuration managed with GNU Stow.

## Install

### 1. Prerequisites

- macOS
- Xcode command line tools — `xcode-select --install`
- [Homebrew](https://brew.sh)

```zsh
git clone https://github.com/rk1/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Homebrew packages

```zsh
brew bundle check --verbose
brew bundle --no-upgrade
```

### 3. Stow the configs

```zsh
stow */
```

Or install individual configurations:
```zsh
stow nvim    # Only install Neovim config
stow zsh     # Only install Zsh config
```
