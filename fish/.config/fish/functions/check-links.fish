function check-links -d "Check status of external links in all the html"
    for file in $argv
        cat $file | pup 'a attr{href}' | egrep '^http.*' | xargs -P 10 -I '<>' -r -n 1 curl -s -o /dev/null -w "$file\n%{http_code}: <>\n\n" '<>'
    end
end
