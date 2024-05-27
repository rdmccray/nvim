return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig",
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer",
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local on_attach = function()
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<leader>gh", "<cmd>vim.lsp.buf.hover()<CR>", opts)
            vim.keymap.set("n", "<leader>gd", "<cmd>vim.lsp.buf.definition()<CR>", opts)
            vim.keymap.set("n", "<leader>gt", "<cmd>vim.lsp.buf.type_definition()<CR>", opts)
            vim.keymap.set("n", "<leader>gi", "<cmd>vim.lsp.buf.implementation()<CR>", opts)
            vim.keymap.set("n", "<leader>dj", "<cmd>vim.diagnostic.goto_next()<CR>", opts)
            vim.keymap.set("n", "<leader>dk", "<cmd>vim.diagnostic.goto_prev()<CR>", opts)
            vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)
        end
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- require("neoconf").setup()
        -- require("neodev").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            automatic_installation = false,
            handlers = {
                -- ["lua_ls"] = function()
                --     capabilities = capabilities,
                --     on_attach = on_attach,
                --     Settings = {
                --         Lua = {
                --             completion = {
                --                 callSnippet = "Both",
                --                 enable = true,
                --             },
                --             diagnostics = {
                --                 disable = {
                --                     -- "missing-fields",
                --                 },
                --                 -- make the language server recognize "vim" global
                --                 globals = { "vim" },
                --             },
                --             runtime = {
                --                 version = "LuaJIT",
                --             },
                --             workspace = {
                --                 checkThirdParty = false,
                --                 ignoreDir = { ".git" },
                --                 library = {
                --                     vim.env.VIMRUNTIME,
                --                 },
                --             },
                --         },
                --     }
                -- end,
                -- function(server_name)
                --     require("lspconfig")[server_name].setup({
                --         capabilities = capabilities,
                --         on_attach = on_attach,
                --     })
                -- end,
            },
        })
        -- lua-language-server
        require("mason-tool-installer").setup({

            -- a list of all tools you want to ensure are installed upon
            -- start
            ensure_installed = {
                "stylua",
                "prettier",
            },

            -- if set to true this will check each tool for updates. If updates
            -- are available the tool will be updated. This setting does not
            -- affect :MasonToolsUpdate or :MasonToolsInstall.
            -- Default: false
            auto_update = true,

            -- automatically install / update on startup. If set to false nothing
            -- will happen on startup. You can use :MasonToolsInstall or
            -- :MasonToolsUpdate to install tools and check for updates.
            -- Default: true
            run_on_start = true,

            -- set a delay (in ms) before the installation starts. This is only
            -- effective if run_on_start is set to true.
            -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
            -- Default: 0
            start_delay = 3000, -- 3 second delay

            -- Only attempt to install if 'debounce_hours' number of hours has
            -- elapsed since the last time Neovim was started. This stores a
            -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
            -- This is only relevant when you are using 'run_on_start'. It has no
            -- effect when running manually via ':MasonToolsInstall' etc....
            -- Default: nil
            debounce_hours = nil, -- at least 5 hours between attempts to install/update

            -- Disable integration with other Mason plugins. This removes
            -- the ability to to use the alternative names of packages provided
            -- by these plugins but disables them from immediately becoming loaded
            integrations = {
                ["mason-lspconfig"] = true,
                ["mason-null-ls"] = true,
                ["mason-nvim-dap"] = true,
            },
        })
    end,
}
