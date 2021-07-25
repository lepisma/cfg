function _git_branch_name
    echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
    echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end

function fish_prompt
    set -l last_status $status
    set -l def 555555

    if [ (jobs -l | wc -l) -gt 0 ]
        set_color $def -o
        echo -n ' ⇆'
    end

    if [ $last_status -ne 0 ]
        set_color bryellow -o
    else
        set_color white -o
    end

    if [ (_git_branch_name) ]; and [ (_git_is_dirty) ];
        echo -n ' δ'
    else
        echo -n ' λ'
    end

    # Show git branch and status
    if [ (_git_branch_name) ]
        if [ (_git_branch_name) = "master" ]
            set_color $def -o
        else if [ (_git_branch_name) = "main" ]
            set_color $def -o
        else
            set_color bryellow -o
        end
        echo -n '⎇ '
    end

    echo -n ' '

    set_color normal
end
