function rm -d "Avoid frustration"
  command rm $argv
  if test $status -ne 0
    echo 'force? [yn] '
    read -l -n1 ans
    string match -qi y -- $ans; or return 1
  end
  command rm -rf $argv
end
