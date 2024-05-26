return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
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
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    },
                },
            },
            pickers = {
                -- builtin picker configuration goes here
                -- picker_name = {
                --     picker_config_key = value,
                -- }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),
                },
                ["fzf"] = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                }, -- the default case_mode is "smart_case"
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>ft", builtin.buffers, { desc = "Find TODOs" })
        keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find string in cwd" })
    end,
}
