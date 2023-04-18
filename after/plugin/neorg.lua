local status_ok, neorg= pcall(require, "neorg")
if not status_ok then
	return
end
neorg.setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                            notes = "~/notes",
                }
            }
        }
    }
}
