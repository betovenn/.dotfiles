return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- "ibl" new setup name for version 3
  opts = {
    indent = {
      char = "│", -- character for the line
      tab_char = "│",
    },
    scope = {
      enabled = true, -- Highlights the current block
      show_start = true,
      show_end = false,
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      },
    },
  },
}
