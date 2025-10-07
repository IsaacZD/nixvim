{
  description = "Ved: my nixvim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
  };

  outputs = {
    self,
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {
            inherit self;
          };
        };

        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages."${system}";
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "MyNixvim";
          };
        };

        packages = {
          # inherit nvim;
          default = nvim;
        };

        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            cargo
            rustc
            rustfmt
            clippy
            rust-analyzer
            vscode-extensions.vadimcn.vscode-lldb.adapter
          ];

          # NOTE: direnv does not support alias and function
          shellHook = ''
            export ROOT_DIR="$(git rev-parse --show-toplevel)"
            alias v="$ROOT_DIR/result/bin/nvim"
            alias vim-rebuild="nix build $ROOT_DIR --out-link $ROOT_DIR/result"
          '';
        };
      };
    };
}
