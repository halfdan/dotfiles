local nnoremap = require('halfdan.keymap').nnoremap
local actions = require("telescope.actions")
local action_state = require "telescope.actions.state"
local worktree = require("git-worktree")

local function create_workspace_for_issue()
  require'telescope'.extensions.jira.live_search({
    attach_mappings =function ()
      actions.select_default:replace(
        function ()
          local selection = action_state.get_selected_entry()
          local branch_name = "fb/" .. selection.key:lower()
          vim.schedule(function ()
            -- Create worktree
            worktree.create_worktree(branch_name, branch_name, "origin")

          end)
        end
      )
      return true
    end,
    assignee = "fbecker@adobe.com",
  })
end


nnoremap("<leader>jw", function ()
  create_workspace_for_issue()
end)

nnoremap("<leader>js", function ()
  require'telescope'.extensions.jira.live_search({
    project="BES"
  })
end)
