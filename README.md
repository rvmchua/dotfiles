# dotfiles

Personal configuration files for my Linux (Debian) workstation.

## Contents

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config — Oh My Zsh (agnoster theme), PATH, nvm, bun, Go, PHP (Herd Lite), aliases |

## Setup

Symlink files to your home directory:

```sh
ln -sf "$(pwd)/.zshrc" ~/.zshrc
```

## Dependencies

- [Oh My Zsh](https://ohmyz.sh/)
- [nvm](https://github.com/nvm-sh/nvm)
- [bun](https://bun.sh/)
- [neovim](https://neovim.io/) — `vim` is aliased to `nvim`
- Go (`/usr/local/go`)
- PHP via [Herd Lite](https://herd.laravel.com/linux)
