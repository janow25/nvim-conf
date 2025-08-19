local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

-- List of servers to setup with default options
local servers = {
  "marksman",
  "html",
  "cssls",
  "pyright",
  "jsonls",
  "ts_ls",
  "gopls",
  "dockerls",
  "helm_ls",
  "yamlls",
  "bashls",
  "rust_analyzer",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {}
end

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- Rust Analyzer with root_dir and settings
lspconfig.rust_analyzer.setup {
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      diagnostics = { enable = false },
    },
  },
}

-- Bash with filetypes and settings
lspconfig.bashls.setup {
  filetypes = { "sh" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
    },
  },
}

-- Custom Intersystems LSP registration
local configs = require "lspconfig.configs"
if not configs.intersystems_ls then
  configs.intersystems_ls = {
    default_config = {
      cmd = { "/home/jno/linux-x86_64/intersystems-ls" },
      filetypes = { "objectscript", "objectscript_class" },
      root_dir = function(fname)
        return util.root_pattern "*.cls"(fname) or util.find_git_ancestor(fname)
      end,
      settings = {
        objectscript = {
          conn = {
            active = true,
            host = "mymhs.maerz-network/mhs",
            ns = "MHSLIB",
            superPort = 443,
            username = "_system",
            password = "sys",
          },
        },
      },
    },
  }
end

lspconfig.intersystems_ls.setup {}
