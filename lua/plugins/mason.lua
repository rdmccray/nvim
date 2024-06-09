return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig",
        "whoissethdaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            automatic_installation = false,
            handlers = nil,
        })
        -- require("mason-lspconfig").setup_handlers({
        --     function(server_name)
        --         require("lspconfig")[server_name].setup({
        --             capabilities = capabilities,
        --             on_attach = on_attach,
        --         })
        --     end,
        --     ["lua_ls"] = function()
        --         -- capabilities = capabilities,
        --         -- on_attach = on_attach,
        --         settings = { -- custom settings for lua
        --             Lua = {
        --                 completion = {
        --                     callSnippet = "Replace",
        --                     enable = true,
        --                 },
        --                 diagnostics = {
        --                     disable = {
        --                         "missing-fields",
        --                     },
        --                     -- make the language server recognize "vim" global
        --                     -- globals = { "vim" },
        --                 },
        --                 hint = {
        --                     enable = true,
        --                     semicolon = "Disable",
        --                 },
        --                 runtime = {
        --                     -- Tell the language server which version of Lua you're
        --                     -- using (most likely LuaJIT in the case of Neovim)
        --                     version = "LuaJIT",
        --                 },
        --                 -- Make the server aware of Neovim runtime files
        --                 workspace = {
        --                     checkThirdParty = false,
        --                     ignoreDir = { ".git" },
        --                     library = {
        --                         vim.env.VIMRUNTIME,
        --                         -- depending on the usage, you might
        --                         -- want to add additional paths here
        --                         -- "${3rd}/luv/library",
        --                         -- "${3rd}/busted/library",
        --                         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        --                         -- library = vim.api.nvim_get_runtime_file("", true)
        --                     },
        --                 },
        --             },
        --         },
        --     end,
        -- })
        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua",
                "prettier",
            },
            auto_update = true,
            run_on_start = true,
            start_delay = 0,
            debounce_hours = nil,
            integrations = {
                ["mason-lspconfig"] = true,
                ["mason-null-ls"] = true,
                ["mason-nvim-dap"] = true,
            },
        })
    end,
}
