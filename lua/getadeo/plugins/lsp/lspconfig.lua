return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr) -- client is the first argument
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
        vim.diagnostic.open_float(nil, { focus = false }) -- show float after jump
      end, opts)

      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
        vim.diagnostic.open_float(nil, { focus = false }) -- show float after jump
      end, opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
        },
        texthl = {
          [vim.diagnostic.severity.ERROR] = "Error",
          [vim.diagnostic.severity.WARN] = "Warning",
          [vim.diagnostic.severity.INFO] = "Info",
          [vim.diagnostic.severity.HINT] = "Hint",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      }
    })

    -- configure html server
    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
      init_options = {
        provideFormatter = false, -- disable formatting
        embeddedLanguages = {
          css = true,
          javascript = true,
          typescript = true,
        },
      },
    })

    -- configure typescript server with plugin
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
      init_options = {
        preferences = {
          importModuleSpecifierPreference = "non-relative",
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertText = true,
        },
      },
    })

    vim.lsp.config("cssls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "css", "scss", "sass", "less" },
    })

    vim.lsp.config("ruby_ls", {
      cmd = { "bundle", "exec", "ruby-lsp" },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("graphql_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    vim.lsp.config('emmet_ls', {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "erb" },
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          }
        }
      }
    })

    -- configure lua server (with special settings)
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          runtime = {
            -- Lua version
            version = "LuaJIT",
          },
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
