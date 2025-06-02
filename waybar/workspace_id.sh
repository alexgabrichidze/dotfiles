#!/bin/bash
while true; do
  id=$(hyprctl activeworkspace -j | jq -r '.id')
  echo "$id"
  sleep 0.2
done
