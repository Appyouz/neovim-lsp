local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')


local cwd = vim.loop.cwd
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
end

-- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local lsp_flags = {
  debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  root_dir = cwd,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  root_dir = cwd,
}
require('lspconfig')['sumneko_lua'].setup{
    on_attach = on_attach,
    flags = lsp_flags,  
    root_dir = cwd,
}


require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
--    root_dir =  root_files,
     root_dir = cwd,
     single_file_support = true,
--      commands = default capabilities, with offsetEncoding utf-8,
    -- Server-specific settings...
}

require('lspconfig')['emmet_ls'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
}

require('lspconfig')['html'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
}
