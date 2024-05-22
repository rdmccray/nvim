return {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            automatic_installation = true,
            handlers = nil,
        })
    end
}
