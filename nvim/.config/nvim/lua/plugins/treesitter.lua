return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false, -- Force load immediately
  config = function()
    -- Wrap in pcall to prevent crashing if modules are missing
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return -- Stop silently if treesitter failed to load
    end

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "cpp", "go", "rust", "java" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
