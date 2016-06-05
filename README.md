# rails-i18n-vim

Some vim helpers for working with i18n and rails. Its under development.

Currently only `:GoToTranslation` is supported. If your currsor is on a `I18n.t()` call you can use `:GoToTranslation` to jump to locale file(you can enter) on the position to the key.

## Requirements

This plugin is written in ruby so Vim has to be compiled with `+ruby`.

## Installation

Use your plugin manager of choice.

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/sbruhns/rails-i18n-vim ~/.vim/bundle/rails-i18n-vim`
- [Vundle](https://github.com/gmarik/vundle)
  - Add `Bundle 'https://github.com/sbruhns/rails-i18n-vim'` to .vimrc
  - Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - Add `NeoBundle 'https://github.com/sbruhns/rails-i18n-vim'` to .vimrc
  - Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - Add `Plug 'https://github.com/sbruhns/rails-i18n-vim'` to .vimrc
  - Run `:PlugInstall`

## Contributing

Contributions are welcome via Github pull requests. 
