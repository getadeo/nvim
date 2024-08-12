return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      -- Recommended - see "Configuring" below for more config options
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      terminal_colors = true,
      cmp = true,
      which_key = true,
      telescope = {
        enable = true,
      },
      mini = {
        enabled = true,
        indentscope_color = "lavender",
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
    })
    vim.cmd("colorscheme catppuccin-mocha") -- set the colorscheme
  end,
}
