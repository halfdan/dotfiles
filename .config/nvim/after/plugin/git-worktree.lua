local Worktree = require("git-worktree")
local Job = require("plenary.job")
local FTerm = require("FTerm")

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

local function schedule_notify(message, level)
  vim.schedule(function()
    vim.notify.notify(message, level or "info")
  end)
end

local function is_elixir_project()
  return file_exists(vim.loop.cwd() .. "/" .. "mix.exs")
end

-- Run mix compile
local compile_job = Job:new({
  command = "mix",
  args = { "compile" },
  on_start = function()
    schedule_notify("Compiling...", "debug")
  end,
  on_exit = function(_j, _return_val)
    schedule_notify("Compiling done")
  end
})

-- Run mix deps.get
local deps_job = Job:new({
  command = "mix",
  args = { "deps.get" },
  on_start = function()
    schedule_notify("Fetching dependencies...")
  end,
  on_exit = function(_j, _return_val)
    schedule_notify("Fetched dependencies")
  end
})

local function create_docker_up_job(path)
  return Job:new({
    command = "docker-compose",
    args = { "up" },
    cwd = path,
    detached = true,
    on_start = function ()
      schedule_notify("Running docker in " .. path, "debug")
    end,
    on_exit = function (_j, return_val)
      if return_val ~= 0 then
        schedule_notify("Error running docker for " .. path, "error")
      end
    end
  })
end

local function create_docker_down_job(path)
  return Job:new({
    command = "docker-compose",
    args = { "down" },
    cwd = path,
    on_start = function ()
      schedule_notify("Shutting down containers at " .. path, "debug")
    end,
    on_exit = function ()
      schedule_notify("Shut down containers at " .. path, "debug")
    end,
  })
end

local iex = FTerm:new({
  cmd = { "iex", "-S", "mix" },
  dimensions = {
    height = 0.9,
    width = 0.9
  }
})

vim.keymap.set('t', '<A-t>', function ()
  iex:toggle()
end)
vim.keymap.set('n', '<A-t>', function ()
  iex:toggle()
end)

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Create and is_elixir_project() then
    deps_job:and_then(compile_job)
    deps_job:start()
  end

  if op == Worktree.Operations.Switch and is_elixir_project() then
    local docker_down = create_docker_down_job(metadata.prev_path)
    local docker_up = create_docker_up_job(metadata.path)

    docker_down:and_then(docker_up)
    compile_job:start()
    docker_down:start()

    iex:close(true)
  end
end)

local group = vim.api.nvim_create_augroup('MyCustomNeogitEvents', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'NeogitPullComplete',
  group = group,
  callback = function ()
    deps_job:and_then(compile_job)
    deps_job:start()
  end,
})
