#!/bin/bash

# Check if a URL is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# URL provided as argument
url="$1"

# Create a new file curl-format.txt
cat <<EOF > curl-format.txt
    time_namelookup:  %{time_namelookup}s\n
    time_connect:  %{time_connect}s\n
    time_appconnect:  %{time_appconnect}s\n
    time_pretransfer:  %{time_pretransfer}s\n
    time_redirect:  %{time_redirect}s\n
    time_starttransfer:  %{time_starttransfer}s\n
                     ----------\n
    time_total:  %{time_total}s\n
EOF

# Make a request
curl -w "@curl-format.txt" -o /dev/null -s "$url"

