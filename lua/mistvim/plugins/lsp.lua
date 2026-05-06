return {
  -------------------------------------------------
  -- LSP + Mason
  -------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",       -- JavaScript / Phaser
          "csharp_ls",   -- C#
        },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 0.11+ API
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("csharp_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("ts_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("csharp_ls")

      -- Keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

      -- VSCode-style signature help
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = args.buf })
        end,
      })
    end,
  },

  -------------------------------------------------
  -- Autocomplete
  -------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },
}
