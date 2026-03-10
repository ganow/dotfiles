return {
  {
    "nvim-mini/mini.animate",
    opts = function(_, opts)
      local animate = require("mini.animate")

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
