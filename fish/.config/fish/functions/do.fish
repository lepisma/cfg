function do -d "Do the most sensible thing"
  if count $argv > /dev/null
    if [ $argv[1] = "milk" ]
      echo "Bitch Lasagna!"
      return 1
    end
    switch (echo $argv[1] | awk -F . '{if (NF>1) {print $NF}}')
      case "gz" "xz" "tar" "bz2" "tgz"
        tar xvf $argv[1]
      case "ace"
        unace x $argv[1]
      case "rar"
        unrar x $argv[1]
      case "7z"
        7z x $argv[1]
      case "zip"
        unzip $argv[1]
      case "deb"
        sudo dpkg -i $argv[1]
      case "py"
        python $argv[1]
      case "hy"
        hy $argv[1]
      case "js"
        node $argv[1]
      case "pdf" "djvu"
        okular $argv[1]
      case "*"
        xdg-open $argv[1]
    end
  else
    return 1
  end
end
