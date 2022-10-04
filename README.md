# Dotfiles

[![Sponsor](https://img.shields.io/badge/sponsor-%3C3-green)](https://github.com/sponsors/wbotelhos)

My personal settings including MacOSX Tweak.

## Usage

### Setup

```sh
git clone git@github.com:wbotelhos/dotfiles.git
```

### Optimize MacOSX

```sh
./dotfiles/macosx.sh
```

### Install configs

```sh
./dotfiles/install.sh
```

### Use Rubocop Config

Put it on the top of your `.rubocop.yml`:

```yml
inherit_from:
  - https://raw.githubusercontent.com/wbotelhos/dotfiles/master/.rubocop.yml
```
