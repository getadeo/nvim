return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local bufferline = require("bufferline")
    local keymap = vim.keymap

    bufferline.setup({
      options = {
        numbers = "ordinal",
      }
    })

    for i = 1, 9 do
      keymap.set("n", "<leader>" .. i, function()
        bufferline.go_to_buffer(i, true)
      end,
        {
          desc = "Go to buffer " .. i,
        }
      )
    end

    keymap.set("n", "<leader>0", function ()
      bufferline.go_to_buffer(-1, true)
    end,
      {
        desc = "Go to buffer 0" ,
      }
    )
  end,
}
