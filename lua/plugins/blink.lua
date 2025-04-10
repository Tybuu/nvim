return {
  -- add blink.compat
  {
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      -- add source
      { "kiyoon/jupynium.nvim" },
    },
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "jupynium" },
        providers = {
          jupynium = {
            name = "jupynium",
            module = "blink.compat.source",
            score_offset = 1000, -- show at a higher priority than lsp
          },
        },
      },
    },
  },
}
