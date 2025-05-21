local mason = require("mason")
local lspconfig = require("lspconfig")

mason.setup({})

-- Relevant ones
lspconfig.gopls.setup {}
lspconfig.jdtls.setup {}
lspconfig.rust_analyzer.setup {
    settings = {
         ["rust-analyzer"] = {
            completion = {
                addCallArgumentSnippets = false,
                postfix = {
                    enable = false,
                },
            },
        },
    }
}
lspconfig.ruby_lsp.setup {}
lspconfig.bacon_ls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.perlpls.setup {}
lspconfig.dockerls.setup {}
lspconfig.groovyls.setup {}
lspconfig.metals.setup {}
lspconfig.denols.setup {}

lspconfig.pyright.setup {}
lspconfig.bashls.setup {}
--lspconfig.tsserver.setup {}


