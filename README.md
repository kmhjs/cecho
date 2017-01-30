# color_echo

This script appends `--color` / `-c` option for `echo` .

## Usage

1. Source `color_echo.zsh` .
2. Use as `color_echo --color red "string"` etc.

```
color_echo [-c color_name]      [-n] "[string]"
color_echo [--color color_name] [-n] "[string]"
```

### (Option) autoload

In your `.zshrc` etc.

1. Add load path to `fpath` as `fpath+=(path/to/color_echo)` .
2. Load with autoload as `autoload -Uz color_echo` .

## Options

Only `-c` or `--color` (long form of `-c` option) additional option for `echo` command is available.  
Following color name could be specified for this option.

* Normal
  * `black`
  * `red`
  * `green`
  * `yellow`
  * `blue`
  * `magenta`
  * `cyan`
  * `white`
* Bold
  * `black_bold`
  * `red_bold`
  * `green_bold`
  * `yellow_bold`
  * `blue_bold`
  * `magenta_bold`
  * `cyan_bold`
  * `white_bold`

## Example

Show `a b c d e` with red color.

```
color_echo -c red 'a b c d e'
```

Show the result of `ls` with green color.

```
color_echo -c green "$(ls)"
```

## Note

"string" part must be given as one string.  
For example, `color_echo --color red "$(ls)"` .

## License

This project is distributed under MIT License. See `LICENSE` .
