return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",        -- The UI (windows, variables, stack trace)
    "nvim-neotest/nvim-nio",       -- Required by dap-ui
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim", -- Connects Mason to DAP
  },
  keys = {
    -- Keymaps
    { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
    { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
    { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
    { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup UI
    dapui.setup()

    -- Automatically open/close the UI when debugging
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- Setup Mason-DAP (Installs debuggers automatically)
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb", "delve" }, -- codelldb for C/C++/Rust, delve for Go
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      },
    })
  end,
}
