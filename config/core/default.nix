{
  imports = [
    ./telescope
    ./hardtime.nix
    ./neo-tree.nix
  ];

  plugins.which-key.enable = true;

  # jk to Esc
  plugins.better-escape = {
    enable = true;
    clearEmptyLines = true;
    timeout = 200;
  };
}
