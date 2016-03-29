# Switch python environments with conda

function py
  if count $argv > /dev/null
    switch $argv[1]
      case "2"
        echo "Switching to python2"
        bass source activate python2
      case "3"
        echo "Switching to python3"
        bass source deactivate
      case "*"
        echo "Invalid environment"
        return 1
    end
  else
    echo "Provide python environment name"
    return 1
  end
end
