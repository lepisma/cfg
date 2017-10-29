function t -d "Tree levels"
  if count $argv > /dev/null
    tree -L $argv[1]
  else
    tree
  end
end
