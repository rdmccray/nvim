return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local transform_mod = require("telescope.actions.mt").transform_mod

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    },
                },
            },
            pickers = {
                -- Default configuration for builtin picker goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                },                               -- the default case_mode is "smart_case"
            }
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find string in current working directory"})
    end,
}
