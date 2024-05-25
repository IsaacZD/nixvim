{
  plugins.noice.enable = true;

  plugins.noice = {
    notify.enabled = false;
    messages.enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason

    popupmenu = {
      enabled = true;
      backend = "nui";
    };

    lsp.message.enabled = true;
    lsp.progress = {
      enabled = false;
      view = "mini";
    };

    format = {
      filter = {
        pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
        icon = "󱞪";
        lang = "regex";
      };
    };
  };
}
