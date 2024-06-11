-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    -- group = "test",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 300 })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("mccray-lsp-attach", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.supports_method("textDocument/completion") then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.supports_method("textDocument/definition") then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end
        vim.keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = args.buf })
        vim.keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { buffer = args.buf })
        vim.keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { buffer = args.buf })
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.keymap.set(
                "n",
                "<leader>th",
                "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
                { buffer = args.buf }
            )
        end
    end,
})

-- vim.api.nvim_create_autocmd("LspDetach", {
--     group = vim.api.nvim_create_augroup("mccray-lsp-detach", { clear = true }),
--     callback = function(args)
--         vim.lsp.buf.clear_references()
--         vim.api.nvim_clear_autocmds({ group = "mccray-lsp-attach", buffer = args.buf })
--     end,
-- })
