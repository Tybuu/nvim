return {
  {
    {
      "kiyoon/jupynium.nvim",
      config = function()
        vim.api.nvim_create_user_command("ListFiles", function()
          local servername = vim.fn.eval("v:servername")
          vim.fn.jobstart(string.format("jupynium --nvim_listen_addr %s", servername), { detach = true })
        end, {})
      end,
    },
  },
}
