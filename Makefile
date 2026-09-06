# ~/dotfiles - GNU Stow package manager
#
#   make            symlink every package into $HOME
#   make delete     remove those symlinks
#   make restow     unlink then relink (run after adding files to a package)
#   make check      dry run: print what stow would do, change nothing
#   make <name>     stow a single package, e.g. `make nvim`
#   make bootstrap  run the machine-setup wizard (installs + config dirs)
#
# Needs `stow` on PATH. On a fresh machine run `make bootstrap` first.

PACKAGES := zsh kitty tmux nvim eza
STOW     := stow --dir $(CURDIR) --target $(HOME) --verbose

.DEFAULT_GOAL := install
.PHONY: install delete restow check bootstrap $(PACKAGES)

install:
	$(STOW) $(PACKAGES)

delete:
	$(STOW) --delete $(PACKAGES)

restow:
	$(STOW) --restow $(PACKAGES)

check:
	$(STOW) --no $(PACKAGES)

bootstrap:
	./bootstrap.sh

$(PACKAGES):
	$(STOW) $@
