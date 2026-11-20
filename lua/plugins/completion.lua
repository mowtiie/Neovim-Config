return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        -- <C-space> open menu, <C-n>/<C-p> select, <C-y> accept, <C-e> close
        keymap = { preset = "default" },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
