return {

  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
    keys = {
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (root)" },
    },
  },
  {
    "LunarVim/bigfile.nvim",
  },
}
