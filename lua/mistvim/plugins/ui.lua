return {
  -------------------------------------------------
  -- Lualine
  -------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = "auto",
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 1,
            },
          },
          lualine_x = {
            "encoding",
            "fileformat",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = {
            "location",
          },
        },
      })
    end,
  },

  -------------------------------------------------
  -- Noice (Centered Command Line)
  -------------------------------------------------
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -------------------------------------------------
  -- Catppuccin Theme
  -------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          nvimtree = true,
          telescope = true,
          cmp = true,
          mason = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -------------------------------------------------
  -- Dashboard (Alpha)
  -------------------------------------------------
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[ ███╗   ███╗██╗███████╗████████╗██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗ ████║██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║ ]],
        [[ ██╔████╔██║██║███████╗   ██║   ██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╔╝██║██║╚════██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚═╝ ██║██║███████║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝     ╚═╝╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      }

      local function project_picker()
        local builtin = require("telescope.builtin")
        local projects_dir = vim.fn.expand("~/projects")
        builtin.find_files({
          prompt_title = "Projects",
          cwd = projects_dir,
          find_command = { "find", ".", "-maxdepth", "1", "-type", "d", "-not", "-path", "." },
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection then
                local project_path = projects_dir .. "/" .. selection[1]
                vim.cmd("cd " .. project_path)
                vim.defer_fn(function()
                  builtin.find_files({ cwd = project_path })
                end, 10)
              end
            end)
            return true
          end,
        })
      end

      local function config_picker()
        local builtin = require("telescope.builtin")
        local config_dir = vim.fn.expand("~/.config")
        builtin.find_files({
          prompt_title = "Config Files",
          cwd = config_dir,
          find_command = { "find", ".", "-maxdepth", "1", "-type", "d", "(", "-name", "hypr", "-o", "-name", "wezterm", "-o", "-name", "nvim", ")" },
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection then
                local path = config_dir .. "/" .. selection[1]
                vim.cmd("cd " .. path)
                vim.defer_fn(function()
                  builtin.find_files({ cwd = path })
                end, 10)
              end
            end)
            return true
          end,
        })
      end

      dashboard.section.buttons.val = {
        dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
        dashboard.button("p", "  Projects", function() project_picker() end),
        dashboard.button("c", "  Configuration", function() config_picker() end),
        dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)
    end,
  },
}
