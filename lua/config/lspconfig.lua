local vim = vim
local lspconfig = require('lspconfig')
local diagnostics = {
  virtual_text = false,
  virtual_improved = {
    current_line = 'only',
  },
}
vim.diagnostic.config(diagnostics)

local servers = { 'rust_analyzer', 'clangd', 'lua_ls' }
local on_attach = function(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = desc }
    end
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts "跳转到声明")
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts "跳转到定义")
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts "显示签名信息")
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts "跳转到实现")
    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts "签名帮助")
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts "保存所有")
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts "移除工作空间")
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "列出工作空间的文件夹")
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts "显示类型定义")
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts "重命名")
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts "")
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts "查找引用")
    vim.keymap.set('n', ',,', function()
        vim.lsp.buf.format { async = true }
    end, opts "格式化代码")
    vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, opts "上一个错误/警告")
    vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, opts "下一个错误/警告")
end
local on_init = function(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = on_init
    }
end
