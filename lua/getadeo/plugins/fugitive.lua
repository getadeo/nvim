return {
  -- Git wrapper
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Git blame" },
    keys = {
      {
        '<leader>gs', ':Git<cr>', mode = { 'n', 'v' }, desc = 'Git Status'
      },
      {
        '<leader>gb', ':Git blame<cr>', mode = { 'n', 'v' }, desc = 'Git Blame'
      }
    }
  },
}
