local opt = vim.opt

opt.autoindent = true
opt.background = ""
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
-- opt.cmdheight = 0
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
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
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.inccommand = "split"
opt.iskeyword:append("-")
opt.laststatus = 0
opt.list = true
-- opt.listchars:append("eol:󰌑")
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 10
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shiftwidth = 4
opt.showmode = false
opt.sidescrolloff = 10
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300 -- lower than the default of 1000 to trigger which-key more quickly
opt.undofile = true
opt.undolevels = 10000
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.wrap = false
