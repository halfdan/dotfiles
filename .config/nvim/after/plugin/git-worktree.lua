local Worktree = require("git-worktree")
local Job = require("plenary.job")

local function is_massdriver()
  return not not (string.find(vim.loop.cwd(), "massdriver.git", 1, true))
end

Worktree.on_tree_change(function (op, metadata)
  local compile_job = Job:new({
    "mix", "compile"
  })

  if op == Worktree.Operations.Create and is_massdriver() then
    local deps_job = Job:new({
      "mix", "deps.get"
    })
    deps_job:and_then(compile_job)
    deps_job:sync()
    compile_job:wait()
  end

  if op == Worktree.Operations.Switch and is_massdriver() then
    compile_job:start()
  end
end)
