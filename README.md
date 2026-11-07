# dotfiles

Configs managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level folder is a package symlinked into `~`.

## New machine

```sh
git clone https://github.com/Dulain-Willis/dotfiles ~/dotfiles
cd ~/dotfiles
make bootstrap   # install tools (interactive)
make             # symlink configs
```

`make bootstrap` installs (anything already installed is skipped):

- stow
- zsh
- tmux (+ oh-my-tmux)
- neovim (+ LazyVim deps)
- kitty
- eza
- starship
- yazi
- ComicShannsMono Nerd Font

## Day to day

```sh
make check       # dry run
make restow      # relink (after adding files)
make delete      # remove symlinks
make nvim        # stow one package
```

## Machine-specific zsh

Put anything that shouldn't be shared (e.g. work-only aliases) in `~/.zshrc.local`. It's sourced by `.zshrc` and not tracked.
