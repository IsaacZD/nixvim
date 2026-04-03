{
  description = "Ved: my neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      flake.homeManagerModules.default = {pkgs, ...}: {
        programs.neovim = {
          enable = true;
          # Signal to the Lua config that LSPs are managed by Nix, not Mason
          extraLuaConfig = "vim.g.is_nix = true";
          extraPackages = with pkgs; [
            # LSP servers
            clang-tools
            lua-language-server
            pyright
            ruff
            nodePackages.eslint
            rust-analyzer

            # Formatters
            prettierd
            stylua
            alejandra
            rustfmt
            black

            # Tools
            ripgrep
            fd
            tree-sitter
          ];
        };

        # Link the lua config into ~/.config/nvim
        xdg.configFile."nvim" = {
          source = ./.;
          recursive = true;
        };
      };

      perSystem = {pkgs, ...}: let
        lspAndTools = with pkgs; [
          # LSP servers
          clang-tools
          lua-language-server
          pyright
          ruff
          nodePackages.eslint
          rust-analyzer
          # Formatters
          prettierd
          stylua
          alejandra
          rustfmt
          black
          # Tools
          ripgrep
          git
          # Required by nvim-treesitter to compile parsers
          tree-sitter
        ];
      in {
        formatter = pkgs.alejandra;

        # `nix develop .#nvim` — test the config with all LSPs/formatters available.
        # Sets XDG_CONFIG_HOME so nvim loads from the repo. Run `v` to open neovim.
        devShells.nvim = pkgs.mkShell {
          name = "ved-nvim";
          packages = [pkgs.neovim] ++ lspAndTools;
          shellHook = ''
            ROOT_DIR="$(git rev-parse --show-toplevel)"
            mkdir -p "$ROOT_DIR/.config"
            ln -sfn "$ROOT_DIR" "$ROOT_DIR/.config/nvim"
            export XDG_CONFIG_HOME="$ROOT_DIR/.config"
            alias v="nvim"
            echo "ved dev shell — run 'v' to open neovim with this config"
          '';
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            cargo
            rustc
            rustfmt
            clippy
            rust-analyzer
            vscode-extensions.vadimcn.vscode-lldb.adapter
          ];

          shellHook = ''
            export ROOT_DIR="$(git rev-parse --show-toplevel)"
          '';
        };
      };
    };
}
