{
  imports = [
    ./flash.nix
    ./hardtime.nix
    ./neo-tree.nix
    ./notify.nix
    ./telescope
    ./which-key.nix
  ];

  # jk to Esc
  plugins.better-escape = {
    enable = true;
    settings = {
      timeout = 200;
    };
  };
}
