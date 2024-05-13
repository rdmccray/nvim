
-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- set lazy.nvim options
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	-- automatically check for and notify of plugin updates
  checker = { 
    enabled = true,
    notify = true
  },
  -- automatically detect and notify of config changes
  -- then reload the ui
  change_detection = {
    enabled = true,
    notify = true
  },
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
