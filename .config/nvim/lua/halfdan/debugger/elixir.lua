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
      startApps = true,
      projectDir = "${workspaceFolder}",
      requireFiles = { "test/**/test_helper.exs", "test/**/*_test.exs"}
    }
}
