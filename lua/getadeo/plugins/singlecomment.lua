return {
  "lucastavaresa/SingleComment.nvim",
  lazy = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  init = function()
    local keymap = vim.keymap

    keymap.set("n", "gcc", require("SingleComment").SingleComment, { expr = true })
    keymap.set("v", "gc", require("SingleComment").Comment, {})
    keymap.set("n", "gca", require("SingleComment").ToggleCommentAhead, {})
    keymap.set("n", "gcA", require("SingleComment").CommentAhead, {})
    keymap.set({ "n", "v" }, "gcb", require("SingleComment").BlockComment)
  end,
}
