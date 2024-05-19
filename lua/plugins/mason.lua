return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
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
                "cssls",
                "html",
                "lua_ls",
                "tsserver",
            },
        })
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
        })
    end,
}
