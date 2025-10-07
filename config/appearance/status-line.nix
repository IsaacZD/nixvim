{
  plugins.lualine.enable = true;

  plugins.lualine = {
    # Enable global status line.
    settings.extensions = ["fzf"];

    settings.options = {
      globalstatus = true;
      alwaysDivideMiddle = true;
      theme = "auto";
      ignoreFocus = ["neo-tree"];
      componentSeparators = {
        left = "|";
        right = "|";
      };
      sectionSeparators = {
        #   left = "█"; # 
        #   right = "█"; # 
        left = "";
        right = "";
      };
    };

    settings.sections = {
      lualine_a = ["mode"];
      lualine_b = [
        # {
        #   name = "branch";
        #   icon = "";
        # }
        "branch"
        "diff"
        "diagnostics"
      ];
      lualine_c = ["filename"];
      lualine_x = ["filetype"];
      lualine_y = ["progress"];
      lualine_z = [''" " .. os.date("%R")''];
    };
  };
}
