if status is-interactive
   # Commands to run in interactive sessions can go here
   # atuin init fish | source 
end
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr -a -- gst 'git status'
abbr -a -- gca 'git commit --amend'
abbr -a -- gpf 'git push -f'
abbr -a -- gp 'git push'
abbr -a -- gl 'git pull'
abbr -a -- gl 'git rebase develop'
abbr -a -- gcd 'git checkout develop'
abbr -a -- gc- 'git checkout -'
abbr -a -- gc 'git checkout'

abbr -a -- api 'kubectl get pods -n backend | fzf | awk \'{print $1}\' | xargs -o -I {} kubectl exec -i -t -n backend {} --container api -- /opt/app/api/bin/api remote'


function preview_shell
  set PR $(gh pr status --json number | jq '.currentBranch.number')

  kubectl get pods -n backend | awk '{print $1}' | grep "$PR-api" | head -1 | xargs -o -I {} kubectl exec -i -t -n backend {} --container api -- /opt/app/api/bin/api remote
end


function preview_db
  gh pr status --json number | jq '.currentBranch.number' | xargs -o -I {} devops db connect frameio-pr-{}-cluster
end

function mix_test_changed
  git status -s | awk '{print $2}' | grep '_test.exs' | xargs mix test
end
