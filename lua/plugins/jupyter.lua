return {
  {
    {
      "kiyoon/jupynium.nvim",
      config = function()
        require("jupynium").setup({
          use_default_keybindings = false,
          textobjects = {
            use_default_keybindings = false,
          },
        })
        vim.api.nvim_create_user_command("JupyStart", function()
          local servername = vim.fn.eval("v:servername")
          vim.fn.jobstart(string.format("jupynium --nvim_listen_addr %s", servername), { detach = true })
        end, {})

        vim.keymap.set({ "n", "x" }, "<space>ji", "<cmd>JupyStart<CR>", { desc = "Starts Juypter Server" })
        vim.keymap.set({ "n", "x" }, "<space>jS", "<cmd>JupyniumStartSync<CR>", { desc = "Sync to Jupyter" })
        vim.keymap.set(
          { "n", "x" },
          "<space>je",
          "<cmd>JupyniumExecuteSelectedCells<CR>",
          { desc = "Jupynium execute selected cells" }
        )
        vim.keymap.set(
          { "n", "x" },
          "<space>jc",
          "<cmd>JupyniumClearSelectedCellsOutputs<CR>",
          { desc = "Jupynium clear selected cells" }
        )
        vim.keymap.set(
          { "n" },
          "<space>jk",
          "<cmd>JupyniumKernelHover<cr>",
          { desc = "Jupynium hover (inspect a variable)" }
        )
        vim.keymap.set({ "n", "x" }, "<space>js", "<cmd>JupyniumScrollToCell<cr>", { desc = "Jupynium scroll to cell" })
        vim.keymap.set(
          { "n", "x" },
          "<space>jo",
          "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>",
          { desc = "Jupynium toggle selected cell output scroll" }
        )
      end,
    },
  },
}
