return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        -- <Enter> accept, <C-space> open menu, <C-n>/<C-p> select, <C-e> close
        keymap = { preset = "enter" },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
