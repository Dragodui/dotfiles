# dotfiles

My Linux desktop configs: **CachyOS + niri (Wayland) + Dux Shell (DMS)**.

The shell is [Dux Modular Shell](https://github.com/duxlabs-dev/dux-shell) (`dms`). It provides the bar, dock, launcher, notifications, control center, lock screen and wallpaper. Noctalia is no longer used.

## Contents

| Directory   | Target                        | What it is                                           |
| ----------- | ----------------------------- | ---------------------------------------------------- |
| `niri/`     | `~/.config/niri/`             | niri compositor: keybinds, layout, rules, autostart |
| `dms/`      | `~/.config/dms/`              | Dux Shell settings, plugin settings, plugin lockfile |
| `fish/`     | `~/.config/fish/`             | fish shell config and universal variables            |
| `alacritty/`| `~/.config/alacritty/`        | terminal, colors follow the DMS theme                |
| `vscode/`   | `~/.config/Code/User/`        | VS Code settings and exported profile                |

`dms/session.json` holds only the dock pins. Copy it to `~/.local/state/dms/session.json`.

## Install

```bash
sudo pacman -S niri dux-shell quickshell matugen alacritty fish
git clone https://github.com/Dragodui/dotfiles ~/dotfiles
cd ~/dotfiles

cp -r niri ~/.config/
mkdir -p ~/.config/dms ~/.local/state/dms
cp dms/settings.json dms/plugin_settings.json dms/plugins.lock.json ~/.config/dms/
cp dms/session.json ~/.local/state/dms/session.json
cp -r fish alacritty ~/.config/

# Install the same plugins at the pinned commits
dms plugins restore ~/.config/dms/plugins.lock.json
```

Then log in to niri again. `dms run` starts from `niri/cfg/autostart.kdl`.

> `dux-shell` needs upstream `quickshell`. The `noctalia-qs` fork does not work with it (`Unrecognized pragma "RenderControl"`).

## Keybinds

| Keys            | Action                                  |
| --------------- | --------------------------------------- |
| `Mod+D`         | App launcher (Spotlight)                |
| `Mod+A`         | Control center                          |
| `Mod+N`         | Notifications                           |
| `Mod+V`         | Clipboard history                       |
| `Mod+Comma`     | DMS settings                            |
| `Mod+Shift+S`   | Region screenshot + editor (Quick Capture plugin) |
| `Mod+Alt+L`     | Lock screen                             |
| `Mod+Shift+Q`   | Power menu                              |
| `Mod+Return`    | Alacritty                               |
| `Mod+B` / `Mod+E` | Firefox / Nautilus                    |
| `Mod+Space`     | Switch keyboard layout                  |
| `Mod+O`         | niri overview                           |

The full list is in `niri/cfg/keybinds.kdl`.

## Plugins

Pinned in `dms/plugins.lock.json`: Quick Capture, Phone Connect (KDE Connect), Bongo Cat, Pomodoro timer, Notepad, desktop weather, media player, fullscreen power menu, DankTranslate.

Phone Connect needs `kdeconnect` and open ports `1714-1764` (TCP and UDP). `kdeconnectd` starts from `niri/cfg/autostart.kdl`.

## Notes

- `fish/config.fish` sets `QT_QPA_PLATFORM xcb` for some apps. If you start `dms run` from a terminal, prefix it with `QT_QPA_PLATFORM=wayland`, or the bar does not show.
- `Mod+Space` calls `~/.local/bin/xkb-smart-switch.sh`, a personal script that is not part of this repo.
