local lspconfig = vim.lsp.config
local util = require("lspconfig.util")

-- Configure LSP servers (only setup + configuration lives in this file)
local servers = {
  marksman = {},
  html = {},
  cssls = {},
  pyright = {},
  jsonls = {},
  ts_ls = {},
  gopls = {},
  dockerls = {},
  helm_ls = {},
  yamlls = {},

  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
      },
    },
  },

  rust_analyzer = {
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
      ["rust-analyzer"] = {
        diagnostics = { enable = false },
      },
    },
  },

  bashls = {
    filetypes = { "sh" },
    settings = {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.command)",
      },
    },
  },
}

local function configure_and_enable(server, opts)
  if type(vim.lsp.config) == "function" then
    vim.lsp.config(server, opts or {})
  else
    vim.lsp.config[server] = vim.tbl_deep_extend("force", vim.lsp.config[server] or {}, opts or {})
  end

  if type(vim.lsp.enable) == "function" then
    vim.lsp.enable(server)
  end
end

for server, opts in pairs(servers) do
  configure_and_enable(server, opts)
end
