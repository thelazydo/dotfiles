local opt = vim.opt

vim.o.winborder = "rounded"
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0 -- help banner(0-1)
-- vim.g.netrw_browse_split = 4 -- where to open files (1-horiz,2-vert,3-net_tab,4-prev_win)
-- vim.g.netrw_winsize = 80
vim.g.netrw_altv = 1 -- vertical split (0-left, 1-right)

-- stylua: ignore
opt.shortmess:append("I")
opt.winborder = "rounded" -- set popup windows border
opt.laststatus = 3
opt.showmode = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 200
opt.timeoutlen = 400
opt.shiftround = true
opt.wrap = false
opt.spell = false
opt.cmdheight = 0
opt.virtualedit = "block"
opt.sessionoptions = { "buffers", "curdir", "help", "tabpages", "winsize", "globals", "skiprtp" }

-- Autocomplete Settings
opt.autocomplete = true -- enable autocomplete suggestions
opt.pumborder = "rounded" -- set suggestion window
opt.pummaxwidth = 40 -- set max widown width
opt.pumheight = 7 -- set height
opt.completeopt = "fuzzy,menu,menuone,noinsert,popup" -- set complete options
opt.complete = ".,o" -- use buffer and omnifunc
--
-- Number settings
opt.number = true
opt.relativenumber = true
-- Scroll Settings
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indent Settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.expandtab = true
opt.autoindent = true

-- Search settings
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true -- highlight matches found
opt.incsearch = true -- highlight matches as you type

-- File Handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.confirm = true -- confirm to save changes before existing buffer

-- Split Behavior
opt.splitbelow = true
opt.splitright = true

-- opt.list           = true           -- show some invisible characters

-- Performance
opt.redrawtime = 10000
opt.maxmempattern = 20000
opt.iskeyword:append("-") -- Treat dash as part of word
opt.clipboard:append("unnamedplus") -- include system clipboard

-- Set these once globally
vim.o.foldlevelstart = 99
vim.o.foldlevel = 20

-- opt.background = "dark"
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
