#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate Postgres Password
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔎

# Documentation:
# @raycast.description Generate Postgres Password
# @raycast.author reddiedev
# @raycast.authorURL https://raycast.com/reddiedev
# @raycast.argument1 { "type": "text", "placeholder": "16" }

generate_url_safe_password() {
  local length=$1
  local url_safe_characters='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.~'

  local password=""
  for (( i=0; i<length; i++ )); do
    random_index=$(($RANDOM % ${#url_safe_characters}))
    password="${password}${url_safe_characters:$random_index:1}"
  done

  echo "$password"
}

input=${1// /%20}
password_length=$(( input ))
password=$(generate_url_safe_password $password_length)

echo "$password" | pbcopy
echo "Password copied to clipboard."