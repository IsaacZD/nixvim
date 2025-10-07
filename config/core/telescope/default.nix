{
  imports = [
    ./keymaps.nix
  ];

  plugins.telescope.enable = true;
  plugins.todo-comments.enable = true; # todo provider
  plugins.web-devicons.enable = true; # required

  plugins.telescope.extensions = {
    fzf-native.enable = true;
    undo.enable = true;

    ui-select.settings = {
      specific_opts.codeactions = true;
    };
  };

  plugins.telescope.settings = {
    # If you'd prefer Telescope not to enter a normal-like mode when hitting esc and instead exiting, you can map <Esc> to do so via:
    defaults.mappings.i = {
      "<esc>".__raw = ''
        function(...)
            return require("telescope.actions").close(...)
        end
      '';
    };
  };

  extraConfigLua = ''
    local telescope = require('telescope')
    telescope.setup {
        pickers = {
            colorscheme = {
                enable_preview = true
            }
        }
    }
  '';
}
