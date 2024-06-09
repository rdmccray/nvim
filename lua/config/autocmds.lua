vim.api.nvim_create_autocmd("TextYankPost", {
    -- group = "test",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 300 })
    end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--     pattern = "*",
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client.server_capabilities.completionProvider then
--             vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
--         end
--         if client.server_capabilities.definitionProvider then
--             vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
--         end
--     end,
-- })

-- was thinking I might have to destroy the keymaps in LspAttach
-- vim.api.nvim_create_autocmd("LspDetach", {
--     pattern = "*",
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         -- Do something with the client
--         vim.cmd("setlocal tagfunc< omnifunc<")
--     end,
-- })
