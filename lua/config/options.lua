
vim.opt.autoindent = true
vim.opt.background = ""
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
-- vim.opt.fillchars = "fold: "
-- vim.opt.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds
-- vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- vim.opt.foldlevel = 99
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldtext = ""
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 3
-- vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300  -- lower than the default of 1000 to trigger which-key more quickly
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false












