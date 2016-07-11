# .files [AntonTsv's dotfiles]

A collection of configuration files for `$HOME`.
These files can be copied into your `~` directory, or you can use install script below.

## Installation

Install script is using [homeshick](https://github.com/andsens/homeshick) to symlink the files.

One-liner (no repo clone necessary; all steps are in the shell script)

```sh
    curl 'https://gist.githubusercontent.com/antontsv/1167f4a1128b505e9ee1740947491580/raw/9ec34bd8e4083c1005bf15e3e2d4d02acf6d56d3/homeshick.files' | bash
```

or if you have already cloned this repo, run this inside the repo:

```sh
    git show install.bash^{blob} | bash
```

## .extra references

This repository does not provide complete setup as some of the configurations
are sourced from other repositories, thus you can see lots of `*.extra` files
within this repo. All extra files are supposed to carry your custom settings
that are not shared publicly.
