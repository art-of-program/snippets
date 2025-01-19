#!/bin/bash

# function to URL encode a string
url_encode() {
    local string="$1"
    local encoded=""
    local length=$(echo -n "$string" | wc -c)  # get the string length
    local i=1

    while [ $i -le $length ]; do
        char=$(echo -n "$string" | cut -c $i)  # extract the i-th character
        case "$char" in
            [a-zA-Z0-9.~_-]) encoded+="$char" ;; # safe characters
            *) encoded+=$(printf '%%%02X' "'$char") ;;
        esac
        i=$((i + 1))  # increment the counter
    done
    echo "$encoded"
}

# main interactive loop
echo "URL Encoder!"
echo "Type the text you want to encode (or type 'q' to quit)."

while true; do
    read -p "Enter text to encode: " input
    if [ "$input" = "exit" ]; then
        echo "quit!"
        break
    fi
    echo "Encoded URL: $(url_encode "$input")"
done
