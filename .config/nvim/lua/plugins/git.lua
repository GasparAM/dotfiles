return {
  {
    "lewis6991/gitsigns.nvim",
    -- config = function ()
    --   vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    --   vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
    -- end
    opts = {
      -- signs = {
      --   add          = { text = 'a' },
      --   change       = { text = 'b' },
      --   delete       = { text = '_' },
      --   topdelete    = { text = '‾' },
      --   changedelete = { text = '~' },
      --   untracked    = { text = '┆' },
      -- },
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {}),
      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
    }
  },
  {
    "tpope/vim-fugitive"
  }
}
