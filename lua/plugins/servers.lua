-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        -- rust_analyzer = {
        --   cargo = {
        --     allFeatures = true;
        --   }
        -- },
        clangd = {},
        nil_ls = {},
        tinymist = {},
        bashls = {},
        tsserver = {},
        html = {},
        cssls = {},
        gopls = {},
      },
    },
  },


  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "typst",
        "rust",
        "c",
        "cpp",
        "python",
        "nix",
        "bash",
        "javascript",
        "typescript",
        "html",
        "css",
        "java",
        "go"
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = function (_, opts)
      table.insert(opts.cmd, string.format("--jvm-arg=-javaagent:%s", "/home/tybuu/.config/nvim/lombok.jar"))
    end
  }
}
