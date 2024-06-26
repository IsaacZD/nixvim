{
  colorschemes.catppuccin.enable = true;
  colorschemes.catppuccin.settings = {
    background = {
      light = "macchiato";
      dark = "mocha";
    };
    flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
    disable_bold = false;
    disable_italic = false;
    disable_underline = false;
    transparent_background = true;
    term_colors = true;
  };

  colorschemes.catppuccin.settings.integrations = {
    cmp = true;
    noice = true;
    notify = true;
    neotree = true;
    harpoon = true;
    gitsigns = true;
    which_key = true;
    illuminate = {
      enabled = true;
    };
    treesitter = true;
    treesitter_context = true;
    telescope.enabled = true;
    indent_blankline.enabled = true;
    mini.enabled = true;
    native_lsp = {
      enabled = true;
      inlay_hints = {
        background = true;
      };
      underlines = {
        errors = ["underline"];
        hints = ["underline"];
        information = ["underline"];
        warnings = ["underline"];
      };
    };
  };

  colorschemes.catppuccin.settings.custom_highlights = builtins.readFile ./custom-colors.lua;
}
