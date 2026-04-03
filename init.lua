-- Detect Nix environment (skip Mason when running under Nix)
if vim.fn.isdirectory("/nix") == 1 then
  vim.g.is_nix = true
end

-- Bootstrap lazy.nvim, LazyVim and plugins
require("config.lazy")
