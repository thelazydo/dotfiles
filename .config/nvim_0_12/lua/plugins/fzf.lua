vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua", name = "fzf-lua" }
})

local fzf = require('fzf-lua')
fzf.setup({ "default" })


-- =====================================================================
-- 1. Core & Quick Access (The most used keys)
-- =====================================================================
-- Snacks/LazyVim maps the absolute most common actions to root leader keys
vim.keymap.set('n', '<leader><space>', fzf.files, { desc = 'Find Files (Root)' })
vim.keymap.set('n', '<leader>,', fzf.buffers, { desc = 'Switch Buffers' })
vim.keymap.set('n', '<leader>/', fzf.live_grep, { desc = 'Live Grep (Root)' })
vim.keymap.set('n', '<leader>:', fzf.command_history, { desc = 'Command History' })

-- =====================================================================
-- 2. Find (Prefixed with 'f') - Focusing on files and paths
-- =====================================================================
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = 'Recent Files' })
vim.keymap.set('n', '<leader>fc', function() fzf.files({ cwd = vim.fn.stdpath("config") }) end, { desc = 'Find Config Files' })

-- =====================================================================
-- 3. Search (Prefixed with 's') - Focusing on content and Neovim internals
-- =====================================================================
vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'Search Grep' })
vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = 'Search Word under cursor' })
vim.keymap.set('v', '<leader>sw', fzf.grep_visual, { desc = 'Search Visual selection' })
vim.keymap.set('n', '<leader>sb', fzf.lgrep_curbuf, { desc = 'Search (Grep) Current Buffer' })

-- Neovim Internals
vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = 'Search Keymaps' })
vim.keymap.set('n', '<leader>sm', fzf.marks, { desc = 'Search Marks' })
vim.keymap.set('n', '<leader>sq', fzf.quickfix, { desc = 'Search Quickfix List' })
vim.keymap.set('n', '<leader>sj', fzf.jumps, { desc = 'Search Jump List' })
vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = 'Resume Last Search' })

-- =====================================================================
-- 4. Git (Prefixed with 'g') - Version control integration
-- =====================================================================
vim.keymap.set('n', '<leader>gc', fzf.git_commits, { desc = 'Git Commits' })
vim.keymap.set('n', '<leader>gC', fzf.git_bcommits, { desc = 'Git Buffer Commits' })
vim.keymap.set('n', '<leader>gb', fzf.git_branches, { desc = 'Git Branches' })
vim.keymap.set('n', '<leader>gs', fzf.git_status, { desc = 'Git Status' })

-- =====================================================================
-- 5. LSP Integration - Code intelligence (Usually mapped directly to 'g')
-- =====================================================================
-- Note: These only work when an LSP is attached to the current buffer.
-- You might want to move these into your LSP 'on_attach' function later.
vim.keymap.set('n', 'gd', fzf.lsp_definitions, { desc = 'Goto Definition' })
vim.keymap.set('n', 'gr', fzf.lsp_references, { desc = 'Goto References' })
vim.keymap.set('n', 'gI', fzf.lsp_implementations, { desc = 'Goto Implementation' })
vim.keymap.set('n', 'gy', fzf.lsp_typedefs, { desc = 'Goto Type Definition' })

-- Workspace & Diagnostics
vim.keymap.set('n', '<leader>ss', fzf.lsp_document_symbols, { desc = 'Search Document Symbols' })
vim.keymap.set('n', '<leader>sS', fzf.lsp_live_workspace_symbols, { desc = 'Search Workspace Symbols' })
vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = 'Search Document Diagnostics' })
vim.keymap.set('n', '<leader>sD', fzf.diagnostics_workspace, { desc = 'Search Workspace Diagnostics' })

