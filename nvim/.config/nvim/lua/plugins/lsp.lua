return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Setup Mason 
      require("mason").setup()

      -- Servers and their specific settings
      -- Keys are the server names
      local servers = {
        clangd = {},        -- C/C++
        gopls = {},         -- Go
        rust_analyzer = {   -- Rust
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
            },
          },
        },
        pyright = {},       -- Python
      }

      -- Ensure they are installed via Mason
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for name, config in pairs(servers) do
        -- Merge default capabilities with any specific config passed above
        config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
        
        -- Use the new native API to configure the server
        vim.lsp.config(name, config)
        
        -- if the config is registered via vim.lsp.config.
        vim.lsp.enable(name)
      end

      vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, { desc = "Show Error Message" })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Error" })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Error" })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          
          -- Press <Space>ca to see fixes
          vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
          
          -- Standard keys
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to Definition
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)      -- Hover Info
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename Variable
        end,
      })

    end,
  }
}
