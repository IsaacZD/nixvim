let
  greeting = [
    " ███       ███ "
    "████      ████"
    "██████     █████"
    "███████    █████"
    "████████   █████"
    "█████████  █████"
    "█████ ████ █████"
    "█████  █████████"
    "█████   ████████"
    "█████    ███████"
    "█████     ██████"
    "████      ████"
    " ███       ███ "
  ];

  greeting-color = [
    [["AlphaNeovimLogoBlue" 0 0] ["AlphaNeovimLogoGreen" 1 14] ["AlphaNeovimLogoBlue" 23 34]]
    [["AlphaNeovimLogoBlue" 0 2] ["AlphaNeovimLogoGreenFBlueB" 2 4] ["AlphaNeovimLogoGreen" 4 19] ["AlphaNeovimLogoBlue" 27 40]]
    [["AlphaNeovimLogoBlue" 0 4] ["AlphaNeovimLogoGreenFBlueB" 4 7] ["AlphaNeovimLogoGreen" 7 22] ["AlphaNeovimLogoBlue" 29 42]]
    [["AlphaNeovimLogoBlue" 0 8] ["AlphaNeovimLogoGreenFBlueB" 8 10] ["AlphaNeovimLogoGreen" 10 25] ["AlphaNeovimLogoBlue" 31 44]]
    [["AlphaNeovimLogoBlue" 0 10] ["AlphaNeovimLogoGreenFBlueB" 10 13] ["AlphaNeovimLogoGreen" 13 28] ["AlphaNeovimLogoBlue" 33 46]]
    [["AlphaHeader" 0 13] ["AlphaNeovimLogoGreen" 14 31] ["AlphaNeovimLogoBlue" 35 49]]
    [["AlphaNeovimLogoBlue" 0 13] ["AlphaNeovimLogoGreen" 16 32] ["AlphaNeovimLogoBlue" 35 49]]
    [["AlphaNeovimLogoBlue" 0 13] ["AlphaNeovimLogoGreen" 17 33] ["AlphaNeovimLogoBlue" 35 49]]
    [["AlphaNeovimLogoBlue" 0 13] ["AlphaNeovimLogoGreen" 18 34] ["AlphaNeovimLogoGreenFBlueB" 33 35] ["AlphaNeovimLogoBlue" 35 49]]
    [["AlphaNeovimLogoBlue" 0 13] ["AlphaNeovimLogoGreen" 19 35] ["AlphaNeovimLogoGreenFBlueB" 34 35] ["AlphaNeovimLogoBlue" 35 49]]
    [["AlphaNeovimLogoBlue" 0 13] ["AlphaNeovimLogoGreen" 20 36] ["AlphaNeovimLogoGreenFBlueB" 35 37] ["AlphaNeovimLogoBlue" 37 49]]
    [["AlphaNeovimLogoBlue" 0 13] ["AlphaNeovimLogoGreen" 21 37] ["AlphaNeovimLogoGreenFBlueB" 36 37] ["AlphaNeovimLogoBlue" 37 49]]
    [["AlphaNeovimLogoBlue" 1 13] ["AlphaNeovimLogoGreen" 20 35] ["AlphaNeovimLogoBlue" 37 48]]
  ];

  padding = val: {
    type = "padding";
    inherit val;
  };
in {
  plugins.alpha.enable = true;
  plugins.alpha.theme = null;
  plugins.alpha.iconsEnabled = true;

  plugins.alpha.layout = [
    (padding 4)
    {
      type = "text";
      val = greeting;
      opts = {
        hl = greeting-color;
        position = "center";
      };
    }
    (padding 2)
    {
      type = "button";
      val = "  Find File";
      on_press.raw = "require('telescope.builtin').find_files";
      opts = {
        # hl = "comment";
        keymap = [
          "n"
          "f"
          ":Telescope find_files <CR>"
          {
            noremap = true;
            silent = true;
            nowait = true;
          }
        ];
        shortcut = "f";

        position = "center";
        cursor = 3;
        width = 38;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "  New File";
      on_press.__raw = "function() vim.cmd[[ene]] end";
      opts = {
        # hl = "comment";
        keymap = [
          "n"
          "n"
          ":ene <BAR> startinsert <CR>"
          {
            noremap = true;
            silent = true;
            nowait = true;
          }
        ];
        shortcut = "n";

        position = "center";
        cursor = 3;
        width = 38;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "󰈚  Recent Files";
      on_press.raw = "require('telescope.builtin').oldfiles";
      opts = {
        # hl = "comment";
        keymap = [
          "n"
          "r"
          ":Telescope oldfiles <CR>"
          {
            noremap = true;
            silent = true;
            nowait = true;
          }
        ];
        shortcut = "r";

        position = "center";
        cursor = 3;
        width = 38;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "󰈭  Find Word";
      on_press.raw = "require('telescope.builtin').live_grep";
      opts = {
        # hl = "comment";
        keymap = [
          "n"
          "g"
          ":Telescope live_grep <CR>"
          {
            noremap = true;
            silent = true;
            nowait = true;
          }
        ];
        shortcut = "g";

        position = "center";
        cursor = 3;
        width = 38;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "  Restore Session";
      on_press.raw = "require('persistence').load()";
      opts = {
        # hl = "comment";
        keymap = [
          "n"
          "s"
          ":lua require('persistence').load()<cr>"
          {
            noremap = true;
            silent = true;
            nowait = true;
          }
        ];
        shortcut = "s";

        position = "center";
        cursor = 3;
        width = 38;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
    (padding 1)
    {
      type = "button";
      val = "  Quit Neovim";
      on_press.__raw = "function() vim.cmd[[qa]] end";
      opts = {
        # hl = "comment";
        keymap = [
          "n"
          "q"
          ":qa<CR>"
          {
            noremap = true;
            silent = true;
            nowait = true;
          }
        ];
        shortcut = "q";

        position = "center";
        cursor = 3;
        width = 38;
        align_shortcut = "right";
        hl_shortcut = "Keyword";
      };
    }
  ];
}
