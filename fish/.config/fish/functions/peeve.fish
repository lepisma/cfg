function peeve -d "Python version changer"
  set -l sys_path /usr/bin
  set -l conda_path ~/tools/anaconda/bin
  set -l conda_py2_path ~/tools/anaconda/envs/python2/bin

  set -l sys_path_index (contains -i $sys_path $PATH)
  set -l conda_path_index (contains -i $conda_path $PATH)

  if count $argv > /dev/null
    switch $argv[1]
      case "2"
        echo "Switching to anaconda python 2"
        if not contains $conda_py2_path $PATH
          bass source activate python2
        else
          # Remove system override
          if test $sys_path_index -lt (contains -i $conda_py2_path $PATH)
            set -e PATH[$sys_path_index]
          end
        end
      case "3"
        echo "Switching to anaconda python 3"
        if test $sys_path_index -lt $conda_path_index
          set -e PATH[$sys_path_index]
        end
        if contains $conda_py2_path $PATH
          bass source deactivate
        end
      case "sys"
        echo "Switching to system path"
        if contains $conda_py2_path $PATH
          if test $sys_path_index -gt (contains -i $conda_py2_path $PATH)
            set PATH /usr/bin $PATH
          end
        end
        if test $sys_path_index -gt $conda_path_index
          set PATH /usr/bin $PATH
        end
      case "*"
        echo "Invalid environment"
        return 1
    end
  else
    echo "Provide python environment name"
    return 1
  end
end
