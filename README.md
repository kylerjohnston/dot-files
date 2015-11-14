# README

This is a collection of dot files for zsh (zprezto), vim, and tmux. Probably only relevant to me.

## Installation

### Dependencies

You'll need to install this stuff first:

* `vim`, `tmux`, and `zsh`, obviously.
* [Vundle](https://github.com/VundleVim/Vundle.vim) for `vim`. After installing open vim and run `:PluginInstall` to install everything else in the vimrc.
* For `zsh` you will need to install [Prezto](https://github.com/sorin-ionescu/prezto). I only include a zpreztorc file here because the only thing I really change in the zshrc is the PATH, and what I put there depends on which machine I'm using.
* For `tmux` you need to install the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) and then run `$ tmux source ~/.tmux.conf`.

### Installation
To install, clone the repo to your home directory and run the bash script `make.sh`:

```
$ ./make.sh
```

This will move your current dot files to `~/dot-files/old/` and create symlinks to the new dot-files in your home directory.
