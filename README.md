# neovim-lsp
*A personal Neovim config lua along with c++ auto completion using clangd, all configured using [lsp](https://github.com/neovim/nvim-lspconfig)*

Took a lot of reference from 
- [Christian Chiarulli](https://github.com/LunarVim/Neovim-from-scratch/tree/master), 
- [craftzdog](https://github.com/craftzdog/dotfiles-public), 
- [tuffgniuz](https://github.com/tuffgniuz/nvim.lua)
<br>

*Theirs repos and youtube videos were really helpful*

# Table of Contents
* [List of plugins](#list-of-plugins)
* [Themes](#themes)
* [Usage](#usage)
* [Keymaps](#auto-completion-keymaps)
* [Screenshots](#screenshots)

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
<!-- - [clangd_extension](https://github.com/p00f/clangd_extensions.nvim) -->
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [impatient](https://github.com/lewis6991/impatient.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim#packer)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [preservevim-tagbar](https://github.com/preservim/tagbar)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [git.nvim](https://github.com/dinhhuy258/git.nvim)
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim)
- [vimwiki](https://github.com/vimwiki/vimwiki)[still testing]
- [neorg](https://github.com/nvim-neorg/neorg)[still testing]
- [project.nvim](https://github.com/ahmedkhalf/project.nvim) [still testing]
- [which-key.nvim](https://github.com/folke/which-key.nvim) [still testing]

# Themes
- [gruvbox-material](https://github.com/sainnhe/gruvbox-material) [active theme]
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
You need to install [ctags](https://ctags.io/)  in order for preservim/tagbar to work. You can find ctags available in official repos of your linux distribution.

### auto-completion keymaps
| Keymaps    | Descriptions               |
|------------|----------------------------|
| \<C-b>     | Up scrolling docs          |
| \<C-f>     | Down scrolling docs        |
| \<C-Space> | complete                   |
| \<C-e>     | abort completion           |
| \<CR>      | confirm completion         |
  \<Tab>     | Down scrolling snippets
  \<Shift-Tab> | Up scrolling snippets

### Lsp keymaps
| Keymaps    | Descriptions              |
|------------|---------------------------|
| gD         | go to definition          |
| K          | buf.hover shows more info |
| [d         | diagnostic jump prev      |
| ]d         | diagnostic jump next      |
| \<space>wa | add workspace folder      |
| \<space>wr | remove workspace folder   |
| \<space>wl | list workspace folder     |
| \<space>f  | formatting                |
| \<space>wl | list workspace folder     |
| \<space>rn | lsp saga rename           |
| \<space>ca | lsp saga code action      |

### comment.nvim

| Keymaps | Descriptions  |
|---------|---------------|
| gcc     | line comment  |
| gb      | block comment |
</br>

# Screenshots

In order to see shortcut keys you can press leader(space key) and a popup will come listing shortcut keys for this setup.
space key is prefix. Check after/plugin/which-key.lua to find its config
![nvim](https://user-images.githubusercontent.com/91145436/232846809-7ac35ef3-a386-402c-993b-c6a998918edb.png)


![2023-03-15-22:48:37-screenshot](https://user-images.githubusercontent.com/91145436/225387972-f66d6f5d-f243-4403-a3fc-1fc84c323641.png)

<mark>Note: *you will need to setup your language servers inside the `lua/user/lsp/lsp.lua` using [lsp](https://github.com/neovim/nvim-lspconfig#quickstart), for the full list of configs check [server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)*</mark>



## file browser
![2023-03-15-22:59:25-screenshot](https://user-images.githubusercontent.com/91145436/225388581-904af102-461d-405e-92a4-965ae51953e5.png)


## dashboard
![2023-03-15-22:59:02-screenshot](https://user-images.githubusercontent.com/91145436/225388503-b539aaee-056b-4a7f-b09f-012a0f0ca9f7.png)



