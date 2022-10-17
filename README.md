# neovim-lsp
*A personal Neovim config along with c++ auto completion using clangd*

## Usage

 - Create a new directory inside `.config` folder named as `nvim` ( `mkdir .config/nvim`)<br>
 - or you could just clone this repo inside `.config` directory and change the name of current from `neovim-lsp` to `nvim` then place it inside `.config`
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
- on oepening the neovim again, [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
 will begin to load and compile just wait for it. it might show some errors dont worry it will work after reloading.
 (those errors do not seem to get in the way)

Now you can install your required language-servers using [`Mason`](https://github.com/williamboman/mason.nvim#configuration)
``` bash
:Mason
```
![Mason](image.jpg)

you will need to setup your language servers inside the `lua/user/lsp/lsp.lua` using [lsp](https://github.com/neovim/nvim-lspconfig#quickstart)
or the full list of configs check [server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

