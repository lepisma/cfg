function cp -d "Wrap around cp"
  switch $argv[1]
    case "git@*" "https://github.com*" "http://github.com*"
      git clone $argv
    case "*"
      command cp $argv
  end
end
