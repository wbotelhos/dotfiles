# Dotfiles

[![Sponsor](https://img.shields.io/badge/sponsor-%3C3-green)](https://www.patreon.com/wbotelhos)

My personal settings including MacOSX Tweak.

## Usage

### Setup

```sh
git clone git@github.com:wbotelhos/dotfiles.git
```

### Optimize MacOSX

```sh
./dotfiles/apm.sh
```

### Install Atom Plugins

```sh
./dotfiles/apm.sh
```

### Run My Personal Config

```sh
./dotfiles/install.sh
```

### Use Rubocop Config

Put it on the top of your `.rubocop.yml`:

```yml
inherit_from:
  - https://raw.githubusercontent.com/wbotelhos/dotfiles/master/.rubocop.yml
```
