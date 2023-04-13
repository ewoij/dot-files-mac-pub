require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").pyright.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").sumneko_lua.setup{}
require("lspconfig").dockerls.setup{}


vim.diagnostic.config({
    virtual_text = false,
    signs = false,
})

vim.keymap.set('n', 'gd',         '<Cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr',         '<Cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<space>e',   '<Cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'K',          '<Cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')

