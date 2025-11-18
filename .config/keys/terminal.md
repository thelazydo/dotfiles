# Terminal Keyboard Shortcut Cheatsheet

This cheatsheet covers essential terminal (TTY) keyboard shortcuts commonly supported across Unix-like systems (Linux, macOS, etc.).

---

## Navigation

| Shortcut    | Action                               |
| ----------- | ------------------------------------ |
| `Ctrl + A`  | Move cursor to the beginning of line |
| `Ctrl + E`  | Move cursor to the end of line       |
| `Ctrl + B`  | Move cursor back one character       |
| `Ctrl + F`  | Move cursor forward one character    |
| `Alt + B`   | Move cursor back one word            |
| `Alt + F`   | Move cursor forward one word         |
| `Ctrl + XX` | Toggle between cursor and line start |

---

## Editing

| Shortcut   | Action                                     |
| ---------- | ------------------------------------------ |
| `Ctrl + U` | Cut (delete) from cursor to start of line  |
| `Ctrl + K` | Cut (delete) from cursor to end of line    |
| `Ctrl + W` | Cut the word before the cursor             |
| `Alt + D`  | Cut the word after the cursor              |
| `Ctrl + Y` | Paste the last cut text                    |
| `Ctrl + D` | Delete character under cursor              |
| `Ctrl + H` | Delete character before cursor (Backspace) |
| `Ctrl + _` | Undo (may not work in all terminals)       |

---

## Process Control

