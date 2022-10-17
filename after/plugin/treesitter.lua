local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = "all",
  ensure_installed = { "c", "lua", "cpp", "javascript","typescript" },
  sync_install = false,
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false,
  },

  autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
}

