# neovim-lsp
*A personal Neovim config lua along with c++ auto completion using clangd, all configured using [lsp](https://github.com/neovim/nvim-lspconfig)*

Took a lot of reference from 
- [Christian Chiarulli](https://github.com/LunarVim/Neovim-from-scratch/tree/master), 
- [craftzdog](https://github.com/craftzdog/dotfiles-public), 
- [tuffgniuz](https://github.com/tuffgniuz/nvim.lua)
<br>

*Theirs repos and youtube videos were really helpful*

## List of plugins
- [autopairs](https://github.com/windwp/nvim-autopairs)
- [lua-plenary](https://github.com/nvim-lua/plenary.nvim)
- [nvim-dev-icons](https://github.com/nvim-tree/nvim-web-devicons)
- [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [lsp-saga](https://github.com/glepnir/lspsaga.nvim)
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [akinsho-bufferline](https://github.com/akinsho/bufferline.nvim)
- [akinsho-toggleterm](https://github.com/akinsho/toggleterm.nvim)
- [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [numToStr-comment](https://github.com/numToStr/Comment.nvim)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-cursorline](https://github.com/yamatsum/nvim-cursorline)
- [clangd_extension](https://github.com/p00f/clangd_extensions.nvim)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [impatient](https://github.com/lewis6991/impatient.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim#packer)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-surround](https://github.com/kylechui/nvim-surround)

# Themes
- [gruvbox-material](https://github.com/sainnhe/gruvbox-material)
- [tokyonight](https://github.com/folke/tokyonight.nvim)
- [onedark](https://github.com/navarasu/onedark.nvim)

## Usage

 - Create a new directory inside `.config/` folder named as `nvim` ( `mkdir .config/nvim`)<br>
 - or you could just clone this repo inside `.config/` directory and change the name of current from `neovim-lsp/` to `nvim/` then place it inside `.config/`
``` bash
git clone https://github.com/Appyouz/neovim-lsp.git 
``` 
 - open `plugins.lua` file located inside `nv lua/user/plugins.lua`
 
<mark>Note: You will be presented with bunch of errors, just dont freak out everything will be fine once plugins are installed.
Neovim is trying to load the configuaration files located inside `after/plugin/`.</mark>

- once plugins are installed, close the file and reopen again 
``` bash
:wq
``` 
- on oepening neovim again, [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 will begin to load and compile just wait for it. it might show some errors dont worry it will work after reloading.
 (those errors do not seem to get in the way)

Now you can install your required language-servers using [`Mason`](https://github.com/williamboman/mason.nvim#configuration)
``` bash
:Mason
```
![2022-10-17-18:08:44-screenshot](https://user-images.githubusercontent.com/91145436/196191839-21fe6e7f-dfae-4b41-946b-77455f040321.png)


<mark>Note: *you will need to setup your language servers inside the `lua/user/lsp/lsp.lua` using [lsp](https://github.com/neovim/nvim-lspconfig#quickstart), for the full list of configs check [server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)*</mark>

