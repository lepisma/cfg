# Install fonts in a directory packed in zips

[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")

$target = Convert-Path .
$target = $target + "\temp"

dir *.zip |
  ForEach-Object {
      [System.IO.Compression.ZipFile]::ExtractToDirectory($_.FullName, $target)
      $fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
      dir temp/*.*tf | %{ $fonts.CopyHere($_.fullname) }
      Remove-Item -Recurse -Force $target
  }
