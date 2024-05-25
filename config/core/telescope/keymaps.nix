{...}: let
  leader = k: act: desc: {
    "<leader>${k}" = {
      action = act;
      options.desc = desc;
    };
  };

  nmap = k: act: desc: {
    mode = "n";
    key = k;
    action = act;
    options.desc = desc;
  };
in {
  plugins.telescope.keymaps =
    {
      "<C-p>" = {
        action = "git_files, {}";
        options.desc = "Search git files";
      };
    }
    #
    // leader "<leader>" "find_files, {}" "Find project files"
    // leader "/" "live_grep" "Grep (root dir)"
    // leader ":" "command_history, {}" "Command History"
    // leader "b" "buffers, {}" "+buffer"
    #
    // leader "ff" "find_files, {}" "Find project files"
    // leader "fr" "oldfiles, {}" "Recent"
    // leader "fb" "buffers, {}" "Buffers"
    #
    // leader "gc" "git_commits, {}" "Commits"
    // leader "gs" "git_status, {}" "Status"
    #
    // leader "sa" "autocommands, {}" "Auto Commands"
    // leader "sb" "current_buffer_fuzzy_find, {}" "Buffer"
    // leader "sc" "command_history, {}" "Command History"
    // leader "sC" "commands, {}" "Commands"
    // leader "sD" "diagnostics, {}" "Workspace Diagnostics"
    // leader "sh" "help_tags, {}" "Help Pages"
    // leader "sH" "highlights, {}" "Search Highlight Groups"
    // leader "sk" "keymaps, {}" "Keymaps"
    // leader "sM" "man_pages, {}" "Man pages"
    // leader "sm" "marks, {}" "Jump to Mark"
    // leader "so" "vim_options, {}" "Options"
    // leader "sR" "resume, {}" "Resume"
    #
    // leader "uC" "colorscheme, {}" "Colorscheme preview"
    // {};

  keymaps = [
    (nmap "<leader>fp" "<cmd>Telescope projects<CR>" "Projects")
    (nmap "<leader>sd" "<cmd>Telescope diagnostics bufnr=0<cr>" "Document diagnostics")
    (nmap "<leader>st" "<cmd>TodoTelescope<CR>" "Todo (Telescope)")
  ];
}
