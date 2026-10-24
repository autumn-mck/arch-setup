function slow_tree
    set -l target_directory $argv[1]
    set -l sleep_duration $argv[2]

    test -n "$target_directory"; or set target_directory "."
    test -n "$sleep_duration"; or set sleep_duration 0.125

    tree "$target_directory" | while read -l line
        echo $line
        sleep "$sleep_duration"; or break
    end
end

alias trees slow_tree

function slow_tree_with_lolcat
    slow_tree $argv | lolcat
end

alias treels slow_tree_with_lolcat
