local Worktree = require("git-worktree")
local Job = require("plenary.job")

local function schedule_notify(message)
  vim.schedule(function()
    vim.notify.notify(message)
  end)
end

local function is_massdriver()
  return not not (string.find(vim.loop.cwd(), "massdriver.git", 1, true))
end

Worktree.on_tree_change(function(op, metadata)
  local compile_job = Job:new({
    command = "mix",
    args = { "compile" },
    on_start = function()
      schedule_notify("Compiling...")
    end,
    on_exit = function(_j, _return_val)
      schedule_notify("Compiling done")
    end
  })

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

  if op == Worktree.Operations.Create and is_massdriver() then
    deps_job:and_then(compile_job)
    deps_job:sync()
    compile_job:wait()
  end

  if op == Worktree.Operations.Switch and is_massdriver() then
    compile_job:start()
  end
end)