| Shortcut   | Action                               |
| ---------- | ------------------------------------ |
| `Ctrl + C` | Kill the current process             |
| `Ctrl + Z` | Suspend the current process          |
| `Ctrl + \` | Quit the current process (core dump) |
| `Ctrl + D` | Send EOF (End Of File) / log out     |

---

## Search and History

| Shortcut   | Action                                                                             |
| ---------- | ---------------------------------------------------------------------------------- |
| `Ctrl + R` | Reverse search in command history                                                  |
| `Ctrl + S` | Forward search in command history (can freeze terminal if flow control is enabled) |
| `Ctrl + G` | Cancel search                                                                      |
| `Ctrl + P` | Previous command (Up)                                                              |
| `Ctrl + N` | Next command (Down)                                                                |
| `Ctrl + O` | Execute found command (from search)                                                |

---

## Screen Control

| Shortcut   | Action                                          |
| ---------- | ----------------------------------------------- |
| `Ctrl + L` | Clear terminal screen (same as `clear` command) |
| `Ctrl + S` | Stop terminal output (can freeze terminal)      |
| `Ctrl + Q` | Resume terminal output                          |
| `Ctrl + M` | Same as Return/Enter                            |

---

## Miscellaneous

| Shortcut   | Action                               |
| ---------- | ------------------------------------ |
| `Tab`      | Autocomplete                         |
| `Ctrl + G` | Bell / Cancel operation              |
| `Ctrl + T` | Transpose characters (swap)          |
| `Alt + T`  | Transpose words                      |
| `Alt + U`  | Uppercase from cursor to end of word |
| `Alt + L`  | Lowercase from cursor to end of word |
| `Alt + C`  | Capitalize word                      |

---

"^@" set-mark-command
"^A" beginning-of-line
"^B" backward-char
"^D" delete-char-or-list
"^E" end-of-line
"^F" forward-char
"^G" send-break
"^H" backward-delete-char
"^I" expand-or-complete
"^J" accept-line
"^K" kill-line
"^L" clear-screen
"^M" accept-line
"^N" down-line-or-search
"^O" accept-line-and-down-history
"^P" up-line-or-search
"^Q" push-line
"^R" history-incremental-search-backward
"^S" history-incremental-search-forward
"^T" transpose-chars
"^U" kill-whole-line
"^V" quoted-insert
"^W" backward-kill-word
"^X^B" vi-match-bracket
"^X^E" edit-command-line
"^X^F" vi-find-next-char
"^X^J" vi-join
"^X^K" kill-buffer
"^X^N" infer-next-history
"^X^O" overwrite-mode
"^X^R" _read_comp
"^X^U" undo
"^X^V" vi-cmd-mode
"^X^X" exchange-point-and-mark
"^X\*" expand-word
"^X=" what-cursor-position
"^X?" \_complete_debug
"^XC" \_correct_filename
"^XG" list-expand
"^Xa" \_expand_alias
"^Xc" \_correct_word
"^Xd" \_list_expansions
"^Xe" \_expand_word
"^Xg" list-expand
"^Xh" \_complete_help
"^Xm" \_most_recent_file
"^Xn" \_next_tags
"^Xr" history-incremental-search-backward
"^Xs" history-incremental-search-forward
"^Xt" \_complete_tag
"^Xu" undo
"^X~" \_bash_list-choices
"^Y" yank
"^[^D" list-choices
"^[^G" send-break
"^[^H" backward-kill-word
"^[^I" self-insert-unmeta
"^[^J" self-insert-unmeta
"^[^L" clear-screen
"^[^M" self-insert-unmeta
"^[^_" copy-prev-word
"^[ " expand-history
"^[!" expand-history
"^[\"" quote-region
"^[\$" spell-word
"^['" quote-line
"^[," _history-complete-newer
"^[-" neg-argument
"^[." insert-last-word
"^[/" \_history-complete-older
"^[0" digit-argument
"^[1" digit-argument
"^[2" digit-argument
"^[3" digit-argument
"^[4" digit-argument
"^[5" digit-argument
"^[6" digit-argument
"^[7" digit-argument
"^[8" digit-argument
"^[9" digit-argument
"^[<" beginning-of-buffer-or-history
"^[>" end-of-buffer-or-history
"^[?" which-command
"^[A" accept-and-hold
"^[B" backward-word
"^[C" capitalize-word
"^[D" kill-word
"^[F" forward-word
"^[G" get-line
"^[H" run-help
"^[L" down-case-word
"^[N" history-search-forward
"^[OA" up-line-or-beginning-search
"^[OB" down-line-or-beginning-search
"^[OC" forward-char
"^[OD" backward-char
"^[OF" end-of-line
"^[OH" beginning-of-line
"^[P" history-search-backward
"^[Q" push-line
"^[S" spell-word
"^[T" transpose-words
"^[U" up-case-word
"^[W" copy-region-as-kill
"^[[1;5C" forward-word
"^[[1;5D" backward-word
"^[[200~" bracketed-paste
"^[[3;5~" kill-word
"^[[3~" delete-char
"^[[5~" up-line-or-history
"^[[6~" down-line-or-history
"^[[A" up-line-or-beginning-search
"^[[B" down-line-or-beginning-search
"^[[C" forward-char
"^[[D" backward-char
"^[[Z" reverse-menu-complete
"^[_" insert-last-word
"^[a" accept-and-hold
"^[b" backward-word
"^[c" capitalize-word
"^[d" kill-word
"^[f" forward-word
"^[g" get-line
"^[h" run-help
"^[l" "ls^J"
"^[m" copy-prev-shell-word
"^[n" history-search-forward
"^[p" history-search-backward
"^[q" push-line
"^[s" spell-word
"^[t" transpose-words
"^[u" up-case-word
"^[w" kill-region
"^[x" execute-named-cmd
"^[y" yank-pop
"^[z" execute-last-named-cmd
"^[|" vi-goto-column
"^[~" _bash_complete-word
"^[^?" backward-kill-word
"^_" undo
" " magic-space
"!"-"~" self-insert
"^?" backward-delete-char
"\M-^@"-"\M-^?" self-insert

> **Note:**
>
> - `Alt` is sometimes `Esc` on some terminals.
> - Some shortcuts may behave differently or be unavailable depending on the terminal emulator or shell configuration.
