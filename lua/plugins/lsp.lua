return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    config = function()
        -- Let every language server use blink.cmp's completion capabilities
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        -- Make lua_ls aware of the `vim` global
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        -- Installs these servers via Mason and enables them automatically
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls",
                "html",
                "cssls",
                "jdtls",
            },
        })

        vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
        })

        -- Keymaps that only exist in buffers with an attached language server
        -- (Neovim 0.11 already provides K, grn, gra, grr, gri, [d and ]d)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = function(desc)
                    return { buffer = event.buf, desc = desc }
                end
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts("Show diagnostics"))
            end,
        })
    end,
}
