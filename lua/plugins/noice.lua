return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        -- "hrsh7th/nvim-cmp",
    },
    opts = {
        --         -- override the default lsp markdown formatter with Noice
        --         -- the default is false while the recommedation is true
        --         ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        --         -- override the lsp markdown formatter with Noice
        --         -- the default is false while the recommendation is true
        --         ["vim.lsp.util.stylize_markdown"] = false,
        --         -- override cmp documentation with Noice (needs the other options to work)
        --         -- the default is false while the recommendation is true
        --         ["cmp.entry.get_documentation"] = false,
        --     },
        -- },
        -- you can enable a preset for easier configuration
        presets = {
            -- bottom_search = false, -- use a classic bottom cmdline for search
            -- command_palette = false, -- position the cmdline and popupmenu together
            -- long_message_to_split = true, -- long messages will be sent to a split
            -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
    },
}
