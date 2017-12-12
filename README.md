
A collection of configuration files for `$HOME`.
These files can be copied into your `~` directory, or you can use install script below.

## Installation

Install script is using [homeshick](https://github.com/andsens/homeshick) to symlink the files.

One-liner (no repo clone necessary; all steps are in the shell script)

```sh
    curl -s -L 'https://git.io/install.files' | bash
```

Scripts access the following env variables if you want to override defaults:
 * `DOT_FILES_REPO` [default is this repository; in case you want to clone other repos]
 * `DOT_FILES_CASTLE_BRANCH` [branch to checkout from the repo; default is "master"]
 * `DOT_FILES_CASTLE_NAME` [castle name for homeshick-generated repo; default is "main.files"]

 There are many other approaches to manage config files. If you want to know why I use homeshick, [go here](https://github.com/antontsv/engineering/blob/master/dotfiles.md).

## .extra references

This repository does not provide complete setup as some of the configurations
are sourced from other repositories, thus you can see lots of `*.extra` files
within this repo. All extra files are supposed to carry your custom settings
that are not shared publicly.

## Screenshots
* Bash command line / Tmux session
![command-line](https://cloud.githubusercontent.com/assets/2007057/19623671/c0aa27a6-9887-11e6-95c5-a23766c75b71.png)

## Comprehensive setup

Note: It is recommended to do a backup first.

For a complete setup checkout this gist:

```sh
    curl -s -L 'https://git.io/all.files' | bash
```

Gist that does all.files setup including your local/private repo:
```sh
    curl -s -L 'https://git.io/private.files' | bash
```

Skeptical about curl? Check out [this small utility](https://github.com/antontsv/url-shell#example) with built-in PGP verification

This command will install:
 * this dotfile repo
 * install homeshick to manage .files [with refresh every two days]
 * [awesome-bash](https://github.com/antontsv/awesome-shell) and various  [CLI scripts](https://github.com/antontsv/home.bin) in ~/bin
 * install Mac-specific [dotfiles](https://github.com/antontsv/apple.bin), scripts and [settings](https://github.com/antontsv/apple.bin/blob/master/.misc/macos_settings) if run on Mac OS

