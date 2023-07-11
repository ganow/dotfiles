local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    -- python
    null_ls.builtins.diagnostics.mypy.with({
      prefer_local = ".venv/bin",
    }),
    null_ls.builtins.diagnostics.ruff.with({
      prefer_local = ".venv/bin",
    }),
    null_ls.builtins.formatting.black.with({
      prefer_local = ".venv/bin",
    }),
  }
}
