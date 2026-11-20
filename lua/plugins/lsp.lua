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

        -- jdtls needs JDK 25 to run. If one is installed in the usual Windows
        -- location, use it for jdtls only; your projects can keep their own JDK.
        local jdk25 = vim.fn.glob("C:/Program Files/Eclipse Adoptium/jdk-25*", false, true)[1]
        if jdk25 then
            vim.lsp.config("jdtls", { cmd_env = { JAVA_HOME = jdk25 } })
        end

        -- Also treat IntelliJ projects (.idea) as Java projects, even without
        -- Maven, Gradle or Git. Earlier groups take priority over later ones.
        vim.lsp.config("jdtls", {
            root_markers = {
                { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git" },
                { "build.xml", "pom.xml", "build.gradle", "build.gradle.kts" },
                { ".idea" },
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
