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
lspconfig.lua_ls.setup {}
lspconfig.perlpls.setup {}
lspconfig.dockerls.setup {}

lspconfig.pyright.setup {}
lspconfig.bashls.setup {}
lspconfig.tsserver.setup {}

-- Occasional
lspconfig.cssls.setup {}
lspconfig.css_variables.setup {}
