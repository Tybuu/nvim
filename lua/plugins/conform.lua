return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "alejandra" },
        rust = { "rustfmt" },
        typst = { "typstyle" },
        verilog = { "verible-verilog-format" },
      },
    },
  },
}
