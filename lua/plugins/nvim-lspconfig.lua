return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"folke/neoconf.nvim",
        "windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},

    config = function()
    	require("neoconf").setup({})
    	local cmp_nvim_lsp = require("cmp_nvim_lsp")
    	local lspconfig = require("lspconfig")
    	local capabilities = cmp_nvim_lsp.default_capabilities()
        -- local on_attach = require("util.lsp").on_attach
        -- local diagnostic_signs = require("util.icons").diagnostic_signs

    	--for type, icon in pairs(diagnostic_signs) do
    	--	local hl = "DiagnosticSign" .. type
    	--	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    	--end

    	-- lua
    	lspconfig.lua_ls.setup({
    		capabilities = capabilities,
    		-- on_attach = on_attach,
    		settings = { -- custom settings for lua
    			Lua = {
    				-- make the language server recognize "vim" global
    				diagnostics = {
    					globals = { "vim" },
    				},
    			},
    		},
    	})
    end
}