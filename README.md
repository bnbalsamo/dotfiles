This repository consists of my own common dotfiles for a couple of configurations/programs. It is meant to be used in combination with gnu stow in order to quickly roll some common configurations onto different machines/environments

In order to pull:
```
git clone --recursive https://github.com/bnbalsamo/dotfiles.git
```

Various requirements/tweaks:

Stow makes symlinking everything easy:
```bash
for x in dotfiles/*; do stow $x; done
```

Back up/delete any conflicts, if a fresh system has files in place already

To reload any changes to the file structure (made in the dotfiles dir)
```bash
for x in dotfiles/*; do stow -R $x; done
```


Software gotchas

- The xinit assumes thunar and redshift are installed. If they're not it shouldn't break anything. It also assumes the use of awesome.
- The awesome rc.lua uses my own pyunch utility as a launcher. There's a line for dmenu right above it. Swap which line is commented (and install dmenu) to use it instead.
