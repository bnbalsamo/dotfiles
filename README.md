This repository consists of my own common dotfiles for a couple of configurations/programs. It is meant to be used in combination with gnu stow in order to quickly roll some common configurations onto different machines/environments

In order to pull:
```bash
$ # From $HOME
$ git clone --recursive https://github.com/bnbalsamo/dotfiles.git
```

To update submodules:
```bash
$ # From $HOME/dotfiles
$ git submodule update --recursive
```

Back up/delete any conflicts, if a fresh system has files in place already

The stow dry run command will produce errors if files would conflict:

```bash
$ # From the dotfiles dir
$ for x in */; do stow -n $x; done
```

Stow makes symlinking everything easy:
```bash
$ # From the dotfiles dir
$ for x in */; do stow $x; done
```


To reload any changes to the dotfiles repo 
```bash
$ # From the dotfiles dir
$ for x in */; do stow -R $x; done
```


Software gotchas

- The xinit assumes thunar, redshift, and nm-applet are installed. If they're not it shouldn't break anything. It also assumes the use of i3.
- The awesome rc.lua uses my own pyunch utility as a launcher. There's a line for dmenu right above it. Swap which line is commented (and install dmenu) to use it instead.
