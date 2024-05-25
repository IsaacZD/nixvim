let
  disabledFiletypes = [
    # Default
    "qf"
    "netrw"
    "NvimTree"
    "lazy"
    "mason"

    # Custom
    "alpha"
    "dashboard"
    "neo-tree"
    "Trouble"
    "trouble"
    "notify"
  ];
in {
  # Learn vim operations
  plugins.hardtime.enable = true;
  plugins.hardtime = {
    inherit disabledFiletypes;
    enabled = true;
    disableMouse = true;
  };
}
