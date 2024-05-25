{
  description = "My nixvim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
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
      };
    };
}
