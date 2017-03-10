function install-fonts -d "Install zipped fonts in current directory"
  for zipped in *.zip
    unzip -o $zipped "*tf" -d /var/tmp
  end

  sudo cp /var/tmp/*tf /usr/share/fonts/
  fc-cache -f -v
end
