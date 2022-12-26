vim.opt.termguicolors = true

local bufferline = require("bufferline")

bufferline.setup{
   options = {
     numbers = "ordinal",
   }
}

-- buffer navigations
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
     bufferline.go_to_buffer(i, true)
  end)
end

vim.keymap.set("n", "<leader>0", function ()
	bufferline.go_to_buffer(-1, true)
end)

