return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig",
        "williamboman/mason-tool-installer",
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
        --         settings = {
        --             Lua = {
        --                 completion = {
        --                     callSnippet = "Both",
        --                     enable = true,
        --                 },
        --                 diagnostics = {
        --                     disable = {
        --                         "missing-fields",
        --                     },
        --                     -- make the language server recognize "vim" global
        --                     globals = { "vim" },
        --                 },
        --                 runtime = {
        --                     version = "LuaJIT",
        --                 },
        --                 workspace = {
        --                     checkThirdParty = false,
        --                     ignoreDir = { ".git" },
        --                     library = {
        --                         vim.env.VIMRUNTIME,
        --                     },
        --                 },
        --             },
        --         }
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
