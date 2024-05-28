{
  plugins.lsp.servers.lua-ls = {
    enable = true;
    extraOptions = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace";
          };
          telemetry = {
            enabled = false;
          };
          hint = {enable = true;};
        };
      };
    };
  };
}