-- | Command          | List                              |
-- | ---------------- | --------------------------------- |
-- | `oldfiles`       | opened files history              |
-- | `history`        | opened buffers/files history      |
-- | `quickfix_stack` | quickfix stack                    |
-- | `loclist`        | location list                     |
-- | `loclist_stack`  | location stack                    |
-- | `lines`          | open buffers lines                |
-- | `blines`         | current buffer lines              |
-- | `treesitter`     | current buffer treesitter symbols |
-- | `tabs`           | open tabs                         |
-- | `args`           | argument list                     |
-- | `vcs_files`      | `jj`/`git` files or `find`/`fd`   |
--
--
--
-- SEARCH                                                        *fzf-lua-search*
--
-- | Command            | List                                       |
-- | ------------------ | ------------------------------------------ |
-- | `grep`             | search for a pattern with `grep` or `rg`   |
-- | `grep_last`        | run search again with the last pattern     |
-- | `grep_cWORD`       | search WORD under cursor                   |
-- | `grep_project`     | search all project lines (fzf.vim's `:Rg`) |
-- | `grep_curbuf`      | search current buffer lines                |
-- | `grep_quickfix`    | search the quickfix list                   |
-- | `grep_loclist`     | search the location list                   |
-- | `lgrep_quickfix`   | live grep the quickfix list                |
-- | `lgrep_loclist`    | live grep the location list                |
-- | `live_grep_resume` | live grep continue last search             |
-- | `live_grep_glob`   | live_grep with `rg --glob` support         |
-- | `live_grep_native` | performant version of `live_grep`          |
--
--
--
-- TAGS                                                            *fzf-lua-tags*
--
-- | Command            | List                          |
-- | ------------------ | ----------------------------- |
-- | `tags`             | search project tags           |
-- | `btags`            | search buffer tags            |
-- | `tags_grep`        | grep project tags             |
-- | `tags_grep_cword`  | `tags_grep` word under cursor |
-- | `tags_grep_cWORD`  | `tags_grep` WORD under cursor |
-- | `tags_grep_visual` | `tags_grep` visual selection  |
-- | `tags_live_grep`   | live grep project tags        |
--
--
--
-- GIT                                                              *fzf-lua-git*
--
-- | Command         | List                     |
-- | --------------- | ------------------------ |
-- | `git_files`     | `git ls-files`           |
-- | `git_diff`      | `git diff {ref}`         |
-- | `git_hunks`     | `git hunks {ref}`        |
-- | `git_reflog`    | `git reflog`             |
-- | `git_blame`     | git blame (buffer)       |
-- | `git_worktrees` | git worktrees            |
-- | `git_tags`      | git tags                 |
-- | `git_stash`     | git stash                |
--
--
--
-- JUJUTSU                                                      *fzf-lua-jujutsu*
--
-- | Command    | List                   |
-- | ---------- | ---------------------- |
-- | `jj_files` | `jj file list` tracked files |
--
--
--
-- LSP/DIAGNOSTICS                                      *fzf-lua-lsp/diagnostics*
--
-- | Command                      | List                             |
-- | ---------------------------- | -------------------------------- |
-- | `lsp_declarations`           | Declarations                     |
-- | `lsp_workspace_symbols`      | Workspace Symbols                |
-- | `lsp_incoming_calls`         | Incoming Calls                   |
-- | `lsp_outgoing_calls`         | Outgoing Calls                   |
-- | `lsp_type_sub`               | Sub Types                        |
-- | `lsp_type_super`             | Super Types                     |
-- | `lsp_code_actions`           | Code Actions                     |
-- | `lsp_finder`                 | All LSP locations, combined view |
-- | `lsp_document_diagnostics`   | alias to `diagnostics_document`  |
-- | `lsp_workspace_diagnostics`  | alias to `diagnostics_workspace` |
--
--
--
-- MISC                                                            *fzf-lua-misc*
--
-- | Command                | List                                          |
-- | ---------------------- | --------------------------------------------- |
-- | `builtin`              | fzf-lua builtin commands                      |
-- | `combine`              | combine different fzf-lua pickers             |
-- | `global`               | global picker for files,buffers and symbols   |
-- | `profiles`             | fzf-lua configuration profiles                |
-- | `helptags`             | help tags                                     |
-- | `manpages`             | man pages                                     |
-- | `colorschemes`         | color schemes                                 |
-- | `awesome_colorschemes` | Awesome Neovim color schemes                  |
-- | `highlights`           | highlight groups                              |
-- | `commands`             | neovim commands                               |
-- | `search_history`       | search history                                |
-- | `changes`              | :changes                                      |
-- | `registers`            | :registers                                    |
-- | `tagstack`             | :tags                                         |
-- | `autocmds`             | :autocmd                                      |
-- | `nvim_options`         | neovim options                                |
-- | `filetypes`            | filetypes                                     |
-- | `menus`                | menus                                         |
-- | `spellcheck`           | misspelled words in buffer                    |
-- | `spell_suggest`        | spelling suggestions                          |
-- | `packadd`              | :packadd <package>                            |
-- | `undotree`             | history undo tree                             |
--
--
--
-- NEOVIM API                                                *fzf-lua-neovim-api*
--
--   `:help vim.ui.select` for more info
--
-- | Command                | List                                                     |
-- | ---------------------- | -------------------------------------------------------- |
-- | `register_ui_select`   | register fzf-lua as the UI interface for `vim.ui.select` |
-- | `deregister_ui_select` | de-register fzf-lua with `vim.ui.select`                 |
--
--
--
-- NVIM-DAP                                                    *fzf-lua-nvim-dap*
--
--   Requires `nvim-dap` <https://github.com/mfussenegger/nvim-dap>
--
-- | Command              | List                                 |
-- | -------------------- | ------------------------------------ |
-- | `dap_commands`       | list,run `nvim-dap` builtin commands |
-- | `dap_configurations` | list,run debug configurations        |
-- | `dap_breakpoints`    | list,delete breakpoints              |
-- | `dap_variables`      | active session variables             |
-- | `dap_frames`         | active session jump to frame         |
--
--
--
-- TMUX                                                            *fzf-lua-tmux*
--
-- | Command        | List                    |
-- | -------------- | ----------------------- |
-- | `tmux_buffers` | list tmux paste buffers |
--
--
--
-- ZOXIDE                                                        *fzf-lua-zoxide*
--
-- | Command        | List                    |
-- | -------------- | ----------------------- |
-- | `zoxide`       | list recent directories |
--
--
--
-- COMPLETION FUNCTIONS                            *fzf-lua-completion-functions*
--
-- | Command          | List                                   |
-- | ---------------- | -------------------------------------- |
-- | `complete_path`  | complete path under cursor (incl dirs) |
-- | `complete_file`  | complete file under cursor (excl dirs) |
-- | `complete_line`  | complete line (all open buffers)       |
-- | `complete_bline` | complete line (current buffer only)    |
--
