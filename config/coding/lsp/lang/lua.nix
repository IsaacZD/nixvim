{
  plugins.lsp.servers.lua_ls = {
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
