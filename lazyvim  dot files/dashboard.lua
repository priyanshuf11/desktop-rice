return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  opts = function()
    local logo = [[
██╗  ██╗  ██████╗  ██████╗  ██╗ ███████╗  ██████╗  ███╗   ██╗
██║  ██║ ██╔═══██╗ ██╔══██╗ ██║ ╚══███╔╝ ██╔═══██╗ ████╗  ██║
███████║ ██║   ██║ ██████╔╝ ██║   ███╔╝  ██║   ██║ ██╔██╗ ██║
██╔══██║ ██║   ██║ ██╔══██╗ ██║  ███╔╝   ██║   ██║ ██║╚██╗██║
██║  ██║ ╚██████╔╝ ██║  ██║ ██║ ███████╗ ╚██████╔╝ ██║ ╚████║
╚═╝  ╚═╝  ╚═════╝  ╚═╝  ╚═╝ ╚═╝ ╚══════╝  ╚═════╝  ╚═╝  ╚═══╝
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                desc = " Find Files",    icon = " ", icon_hl = "DashboardIcon", key = "f" },
          { action = "ene | startinsert",                   desc = " Craft ",       icon = " ", icon_hl = "DashboardIcon", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',      desc = " Archive",       icon = " ", icon_hl = "DashboardIcon", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',     desc = " Trace Text",       icon = " ", icon_hl = "DashboardIcon", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',   desc = " Engine",    icon = " ", icon_hl = "DashboardIcon", key = "c" },
          { action = 'lua require("persistence").load()',   desc = " Time Machine",   icon = " ", icon_hl = "DashboardIcon", key = "s" },
          { action = "LazyExtras",                          desc = " Marketplace",       icon = " ", icon_hl = "DashboardIcon", key = "x" },
          { action = "Lazy",                                desc = " Terminate",       icon = "󰒲 ", icon_hl = "DashboardIcon", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Terminate", icon = " ", icon_hl = "DashboardIcon", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "󱐋 Tweaked by priyanshuf11 󱐋",
            "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins loaded in " .. ms .. "ms",
          }
        end,
      },
    }

    --- Catppuccin Mocha Highlight Colors
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#a6e3a1" }) -- Catppuccin Green
    vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#89dceb" }) -- Sky
    vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#cdd6f4" }) -- Text
    vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#fab387" }) -- Peach
    vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#94e2d5" }) -- Teal

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}

--   █████╗  ██████╗   ██████╗ ██████╗  ███████╗ ███████╗  ██████╗  ██╗  ██╗ ██╗ ██████╗
--  ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔══██╗ ██╔════╝ ██╔════╝ ██╔════╝  ██║  ██║ ██║ ██╔══██╗
--  ███████║ ██████╔╝ ██║      ██║  ██║ █████╗   █████╗   ██║  ███╗ ███████║ ██║ ██║  ██║
--  ██╔══██║ ██╔══██╗ ██║      ██║  ██║ ██╔══╝   ██╔══╝   ██║   ██║ ██╔══██║ ██║ ██║  ██║
--  ██║  ██║ ██████╔╝ ╚██████╗ ██████╔╝ ███████╗ ██║      ╚██████╔╝ ██║  ██║ ██║ ██████╔╝
--  ╚═╝  ╚═╝ ╚═════╝   ╚═════╝ ╚═════╝  ╚══════╝ ╚═╝       ╚═════╝  ╚═╝  ╚═╝ ╚═╝ ╚═════╝
--
--  ██╗  ██╗ ██╗      ███╗   ███╗ ███╗   ██╗  ██████╗  ██████╗   ██████╗  ██████╗  ███████╗
--  ██║ ██╔╝ ██║      ████╗ ████║ ████╗  ██║ ██╔═══██╗ ██╔══██╗  ██╔══██╗ ██╔══██╗ ██╔════╝
--  █████╔╝  ██║      ██╔████╔██║ ██╔██╗ ██║ ██║   ██║ ██████╔╝  ██║  ██║ ██████╔╝ ███████╗
--  ██╔═██╗  ██║      ██║╚██╔╝██║ ██║╚██╗██║ ██║   ██║ ██╔═══╝   ██║  ██║ ██╔══██╗ ╚════██║
--  ██║  ██╗ ███████╗ ██║ ╚═╝ ██║ ██║ ╚████║ ╚██████╔╝ ██║      ╚██████╔╝ ██║  ██║ ███████║
--  ╚═╝  ╚═╝ ╚══════╝ ╚═╝     ╚═╝ ╚═╝  ╚═══╝  ╚═════╝  ╚═╝       ╚═════╝  ╚═╝  ╚═╝ ╚══════╝
--
--  ████████╗ ██╗   ██╗ ██╗   ██╗ ██╗    ██╗ ██╗  ██╗  ██╗   ██╗ ███████╗
--  ╚══██╔══╝ ██║   ██║ ██║   ██║ ██║    ██║ ╚██╗██╔╝  ╚██╗ ██╔╝ ╚══███╔╝
--    ██║    ██║   ██║ ██║   ██║ ██║ █╗ ██║  ╚███╔╝    ╚████╔╝    ███╔╝
--    ██║    ██║   ██║ ██║   ██║ ██║███╗██║  ██╔██╗     ╚██╔╝    ███╔╝
--    ██║    ╚██████╔╝ ╚██████╔╝ ████╔████║ ██╔╝ ██╗     ██║    ███████╗
--    ╚═╝     ╚═════╝   ╚═════╝  ╚═══╝╚═══╝ ╚═╝  ╚═╝     ╚═╝    ╚══════╝

--  ██████╗ ██╗██╗   ██╗██╗   ██╗    ██╗   ██╗██╗███╗   ███╗
--  ██╔══██╗██║╚██╗ ██╔╝██║   ██║    ██║   ██║██║████╗ ████║
--  ██████╔╝██║ ╚████╔╝ ██║   ██║    ██║   ██║██║██╔████╔██║
--  ██╔═══╝ ██║  ╚██╔╝  ██║   ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
--  ██║     ██║   ██║   ╚██████╔╝     ╚████╔╝ ██║██║ ╚═╝ ██║
--  ╚═╝     ╚═╝   ╚═╝    ╚═════╝       ╚═══╝  ╚═╝╚═╝     ╚═╝
