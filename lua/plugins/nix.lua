-- Disable Mason on Nix: LSPs and formatters are installed via Nix packages instead
if not vim.g.is_nix then
  return {}
end

return {
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },
}
