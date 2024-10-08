vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2
-- INSTALL JAVA 17 or lastest
-- USE PYTHON3.9

local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local capabilities = require("lsp.handler").capabilities

-- Determine OS
local home = os.getenv "HOME"
if vim.fn.has "mac" == 1 then
  WORKSPACE_PATH = home .. "/.javaeclipsecaches/"
  CONFIG = "mac"
elseif vim.fn.has "unix" == 1 then
  WORKSPACE_PATH = home .. "/.javaeclipsecaches/"
  CONFIG = "linux"
else
  print "Unsupported system"
end

-- Find root of project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
extendedClientCapabilities.onCompletionItemSelectedCommand = "editor.action.triggerParameterHints"

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

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

local config = {
  saveActions = {
    organizeImports = true,
  },
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    -- ≡ƒÆÇ
    "java", -- or '/path/to/java11_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- ≡ƒÆÇ
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version
    --
    -- ≡ƒÆÇ
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- ≡ƒÆÇ
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
  },

  -- on_attach = require("lvim.lsp").on_attach,
  capabilities = capabilities,

  -- ≡ƒÆÇ
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- or https://github.com/redhat-developer/vscode-java#supported-vs-code-settings
  -- for a list of options
  settings = {
    autobuild = { enabled = false },
    java = {
      -- jdt = {
      --   ls = {
      --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
      --   }
      -- },
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-22",
            path = "~/.sdkman/candidates/java/22.0.2-tem",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = { parameterNames = { enabled = "all" } },
      format = {
        enabled = false,
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
  },
}

config.on_attach = function(client, bufnr)
  require("lsp.handler").on_attach(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  require("jdtls.dap").setup_dap_main_class_configs()
  jdtls.setup_dap { hotcodereplace = "auto" }
  vim.api.nvim_create_autocmd("BufWritePost", {
    buffer = bufnr,
    callback = function()
      client.request_sync("java/buildWorkspace", false, 5000, bufnr)
    end,
  })
end

local keymap = require("core.functions").keymap

keymap("n", "<leader>lo", '<Esc><Cmd>lua require("jdtls").organize_imports()<Cr>', "Organize Imports")
keymap("n", "<leader>lv", '<Esc><Cmd>lua require("jdtls").extract_variable()<Cr>', "Extract Variable")
keymap("n", "<leader>lc", '<Esc><Cmd>lua require("jdtls").extract_constant()<Cr>', "Extract Constant")
keymap("n", "<leader>lt", '<Esc><Cmd>lua require("jdtls").test_nearest_method()<Cr>', "Test Method")
keymap("n", "<leader>lT", '<Esc><Cmd>lua require("jdtls").test_class()<Cr>', "Test Class")
keymap("n", "<leader>lu", "<Esc><Cmd>JdtUpdateConfig<CR>", "Update Config")
keymap("v", "<leader>lv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable")
keymap("v", "<leader>lc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Cosntant")
keymap("v", "<leader>lm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
