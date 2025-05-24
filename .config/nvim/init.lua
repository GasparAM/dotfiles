-- Default settings
require("config.lazy")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")    
vim.cmd("set number")
vim.cmd("set tgc")
vim.cmd("set cul")
vim.cmd("colorscheme lunaperche")
 
-- Telescope + mappings
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Treesitter mappings
-- local configs = require("nvim-treesitter.configs")
-- configs.setup({
--   ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "bash", "yaml", "gitcommit", "hcl", "json", "python" },
--   sync_install = false,
--   highlight = { enable = true },
--   indent = { enable = true },  
-- })
