return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      backdrop = 0.95,
      width = 140,
      height = 1,
      options = {
        signcolumn = "no",
        number = true,
        relativenumber = true,
        cursorline = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      gitsigns = { enabled = true },
      tmux = { enabled = true },
    },
  },
}
