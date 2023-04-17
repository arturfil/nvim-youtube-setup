local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

local keymap = vim.keymap
local on_attach = function(client, buffnr)
local opts = { noremap = true, silent = true, buffer = bufnr }

keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap.set("n", "K", "<leader>LSoutlineToggle<CR>", opts)

if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
end

end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

typescript.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach
    }
})

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.rust_analyzer.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach
    }
})
