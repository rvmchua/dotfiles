# dotfiles

Personal configuration files for my Linux (Debian) workstation.

## Contents

| Path | Description |
|------|-------------|
| `.zshrc` | Zsh config — Oh My Zsh (agnoster theme), PATH, nvm, bun, Go, PHP (Herd Lite) |
| `.zsh_aliases` | Shell aliases |
| `i3/config` | i3 window manager config — keybindings, workspaces, colors, bar |
| `i3/volume_action.sh` | PulseAudio volume up/down/mute via `$mod+F9/F10/F11` |
| `i3/mpd_volume_ctrl.sh` | MPD volume control via numpad +/- |
| `i3/powermenu.sh` | Rofi power menu via `$mod+Shift+e` |
| `i3/toggle_mute.sh` | Toggle mic mute |
| `i3blocks/config` | i3blocks bar — CPU, memory, disk (/, /home, OtherFiles, Vault), wifi, volume, clock |
| `i3blocks/mpc_status.sh` | MPD now-playing block |
| `i3blocks/volume_status.sh` | PulseAudio volume block |
| `i3blocks/wifi_ssid.sh` | Connected SSID block |
| `i3blocks/wifi_speed.sh` | Live wifi download speed block |

## Setup

Symlink files to your home directory and config directories:

```sh
DOTFILES="$(pwd)"

# zsh
ln -sf "$DOTFILES/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/.zsh_aliases" ~/.zsh_aliases

# i3
ln -sf "$DOTFILES/i3/config"             ~/.config/i3/config
ln -sf "$DOTFILES/i3/mpd_volume_ctrl.sh" ~/.config/i3/mpd_volume_ctrl.sh
ln -sf "$DOTFILES/i3/powermenu.sh"       ~/.config/i3/powermenu.sh
ln -sf "$DOTFILES/i3/toggle_mute.sh"     ~/.config/i3/toggle_mute.sh
ln -sf "$DOTFILES/i3/volume_action.sh"   ~/.config/i3/volume_action.sh

# i3blocks
ln -sf "$DOTFILES/i3blocks/config"           ~/.config/i3blocks/config
ln -sf "$DOTFILES/i3blocks/mpc_status.sh"    ~/.config/i3blocks/mpc_status.sh
ln -sf "$DOTFILES/i3blocks/volume_status.sh" ~/.config/i3blocks/volume_status.sh
ln -sf "$DOTFILES/i3blocks/wifi_speed.sh"    ~/.config/i3blocks/wifi_speed.sh
ln -sf "$DOTFILES/i3blocks/wifi_ssid.sh"     ~/.config/i3blocks/wifi_ssid.sh
```

## Dependencies

- [Oh My Zsh](https://ohmyz.sh/)
- [nvm](https://github.com/nvm-sh/nvm)
- [bun](https://bun.sh/)
- [neovim](https://neovim.io/) — `vim` is aliased to `nvim`
- Go (`/usr/local/go`)
- PHP via [Herd Lite](https://herd.laravel.com/linux)
- [i3](https://i3wm.org/)
- [i3blocks](https://github.com/vivien/i3blocks)
- [rofi](https://github.com/davatorium/rofi)
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [MPD](https://www.musicpd.org/) + [MPC](https://www.musicpd.org/clients/mpc/)
- [flameshot](https://flameshot.org/) — `Print` key
- numlockx, lxpolkit, nitrogen, nm-applet
