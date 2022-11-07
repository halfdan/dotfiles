local dap = require('dap')

dap.adapters.mix_task = {
  type = 'executable',
  command = '/usr/local/opt/elixir-ls/rel/debugger.sh', -- debugger.bat for windows
  args = {}
}

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
