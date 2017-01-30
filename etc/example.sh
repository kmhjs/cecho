#! /usr/bin/env zsh -f

typeset script_path=$(dirname $0)
source "${script_path}/../color_echo.zsh"

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
  color_echo -n -c ${color} "■"
  echo -n ']'
done

echo ''

# Normal
foreach color (${color_tokens})
do
  printf "%15s > " ${color}
  color_echo -c ${color} "${color}"
done
