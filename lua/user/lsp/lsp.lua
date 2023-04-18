local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

-- local cwd = vim.loop.cwd

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts) -- jump to previous diagnostic in buffer
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts) -- jump to next diagnostic in buffer
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require("lspconfig")["pyright"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
})
require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
})



require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
})

require("lspconfig")["clangd"].setup({
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  root_dir = nvim_lsp.util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  -- init_option = { fallbackFlags = {  "-std=c++2a"  } }

})
require("lspconfig")["emmet_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

require("lspconfig")["html"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

require("lspconfig")["marksman"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
  single_file_support = true,
  flags = lsp_flags,
})

require("lspconfig")["cmake"].setup {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  init_option = { buildDirectory = "build" },
  root_dir = nvim_lsp.util.root_pattern('CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake'),
  single_file_support = true
}
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    source = "always", -- Or "if_many"
    focusable = false,
    style = "minimal",
    border = "rounded",
    header = "",
    prefix = "",
  },
})
