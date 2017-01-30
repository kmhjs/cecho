# cecho

This script appends `--color` / `-c` option for `echo` .

## Usage

1. Source `cecho.zsh` .
2. Use as `cecho --color red "string"` etc.

```
cecho [-c color_name]      [-n] "[string]"
cecho [--color color_name] [-n] "[string]"
```

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
cecho -c red 'a b c d e'
```

Show the result of `ls` with green color.

```
cecho -c green "$(ls)"
```

## Note

"string" part must be given as one string.  
For example, `cecho --color red "$(ls)"` .

## License

This project is distributed under MIT License. See `LICENSE` .
