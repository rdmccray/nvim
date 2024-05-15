return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
        -- "neovim/nvim-lspconfig",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        -- "hrsh7th/cmp-cmdline",
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms    
    },
    config = function()
        local cmp = require("cmp")
    
            -- Global setup.
            cmp.setup({
            snippet = {
                expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'snippy' }, -- For snippy users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
            }, {
                { name = 'buffer' },
            })
            })

            -- `/` cmdline setup.
            cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
            })

            -- `:` cmdline setup.
            cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
            })

            -- Setup lspconfig.
            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
            -- capabilities = capabilities
            -- }
    end
}   