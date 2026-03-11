return {
  {
    "nvim-mini/mini.animate",
    opts = function(_, opts)
      local animate = require("mini.animate")

      -- Disable scroll and cursor animations in VSCode to prevent cursor from
      -- snapping back to original position after clicking a distant location.
      -- VSCode updates the viewport instantly, but mini.animate animates scroll
      -- over time, causing a desync between VSCode's visual position and
      -- Neovim's internal scroll state when processing mouse clicks.
      if vim.g.vscode then
        opts.scroll = { enable = false }
        opts.cursor = { enable = false }
        return opts
      end

      opts.cursor = {
        enable = true,
        timing = animate.gen_timing.cubic({ duration = 80, unit = "total" }),
      }

      opts.scroll = {
        timing = animate.gen_timing.linear({ duration = 80, unit = "total" }),
        subscroll = animate.gen_subscroll.equal(),
      }

      return opts
    end,
  },
}
