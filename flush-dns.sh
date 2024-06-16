#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Flush DNS
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🌐

# Documentation:
# @raycast.description Flush DNS Cache
# @raycast.author reddiedev
# @raycast.authorURL https://raycast.com/reddiedev

# sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
# pw="$(osascript -e 'Tell application "System Events" to display dialog "Password:" default answer "" with hidden answer' -e 'text returned of result' 2>/dev/null)" && /
#     echo "$pw" | sudo -S dscacheutil -flushcache; sudo killall -HUP mDNSResponder


osascript -e "do shell script \"sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder\""
echo "DNS Cache Flushed"