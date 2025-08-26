return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                                                                           -- Pin to GitHub releases
    cmd = { "RemoteCleanup", "RemoteStart", "RemoteStop", "RemoteInfo", "RemoteConfigDel", "RemoteLog" }, -- Lazy load on commands
    dependencies = {
      "nvim-lua/plenary.nvim",                                                               -- For standard functions
      "MunifTanjim/nui.nvim",                                                                -- To build the plugin UI
      "nvim-telescope/telescope.nvim",                                                       -- For picking b/w different remote methods
    },
    config = true,
    opts = {
      remote = {
        copy_dirs = {
          config = {
            compression = {
              enabled = true,
              additional_opts = { "--exclude-vcs" },
            },
          },
        },
      },
    },
  }
}
