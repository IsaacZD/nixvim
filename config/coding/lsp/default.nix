let
in {
  imports = [
    ./lang
    ./lspsaga.nix
  ];

  plugins.lsp-format.enable = false;

  plugins.lsp = {
    enable = true;
    capabilities = "offsetEncoding = 'utf-16'";
  };

  plugins.lsp.servers = {
    nil_ls.enable = true; # Nix
    clangd.enable = true;
    pyright.enable = true; # Python static type checker
    ruff_lsp.enable = true; # Python linter
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
