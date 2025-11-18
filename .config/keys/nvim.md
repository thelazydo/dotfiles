
# Neovim Keybindings (Comprehensive)

This document provides a detailed and comprehensive overview of default keybindings in Neovim, separated by modes and functionality.

---

# Normal Mode Keybindings

## Basic Motions

| Keybinding | Action                               |
| ---------- | ------------------------------------ |
| `h`        | Move cursor left                     |
| `l`        | Move cursor right                    |
| `j`        | Move cursor down                     |
| `k`        | Move cursor up                       |
| `0`        | Move to beginning of the line        |
| `^`        | Move to first non-blank character    |
| `$`        | Move to end of the line              |
| `w`        | Jump to start of next word           |
| `W`        | Jump to start of next WORD           |
| `e`        | Jump to end of word                  |
| `E`        | Jump to end of WORD                  |
| `b`        | Jump to start of previous word       |
| `B`        | Jump to start of previous WORD       |
| `gg`       | Go to beginning of file              |
| `G`        | Go to end of file                    |
| `H`        | Go to top of screen                  |
| `M`        | Go to middle of screen               |
| `L`        | Go to bottom of screen               |
| `Ctrl + d` | Scroll half-screen down              |
| `Ctrl + u` | Scroll half-screen up                |
| `Ctrl + f` | Scroll full-screen forward           |
| `Ctrl + b` | Scroll full-screen backward          |
| `%`        | Jump to matching bracket/parenthesis |

## Editing Commands

| Keybinding | Action                            |
| ---------- | --------------------------------- |
| `x`        | Delete character under cursor     |
| `X`        | Delete character before cursor    |
| `dd`       | Delete (cut) current line         |
| `D`        | Delete from cursor to end of line |
| `yy`       | Yank (copy) current line          |
| `Y`        | Yank from cursor to end of line   |
| `p`        | Paste after cursor                |
| `P`        | Paste before cursor               |
| `u`        | Undo                              |
| `Ctrl + r` | Redo                              |
| `.`        | Repeat last command               |
| `>>`       | Indent line                       |
| `<<`       | Unindent line                     |
| `J`        | Join lines                        |

## Search Commands

| Keybinding | Action                            |
| ---------- | --------------------------------- |
| `/pattern` | Search forward                    |
| `?pattern` | Search backward                   |
| `n`        | Repeat last search forward        |
| `N`        | Repeat last search backward       |
| `*`        | Search word under cursor forward  |
| `#`        | Search word under cursor backward |

## Window Management

| Keybinding   | Action                              |                               |
| ------------ | ----------------------------------- | ----------------------------- |
| `Ctrl + w s` | Split window horizontally           |                               |
| `Ctrl + w v` | Split window vertically             |                               |
| `Ctrl + w q` | Close window                        |                               |
| `Ctrl + w h` | Move to window on the left          |                               |
| `Ctrl + w l` | Move to window on the right         |                               |
| `Ctrl + w k` | Move to window above                |                               |
| `Ctrl + w j` | Move to window below                |                               |
| `Ctrl + w =` | Make windows equal height and width |                               |
| `Ctrl + w _` | Maximize current window height      |                               |
| \`Ctrl + w   | \`                                  | Maximize current window width |

## Buffer and Tab Management

| Keybinding  | Action                |
| ----------- | --------------------- |
| `:bn`       | Go to next buffer     |
| `:bp`       | Go to previous buffer |
| `:bd`       | Delete buffer         |
| `:tabnew`   | Open new tab          |
| `:tabn`     | Go to next tab        |
| `:tabp`     | Go to previous tab    |
| `:tabclose` | Close current tab     |

## Marks and Jumps

| Keybinding    | Action                           |
| ------------- | -------------------------------- |
| `m{a-z}`      | Set mark                         |
| `'{a-z}`      | Jump to beginning of marked line |
| `` `{a-z}` `` | Jump to exact marked position    |
| `''`          | Jump to previous cursor position |
| ` ` \`\`      | Jump to previous file            |

## Macros

| Keybinding | Action                     |
| ---------- | -------------------------- |
| `q{a-z}`   | Start recording macro      |
| `@{a-z}`   | Execute macro              |
| `@@`       | Repeat last executed macro |

## Folds

| Keybinding | Action          |
| ---------- | --------------- |
| `za`       | Toggle fold     |
| `zo`       | Open fold       |
| `zc`       | Close fold      |
| `zR`       | Open all folds  |
| `zM`       | Close all folds |

## File Commands

| Keybinding    | Action              |
| ------------- | ------------------- |
| `:w`          | Save file           |
| `:q`          | Quit                |
| `:wq`         | Save and quit       |
| `:q!`         | Quit without saving |
| `:e filename` | Open file           |

---

# Insert Mode Keybindings

| Keybinding | Action                                    |
| ---------- | ----------------------------------------- |
| `i`        | Enter insert mode before cursor           |
| `I`        | Enter insert mode at beginning of line    |
| `a`        | Enter insert mode after cursor            |
| `A`        | Enter insert mode at end of line          |
| `o`        | Open new line below and enter insert mode |
| `O`        | Open new line above and enter insert mode |
| `Esc`      | Exit insert mode                          |
| `Ctrl + h` | Delete character before cursor            |
| `Ctrl + w` | Delete word before cursor                 |
| `Ctrl + u` | Delete to beginning of insert             |
| `Ctrl + t` | Indent in insert mode                     |
| `Ctrl + d` | Unindent in insert mode                   |

---

# Visual Mode Keybindings

| Keybinding | Action                         |
| ---------- | ------------------------------ |
| `v`        | Start visual mode              |
| `V`        | Start visual line mode         |
| `Ctrl + v` | Start visual block mode        |
| `y`        | Yank selected text             |
| `d`        | Delete selected text           |
| `x`        | Delete selected character(s)   |
| `>`        | Indent selection               |
| `<`        | Unindent selection             |
| `~`        | Toggle case                    |
| `o`        | Jump to other end of selection |
| `gv`       | Reselect last visual selection |
| `Esc`      | Exit visual mode               |

---

# Command-Line Mode Keybindings

| Keybinding     | Action                                  |
| -------------- | --------------------------------------- |
| `:`            | Enter command-line mode                 |
| `Ctrl + c`     | Cancel command                          |
| `Esc`          | Exit command-line mode                  |
| `Up Arrow`     | Previous command                        |
| `Down Arrow`   | Next command                            |
| `Ctrl + r + "` | Insert contents of the unnamed register |

---

# Terminal Mode Keybindings

| Keybinding                 | Action                              |
| -------------------------- | ----------------------------------- |
| `Ctrl + \` then `Ctrl + n` | Exit terminal mode                  |
| `Ctrl + w N`               | Navigate window from terminal       |
| `Ctrl + w h/j/k/l`         | Move to split windows from terminal |

---
