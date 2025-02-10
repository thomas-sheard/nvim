require('mason').setup()
require('mason-lspconfig').setup()

-- setup all installed language servers

local lspconfig = require('lspconfig')

-- we need this for the html lsp. attention seeker.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

lspconfig.rust_analyzer.setup {}

lspconfig.html.setup {
  capabilities = capabilities
}

lspconfig.texlab.setup {}

lspconfig.r_language_server.setup {}



-- generic mason-lspconfig auto-setup from :h mason-lspconfig-automatic-server-setup

--require("mason-lspconfig").setup_handlers {
--  -- a generic server handler that will handle any unassigned server
--  function (server_name) -- default handler (optional)
--    require("lspconfig")[server_name].setup {}
--  end,
--  -- now we can provide a dedicated handler for specific servers.
----  ["rust_analyzer"] = function ()
----    -- extra config in here
----  end
--}
