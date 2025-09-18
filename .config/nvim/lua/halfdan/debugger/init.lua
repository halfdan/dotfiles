local dap = require("dap")
local dapui = require("dapui")
local daptext = require("nvim-dap-virtual-text")

local remap = require("halfdan.keymap")
local nnoremap = remap.nnoremap
local dap = require("dap")
local dapgo = require("dap-go")

daptext.setup()
dapui.setup({
    layouts = {
        {
            elements = {
                "console",
            },
            size = 7,
            position = "bottom",
        },
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "watches",
            },
            size = 40,
            position = "left",
        }
    },
})

-- Keymappings
--
nnoremap("<Home>", function()
    dapui.toggle(1)
end)
nnoremap("<End>", function()
    dapui.toggle(2)
end)

nnoremap("<leader><leader>", function()
    dap.close()
end)

nnoremap("<F5>", function()
    dap.continue()
end)
nnoremap("<F10>", function()
    dap.step_over()
end)
nnoremap("<F11>", function()
    dap.step_into()
end)
nnoremap("<F12>", function()
    dap.step_out()
end)
nnoremap("<Leader>b", function()
    dap.toggle_breakpoint()
end)
nnoremap("<Leader>B", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
nnoremap("<leader>rc", function()
    dap.run_to_cursor()
end)
nnoremap("<leader>dr", function()
    dap.repl.open()
end)



dap.listeners.after.event_initialized.dapui_config = function()
    dapui.open(1)
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end


dap.adapters.mix_task = {
  type = 'executable',
  command = '/usr/local/opt/elixir-ls/rel/debugger.sh', -- debugger.bat for windows
  args = {}
}

dapgo.setup()

dap.configurations.elixir = {
  {
    type = 'mix_task',
    name = 'mix test',
    request = 'launch',
    task = 'test',
    taskArgs = { '--trace' },
    startApps = false,
    projectDir = "${workspaceFolder}",
    requireFiles = { "test/**/test_helper.exs", "test/**/*_test.exs" }
  },
  {
    name = "mix test focused",
    type = "mix_task",
    request = "launch",
    taskArgs = {
      "${relativeFile}:${lineNumber}",
      "--color",
      "--trace"
    },
    projectDir = "${workspaceRoot}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs"
    }
  }
}
