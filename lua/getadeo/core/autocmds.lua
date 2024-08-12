local cmd = vim.cmd

-- Set filetype for jbuilder files to ruby
cmd [[autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby]]

-- Set filetype for templ files to go
cmd [[autocmd BufNewFile,BufRead *.templ set filetype=go]]
