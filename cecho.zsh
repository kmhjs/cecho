#
# echo + color
#
# - Abstract:
#    This script appends --color/-c option for echo.
#
# - Usage:
#    cecho [-c color_name]      [-n] "[string]"
#    cecho [--color color_name] [-n] "[string]"
#
# - Note:
#    "string" part must be given as one string.
#    For example, `cecho --color red "$(ls)"` .
#
# - Info:
#    Available color names:
#        black, red, green, yellow, blue, magenta, cyan, white
#        black_bold_bold, red_bold, green_bold, yellow_bold, blue_bold, magenta_bold, cyan_bold, white_bold
#
function cecho()
{
  local -a args=($*)

  #
  # Analyze option
  #
  local -i short_color_option_index=${args[(I)-c]}
  local -i long_color_option_index=${args[(I)--color]}

  if (( ${short_color_option_index} * ${long_color_option_index} != 0 ))
  then
    echo 'Invalid argument was given. Cannot use -c and --color simultaneously.' 1>&2
    return 1
  fi

  #
  # If no special args was given, call normal echo
  #
  local -i color_option_index=$(( ${short_color_option_index} + ${long_color_option_index} ))
  if (( ${color_option_index} == 0 ))
  then
    echo $*
    return $?
  fi

  local color_index=$((${color_option_index} + 1))
  local color_value=${args[${color_index}]}

  local -A color_dictionary=(
    black   '\e[0;30m'
    red     '\e[0;31m'
    green   '\e[0;32m'
    yellow  '\e[0;33m'
    blue    '\e[0;34m'
    magenta '\e[0;35m'
    cyan    '\e[0;36m'
    white   '\e[0;37m'

    black_bold   '\e[1;30m'
    red_bold     '\e[1;31m'
    green_bold   '\e[1;32m'
    yellow_bold  '\e[1;33m'
    blue_bold    '\e[1;34m'
    magenta_bold '\e[1;35m'
    cyan_bold    '\e[1;36m'
    white_bold   '\e[1;37m'

    reset '\e[0m'
  )

  #
  # Validate the existence of given color name
  #
  if [[ -z ${color_dictionary[(I)${color_value}]} ]]
  then
    echo 'Invalid color value was given.' 1>&2
    return 1
  fi

  #
  # Remove color option and color value index element
  #
  args[${color_option_index}]=()
  args[${color_option_index}]=()

  #
  # Pick up output taget string
  #
  local output_target=${args[-1]}
  args[-1]=() # Now args contains only options

  #
  # Make options array for echo
  #
  local -a options=(${args})

  #
  # Show the result
  #
  local specified_color=${color_dictionary[${color_value}]}
  local reset_color=${color_dictionary[reset]}
  echo -e ${options} "${specified_color}${output_target}${reset_color}"
}
