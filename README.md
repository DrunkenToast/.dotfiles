# Dotfiles

```
 ██████████             █████       ██████   ███  ████                  
░░███░░░░███           ░░███       ███░░███ ░░░  ░░███                  
 ░███   ░░███  ██████  ███████    ░███ ░░░  ████  ░███   ██████   █████ 
 ░███    ░███ ███░░███░░░███░    ███████   ░░███  ░███  ███░░███ ███░░  
 ░███    ░███░███ ░███  ░███    ░░░███░     ░███  ░███ ░███████ ░░█████ 
 ░███    ███ ░███ ░███  ░███ ███  ░███      ░███  ░███ ░███░░░   ░░░░███
 ██████████  ░░██████   ░░█████   █████     █████ █████░░██████  ██████ 
░░░░░░░░░░    ░░░░░░     ░░░░░   ░░░░░     ░░░░░ ░░░░░  ░░░░░░  ░░░░░░  
```

## Deploy dotfiles

### Clone repo

```
cd ~
git clone https://github.com/DrunkenToast/.dotfiles.git
```

### Stowing

- `stow */` all packages
- `stow neovim` only neovim

### Stow conflicts

This error might appear if a file from a package already exists:
```
WARNING! stowing bar would cause conflicts:
  * existing target is neither a link nor a directory: foo
```
E.g.: .bashrc from bash already exists in home dir.

A solution* to this is:

```
stow --adopt bar
git restore .
```

*`--adopt` will **overwrite** the current file in the dotfiles as a package.  
Hence git restore is used to restore the contents.

Another solution is to just remove the conflicting files and then stowing.

