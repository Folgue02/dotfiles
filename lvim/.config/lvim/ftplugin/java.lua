local status, jdtls = pcall(require, 'jdtls')
vim.notify("Loading custom configuration for java", vim.log.levels.INFO)

if not status then
  vim.notify("Custom java configuration could not be loaded (no jdtls)", vim.log.levels.ERROR)
  return
end

local home = os.getenv('HOME')
local workspace_path = home .. '/.local/share/lunarvim/jdtls-workspace'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_path .. project_name

local os_config = 'linux'

if vim.fn.has 'mac' == 1 then
  os_config = 'mac'
end

vim.notify("Pre extended capabilities", vim.log.levels.INFO)
local capabilities = require("lvim.lsp").common_capabilities()
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

lvim.builtin.dap.active = true
local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    "\n"
  )
)

vim.notify("Pre cmd-config", vim.log.levels.INFO)
lvim.builtin.dap.active = true
local lombok_path = home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar"
vim.notify("Lombok found in " .. lombok_path, vim.log.levels.INFO)
local config = {
  cmd = {
    "java",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. os_config,
    "-data",
    workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
  capabilities = capabilities,

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-24",
            path = "~/.sdkman/candidates/java/24.0.1-graalce",
          },
          {
            name = "JavaSE-11",
            path = "~/.sdkman/candidates/java/11.0.25-albba",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = false,
      },
    },
    signatureHelp = { enabled = true },
    extendedClientCapabilities = extendedClientCapabilities,
  },
  init_options = {
    bundles = bundles,
  },
}

vim.notify("Pre on-attach function", vim.log.levels.INFO)
-- On attach function
config["on_attach"] = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
 require("jdtls").setup_dap({ hotcodereplace = "auto" })
 require("lvim.lsp").on_attach(client, bufnr)
  local status_ok, jdtls_dap = pcall(require, "jdtls.dap")
  if status_ok then
    jdtls_dap.setup_dap_main_class_configs()
  end
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

vim.notify("Pre format", vim.log.levels.INFO)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
}

require("jdtls").start_or_attach(config)


-- ----------------
-- Keymaps
-- ----------------

vim.notify("Pre keymaps", vim.log.levels.INFO)
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Custom java configuration could not be loaded (which-key)", vim.log.levels.ERROR)
  return
end

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  C = {
    name = "Java",
    o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
    v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
    c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
    t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
    T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
    u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
  },
}

local vmappings = {
  C = {
    name = "Java",
    v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
    c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
    m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
  },
}

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(vmappings, vopts)

vim.notify("Custom java configuration loaded :)", vim.log.levels.INFO)
