-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- custom commands

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load folds, when opening file",
	command = "e",
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})

vim.opt.foldlevel = 0
vim.opt.foldlevelstart = 0

if vim.g.neovide then
	--vim.o.guifont = 'RobotoMono Nerd Font Mono:h14'
	vim.o.guifont = "Iosevka Nerd Font:h14"
	vim.g.neovide_transparency = 1
	vim.g.transparent_enabled = false
	vim.opt.winblend = 30
	vim.opt.pumblend = 30
	vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
	vim.keymap.set("n", "<sc-s>", ":w<CR>", { noremap = true }) -- Save
	vim.keymap.set("v", "<sc-c>", '"+y', { noremap = true }) -- Copy
	vim.keymap.set("n", "<sc-v>", '"+p', { noremap = true }) -- Paste normal mode
	vim.keymap.set("v", "<sc-v>", '"+p', { noremap = true }) -- Paste visual mode
	vim.keymap.set("c", "<sc-v>", "<C-R>+", { noremap = true }) -- Paste command mode
	vim.keymap.set("i", "<sc-v>", "<C-R>+", { noremap = true }) -- Paste insert mode
	vim.api.nvim_set_keymap("t", "<sc-v>", '<C-\\><C-n>"+Pi', { noremap = true })
end
