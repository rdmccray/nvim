return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
    },

    config = function()
        -- add diagnositc signs to the number column
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- keymaps to use in the buffer
        local on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { buffer = bufnr })
            vim.keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { buffer = bufnr })
        end

        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        -- **************************************
        -- * begin configuring language servers *
        -- **************************************

        -- lua-language-server
        lspconfig.lua_ls.setup({
            capabilities = lsp_capabilities,
            on_attach = on_attach,
            single_file_support = true,
            settings = { -- custom settings for lua
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                        enable = true,
                    },
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        disable = {
                            "missing-fields",
                        },
                        globals = { "vim" },
                    },
                    hint = {
                        enable = true,
                        setType = false,
                        paramType = true,
                        paramName = "Disable",
                        semicolon = "Disable",
                        arrayIndex = "Disable",
                    },
                    runtime = {
                        version = "LuaJIT",
                    },
                    workspace = {
                        checkThirdParty = false,
                        ignoreDir = { ".git" },
                        library = {
                            vim.env.VIMRUNTIME,
                            "${3rd}/luv/library",
                        },
                    },
                },
            },
        })

        -- typescript language server
        -- lspconfig.tsserver.setup({
        --     capabilities = lsp_capabilities,
        --     on_attach = on_attach,
        --     init_options = {
        --         hostInfo = "Neovim",
        --         preferences = {
        --             disableSuggestions = true,
        --         },
        --     },
        -- })

        -- -- json language server
        -- lspconfig.jsonls.setup({
        --     capabilities = lsp_capabilities,
        --     on_attach = on_attach,
        --     init_options = {
        --         lsp_capabilities.textDocument.completion.completionItem.snippetSupport == true,
        --     },
        -- })
    end,
}
