local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'rust_analyzer',
	'sumneko_lua',
})

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '⧊',
  }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
