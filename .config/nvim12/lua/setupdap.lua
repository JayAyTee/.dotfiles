local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

dap_virtual_text.setup({})

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/alvin/.local/share/nvim12/mason/bin/OpenDebugAD7",
}
dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
	setupCommands = { -- This allows vectors and other data structures to show the values inside them.
		{
			text = '-enable-pretty-printing',
			description =  'enable pretty printing',
			ignoreFailures = false
		},
	},
},
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- Dap UI

ui.setup()

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

local map = vim.keymap.set;

map("n","<leader>dt", dap.toggle_breakpoint);
map("n","<leader>dc", dap.continue);
map("n","<leader>di", dap.step_into);
map("n","<leader>do", dap.step_over);
map("n","<leader>du", dap.step_out);
map("n","<leader>dl", dap.run_last);
map("n","<leader>dq", function()
  dap.terminate();
  ui.close();
  dap_virtual_text.toggle();
end)
map("n","<leader>db", dap.list_breakpoints);
