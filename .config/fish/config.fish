if status is-interactive
    # Commands to run in interactive sessions can go here
end
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr -a -- gst 'git status'
abbr -a -- gca 'git commit --amend'
abbr -a -- gpf 'git push -f'
abbr -a -- gp 'git pull'
