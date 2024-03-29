-- I prefer this behavior of split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Tabulation
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Do not change the endofline if there is an issue
vim.opt.fixendofline = false

-- Highlight current line
vim.opt.cursorline = true

-- Status bar
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.laststatus = 2

-- Command bar
vim.opt.wildmenu = true
vim.opt.wildignore = { "*.o", "*~", "*.pyc" }

-- Mouse
vim.opt.mouse = ""

-- Support editor config
vim.g.editorconfig = true
