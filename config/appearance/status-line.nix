{
  plugins.lualine.enable = true;

  plugins.lualine = {
    alwaysDivideMiddle = true;
    # Enable global status line.
    globalstatus = true;
    ignoreFocus = ["neo-tree"];
    extensions = ["fzf"];
    theme = "auto";
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

    sections = {
      lualine_a = ["mode"];
      lualine_b = [
        {
          name = "branch";
          icon = "";
        }
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
