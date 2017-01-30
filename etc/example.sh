#! /usr/bin/env zsh -f

source './cecho.zsh'

typeset -a color_tokens=(
  black
  red
  green
  yellow
  blue
  magenta
  cyan
  white
  black_bold
  red_bold
  green_bold
  yellow_bold
  blue_bold
  magenta_bold
  cyan_bold
  white_bold
)

# No line break
foreach color (${color_tokens})
do
  echo -n '['
  cecho -n -c ${color} "■"
  echo -n ']'
done

echo ''

# Normal
foreach color (${color_tokens})
do
  printf "%15s > " ${color}
  cecho -c ${color} "${color}"
done
