while read line
    do
        wget -O - "$line"
    done 2>/dev/null | grep -E -o 'href="http://[^"]*"' | sed -r 's/href="(.*)"/\1/'
