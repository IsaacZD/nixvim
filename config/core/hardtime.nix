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
    "sagafinder"
    "sagaoutline"
    "saga_codeaction"
  ];
in {
  # Learn vim operations
  plugins.hardtime.enable = true;
  plugins.hardtime = {
    settings = {
      inherit disabledFiletypes;
      enabled = true;
      disableMouse = true;
    };
  };
}
