  require("fzf-lua").setup({
    previewers = {
      builtin = {
        extensions = {
          ["bmp"] = { "chafa" },
          ["png"] = { "chafa" },
          ["svg"] = { "chafa" },
          ["jpg"] = { "chafa" },
        },
      },
    },
  })
