return {
  "nvimtools/none-ls.nvim", -- configure formatters & linters
  lazy = true,
  -- event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason_null_ls = require("mason-null-ls")

    local null_ls = require("null-ls")

    mason_null_ls.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
        "rubocop"
      },
    })

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer"})
  end,
}
