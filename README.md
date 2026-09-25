# dotfiles

macOS configuration managed with GNU Stow.

## Install

### 1. Prerequisites

- macOS
- Xcode command line tools - `xcode-select --install`
- [Homebrew](https://brew.sh)

```zsh
git clone https://github.com/rk1/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Homebrew packages

```zsh
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

### 4. Additional tools

Install additional tools via mise:

```zsh
mise install
```

### 5. Manual setup

Homebrew and Stow don't cover everything.

**tpm** is a tmux plugin manager. Clone it and then install the plugins with `prefix + I` inside tmux:

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

**Operator Mono** is a commercial font that has to be installed manually.
