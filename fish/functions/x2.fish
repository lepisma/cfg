# Convert videos to 3GP for my vintage x2

function x2
  if count $argv > /dev/null
    ffmpeg -y -i $argv[1] -r 30 -s 352x288 -vb 600k -acodec aac -strict experimental -ac 1 -ar 8000 -ab 96k $argv[1].3gp
  else
    echo "Provide an input file"
    return 1
  end
end
