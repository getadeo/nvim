return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
    -- keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
    keymap.set('n', '<leader>fg', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Grep String" })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
    keymap.set('n', '<leader>sn', function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Search neovim files" })

  end,
}
