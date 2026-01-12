function google
    set query (string join "+" $argv)
    xdg-open "https://www.google.com/search?q=$query" >/dev/null 2>&1 &
end
