return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Source for LSP
    "hrsh7th/cmp-buffer",   -- Source for text in current buffer
    "hrsh7th/cmp-path",     -- Source for file system paths
    "L3MON4D3/LuaSnip",     -- Snippet engine
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
        ["<Tab>"] = cmp.mapping.select_next_item(),        -- Tab to go down
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),      -- Shift+Tab to go up
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, 
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
