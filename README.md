# .files [@antontsv's dotfiles]

A collection of configuration files for `$HOME`.
These files can be copied into your `~` directory, or you can use install script below.

## Installation

Install script is using [homeshick](https://github.com/andsens/homeshick) to symlink the files.

One-liner (no repo clone necessary; all steps are in the shell script)

```sh
    curl -L 'https://git.io/install.files' | bash
```

Scripts access the following env variables if you want to override defaults:
 * `DOT_FILES_REPO` [default is this repository; in case you want to clone other repos]
 * `DOT_FILES_CASTLE_BRANCH` [branch to checkout from the repo; default is "master"]
 * `DOT_FILES_CASTLE_NAME` [castle name for homeshick-generated repo; default is "main.files"]

## .extra references

This repository does not provide complete setup as some of the configurations
are sourced from other repositories, thus you can see lots of `*.extra` files
within this repo. All extra files are supposed to carry your custom settings
that are not shared publicly.

## Comprehensive setup

For a complete setup checkout this gist:

```sh
    curl -L 'https://git.io/all.files' | bash
```
