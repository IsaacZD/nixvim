let
  rust-analyzer = {
    enable = true;
    installCargo = true;
    installRustc = true;
    settings = {
      checkOnSave = true;
      check = {
        command = "clippy";
      };
      inlayHints = {
        enable = true;
        showParameterNames = true;
        parameterHintsPrefix = "<- ";
        otherHintsPrefix = "=> ";
      };
      procMacro = {
        enable = true;
      };
    };
  };

  lua-ls = {
    enable = true;
    extraOptions = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace";
          };
          telemetry = {
            enabled = false;
          };
          hint = {enable = true;};
        };
      };
    };
  };

  tsserver = {
    enable = false;
    filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
    extraOptions = {
      settings = {
        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayVariableTypeHints = true;
          };
        };
        typescript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayVariableTypeHints = true;
          };
        };
      };
    };
  };
in {
  imports = [
    ./lspsaga.nix
  ];

  plugins.lsp-format.enable = false;

  plugins.lsp = {
    enable = true;
    capabilities = "offsetEncoding = 'utf-16'";
  };

  plugins.lsp.servers = {
    inherit rust-analyzer lua-ls tsserver;

    nil_ls.enable = true; # Nix
    clangd.enable = true;
    pyright.enable = true; # Python static type checker
    ruff-lsp.enable = true; # Python linter

    eslint.enable = true; # Javascript
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
