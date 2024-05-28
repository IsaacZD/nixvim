{
  plugins.lsp.servers.rust-analyzer = {
    enable = true;
    installCargo = true;
    installRustc = true;
    settings = {
      checkOnSave = true;
      check = {
        command = "clippy";
      };
      inlayHints = {
        enable = true;
        showParameterNames = true;
        parameterHintsPrefix = "<- ";
        otherHintsPrefix = "=> ";
      };
      procMacro = {
        enable = true;
      };
    };
  };
}
