{
  plugins.indent-blankline.enable = true;
  plugins.indent-blankline.settings = {
    indent = {
      char = "│"; # "│" or "▎"
    };
    scope = {
      enabled = true;
      show_start = true;
    };
    exclude = {
      buftypes = ["terminal" "nofile"];
      filetypes = [
        "help"
        "alpha"
        "dashboard"
        "neo-tree"
        "Trouble"
        "trouble"
        "lazy"
        "mason"
        "notify"
        "toggleterm"
        "lazyterm"
      ];
    };
  };
}
