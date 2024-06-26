return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["Q"] = actions.close,
                    },
                    n = {
                        ["Q"] = actions.close,
                    },
                },
                preview = false,
            },
            pickers = {
                find_files = {
                    mappings = {},
                    --previewer = false,
                    hidden = true,
                    theme = "dropdown",
                },
                help_tags = {
                    treesitter = false,
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")

        -- set keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
        vim.keymap.set("n", "<leader>ft", builtin.buffers, { desc = "Find TODOs" })
        vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Find string under cursor in cwd" })
        vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find string in cwd" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search the help" })
    end,
}
