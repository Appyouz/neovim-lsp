local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
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
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("windwp/nvim-autopairs") -- An autopair
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("nvim-telescope/telescope.nvim") -- fzf file viewer
	use("nvim-telescope/telescope-file-browser.nvim") -- file browser
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("norcalli/nvim-colorizer.lua") -- highlights the hexa value according to thier colors
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use("akinsho/toggleterm.nvim") -- terminal
	use("nvim-lualine/lualine.nvim") -- status line/bar
	use("lewis6991/gitsigns.nvim") -- git signs for editing or any changes
	use("numToStr/Comment.nvim") -- comment
	use("JoosepAlviste/nvim-ts-context-commentstring") -- jsx commenting
	use("yamatsum/nvim-cursorline")
	use("lukas-reineke/indent-blankline.nvim")

	use("RRethy/vim-illuminate")
	use("lewis6991/impatient.nvim")
	use("onsails/lspkind.nvim")

	-- Themes
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	use("morhetz/gruvbox")
	use("sainnhe/gruvbox-material")
	use("tanvirtin/monokai.nvim")

	-- Language servers
	use({ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" })

	-- Auto complete
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- for syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})

	use("ahmedkhalf/project.nvim")
	use("dinhhuy258/git.nvim") -- For git blame & browse
	use("folke/lsp-colors.nvim")
	use("folke/zen-mode.nvim")
	use("preservim/tagbar")
	use({
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
					["core.norg.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
				},
			})
		end,
		-- run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	})
	use("lervag/vimtex")
	use({
		"vimwiki/vimwiki",
		config = function()
			vim.g.vimwiki_list = {
				{
					path = "~/vimwiki",
					syntax = "markdown",
					ext = ".md",
				},
			}

			vim.g.vimwiki_ext2syntax = {
				[".md"] = "markdown",
				[".markdown"] = "markdown",
				[".mdown"] = "markdown",
			}
			vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki
		end,
	})
  -- Lua
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
	-- use "p00f/clangd_extensions.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
