-- Transparent backgrounds
vim.g.ui_groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"LineNr",
	"Folded",
	"NonText",
	"SpecialKey",
	"VertSplit",
	"SignColumn",
	"EndOfBuffer",
	"WinSeparator",
	"MsgArea",
	"FloatBorder",
	"CursorLineNr",
	"Pmenu",
}

vim.g.all_ui_groups = {
	--  Original List (Annotated)
	"Normal", -- Normal text background/foreground (the base for everything)
	"NormalNC", -- Normal text in non-current (inactive) windows
	"NormalFloat", -- Normal text in floating windows
	"LineNr", -- Line number for ":number" and ":#", and when 'relativenumber' is on
	"Folded", -- Line used for closed folds
	"NonText", -- 'listchars' (like EOL), and characters that don't exist (e.g. @)
	"SpecialKey", -- Unprintable characters (e.g. ^M) and 'listchars' whitespace
	"VertSplit", -- Vertical separator (Legacy: usually linked to WinSeparator)
	"SignColumn", -- Column where signs (git, LSP errors) are displayed
	"EndOfBuffer", -- Filler lines (~) after the last line in the buffer
	"StatusLine", -- Status line of current window
	"StatusLineNC", -- Status lines of not-current windows
	"TabLine", -- Tab pages line, not active tab page label
	"TabLineFill", -- Tab pages line, where there are no labels
	"TabLineSel", -- Tab pages line, active tab page label
	"WinSeparator", -- Separators between split windows (Vertical & Horizontal)
	"MsgArea", -- Area for messages and command-line
	"FloatBorder", -- Border of floating windows
	"CursorLineNr", -- Like LineNr when 'cursorline' is set for the cursor line
	"Pmenu", -- Popup menu: normal item
	"PmenuSel", -- Popup menu: selected item
	"PmenuSbar", -- Popup menu: scrollbar
	"PmenuThumb", -- Popup menu: scrollbar thumb

	--  Missing / Recommended Additions

	-- Cursor & Selection
	"Cursor", -- Character under the cursor
	"lCursor", -- Character under the cursor (Language Mapping)
	"CursorIM", -- Cursor in Input Method
	"TermCursor", -- Cursor in a terminal
	"TermCursorNC", -- Cursor in an unfocused terminal
	"Visual", -- Visual mode selection
	"VisualNOS", -- Visual mode selection when vim is "Not Owning the Selection"

	-- Search & Matches
	"Search", -- Last search pattern highlighting (used for 'hlsearch')
	"IncSearch", -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	"CurSearch", -- Highlighting of the current match (nvim 0.10+)
	"MatchParen", -- The character under the cursor or just before it, if it is a paired bracket
	"Substitute", -- :substitute replacement text highlighting

	-- UI Highlights
	"ColorColumn", -- Used for the columns set with 'colorcolumn'
	"CursorColumn", -- Screen-column at the cursor, when 'cursorcolumn' is set
	"CursorLine", -- Screen-line at the cursor, when 'cursorline' is set
	"Conceal", -- Placeholder characters substituted for concealed text (see 'conceallevel')
	"Directory", -- Directory names (and other special names in listings)
	"Title", -- Titles for output from ":set all", ":autocmd" etc.

	-- Window Bar (Breadcrumbs)
	"WinBar", -- Window bar of current window
	"WinBarNC", -- Window bar of non-current windows

	-- Messages
	"ModeMsg", -- 'showmode' message (e.g., "-- INSERT --")
	"MsgSeparator", -- Separator for scrolled messages
	"MoreMsg", -- More-prompt
	"Question", -- Question |hit-enter| prompt and yes/no questions
	"ErrorMsg", -- Error messages on the command line
	"WarningMsg", -- Warning messages

	-- Diffs (Git Merge / Vimdiff)
	"DiffAdd", -- Diff mode: Added line
	"DiffChange", -- Diff mode: Changed line
	"DiffDelete", -- Diff mode: Deleted line
	"DiffText", -- Diff mode: Changed text within a changed line

	-- Spelling
	"SpellBad", -- Word that is not recognized by the spellchecker
	"SpellCap", -- Word that should start with a capital
	"SpellLocal", -- Word that is recognized by the spellchecker as one that is used in another region
	"SpellRare", -- Word that is recognized by the spellchecker as one that is hardly ever used

	-- Floating Window Extras
	"FloatTitle", -- Title of floating windows
	"FloatFooter", -- Footer of floating windows

	-- Gutter / Folds
	"FoldColumn", -- 'foldcolumn'

	-- Quickfix
	"QuickFixLine", -- Current |quickfix| item in the quickfix window

	-- Wildmenu (Command line completion)
	"WildMenu", -- Current match in 'wildmenu' completion
}

vim.g.exclude_finds = {
	-- Node.js & JavaScript/TypeScript
	"node_modules/*",

	-- Python
	"__pycache__/*",
	"%.pyc",
	".venv/*",
	"venv/*",

	-- Rust
	"target/*",

	-- Go
	"bin/*",
	"pkg/*",

	-- C, C++, Rust, Zig, Go build artifacts
	"build/*",
	"dist/*",
	"*.o",
	"*.obj",
	"*.exe",
	"*.dll",
	"*.so",
	"*.dylib",
	"*.out",

	-- Lua
	".luarc.json",
	".luarc/*",

	-- C#
	"bin/*",
	"obj/*",

	-- Zig
	"zig-cache/*",
	"zig-out/*",

	-- Version control
	-- ".git/*",
	".svn/*",

	-- Common IDE/Editor folders
	".idea/*",
	".vscode/*",

	-- System files
	".DS_Store",
	"Thumbs.db",
}
