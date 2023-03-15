local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Use a protected call so we don't error out on first use
-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use 'windwp/nvim-autopairs' -- An autopair
  use "nvim-lua/plenary.nvim"
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim' -- fzf file viewer
  use 'nvim-telescope/telescope-file-browser.nvim' -- file browser
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'norcalli/nvim-colorizer.lua' -- highlights the hexa value according to thier colors
  use 'akinsho/nvim-bufferline.lua' -- tabs
  use "akinsho/toggleterm.nvim" -- terminal
  use 'nvim-lualine/lualine.nvim' -- status line/bar
  use 'lewis6991/gitsigns.nvim' -- git signs for editing or any changes
  use 'numToStr/Comment.nvim' -- comment
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- jsx commenting
  use 'yamatsum/nvim-cursorline'
  use 'lukas-reineke/indent-blankline.nvim'

  -- use 'p00f/clangd_extensions.nvim'
  use 'RRethy/vim-illuminate'
  use 'lewis6991/impatient.nvim'
  use 'onsails/lspkind.nvim'
  -- Themes
  use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use 'morhetz/gruvbox'
  use "sainnhe/gruvbox-material"
  use 'tanvirtin/monokai.nvim'

  -- Language servers and Auto complete
  use "neovim/nvim-lspconfig" --Lsp servers
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lua"


  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use



  -- For installing language servers
  use { "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }

  -- for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }


  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end
  })

use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}
use "ahmedkhalf/project.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
