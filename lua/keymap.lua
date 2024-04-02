local vim = vim
-- keymap
-- insert mode move
local options = {
    silent = true,
    noremap = true
}
vim.keymap.set('i', '<C-p>', '<Up>', options)
vim.keymap.set('i', '<C-n>', '<Down>', options)
vim.keymap.set('i', '<C-b>', '<Left>', options)
vim.keymap.set('i', '<C-f>', '<Right>', options)
vim.keymap.set('i', '<C-a>', '<Esc>^i', options)
vim.keymap.set('i', '<C-e>', '<End>', options)
vim.keymap.set('i', '<C-;>', '<End>;', options)
vim.keymap.set('i', '<C-cr>', '<End>;<cr>', options)

-- quit & save
local options = { noremap = true }
vim.keymap.set('n', '<leader>qq', ':q<cr>', options)
vim.keymap.set('n', '<leader>qs', ':wqa<cr>', options)
vim.keymap.set('n', '<leader>fS', ':wa<cr>', options)
vim.keymap.set('n', '<leader>fs', ':w<cr>', options)

-- telescope
local options = { noremap = true }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, options)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, options)
vim.keymap.set('n', '<leader>fb', builtin.buffers, options)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, options)
vim.keymap.set('n', '<leader>fm', builtin.lsp_document_symbols, options)
vim.keymap.set('n', '<leader>fk', builtin.current_buffer_fuzzy_find, options)

