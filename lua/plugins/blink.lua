return {
	{
    "saghen/blink.cmp",
    optional = false,
		lazy = true,
		version = '1.*',
		event = "InsertEnter",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      completion = {
        keyword = {
          range = "full",
        },
      },
      keymap = {
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()

            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        --["<Up>"] = { "select_prev", "fallback" },
        --["<Down>"] = { "select_next", "fallback" },
      },
    },
  }
}
