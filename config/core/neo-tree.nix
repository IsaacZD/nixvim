{
  plugins.neo-tree.enable = true;

  # Collapse folder
  plugins.neo-tree.window.mappings."h".__raw = ''
      function(state)
      local node = state.tree:get_node()
      if node.type == "directory" and node:is_expanded() then
        require("neo-tree.sources.filesystem").toggle_directory(state, node)
      else
        require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
      end
    end
  '';

  # Expand folder
  plugins.neo-tree.window.mappings."l".__raw = ''
    function(state)
      local node = state.tree:get_node()
      if node.type == "directory" then
        if not node:is_expanded() then
          require("neo-tree.sources.filesystem").toggle_directory(state, node)
        elseif node:has_children() then
          require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
        end
      end
    end
  '';

  plugins.neo-tree.window.mappings."s" = "";
  plugins.neo-tree.window.mappings."<space>" = "";

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      action = ''
        function()
          require("neo-tree.command").execute({ toggle = true })
        end
      '';
      lua = true;
      options.desc = "Toggle Neo-Tree";
    }
  ];
}
