return {
    { "MeanderingProgrammer/render-markdown.nvim",
        config = function()
            require('blink.cmp').setup({
                sources = {
                    completion = {
                        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'markdown' },
                    },
                    providers = {
                        markdown = { name = 'RenderMarkdown', module = 'render-markdown.integ.blink' },
                    },
                },
            })
        end
    },
}
