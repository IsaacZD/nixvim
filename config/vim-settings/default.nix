{
  pkgs,
  lib,
  ...
}: {
  globals.mapleader = " ";
  opts = {
    # Show line numberes
    number = true;
    relativenumber = true;

    # Tabs
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    smarttab = true;

    # Show tab line when there's at least 2 tabs
    showtabline = 1;

    # Smart indenting
    smartindent = true;
    shiftwidth = 2;

    # Text wrap
    # https://stackoverflow.com/questions/1204149/smart-wrap-in-vim
    wrap = true;
    breakindent = true;
    breakindentopt = "shift:2,min:40,sbr";
    showbreak = ">>";

    # Splitting
    splitbelow = true;
    splitright = true;

    # Enable mouse
    mouse = "a";

    # Search
    hlsearch = true;
    incsearch = true;
    ignorecase = true;
    smartcase = true; # Do not ignore case with captials
    grepprg = "rg --vimgrep"; # TODO: make it a nix dependency?
    grepformat = "%f:%l:%c:%m";

    # Completion
    updatetime = 1000; # Default 4000ms
    completeopt = ["menuone" "noselect" "noinsert"];

    # Persistent undo history
    swapfile = false;
    backup = false;
    undofile = true;

    # Terminal colors
    termguicolors = true;

    # Enable the sign column
    signcolumn = "yes";

    # Highlight cursor line
    cursorline = true;

    # Fold
    foldenable = true;
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;

    # Keep a few lines above/below cursor
    scrolloff = 5;

    # Ruler
    colorcolumn = "80";

    # Reduce which-key timeout to 10ms
    timeoutlen = 10;

    # Encoding
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Cursor settings
    guicursor = [
      "n-v-c:block" # Normal, visual, command-line: block cursor
      "i-ci-ve:block" # Insert, command-line insert, visual-exclude: vertical bar cursor with block cursor, use "ver25" for 25% width
      "r-cr:hor20" # Replace, command-line replace: horizontal bar cursor with 20% height
      "o:hor50" # Operator-pending: horizontal bar cursor with 50% height
      "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" # All modes: blinking settings
      "sm:block-blinkwait175-blinkoff150-blinkon175" # Showmatch: block cursor with specific blinking settings
    ];

    # Show invisible characters
    list = true;

    # eol:↲
    listchars = "tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣";

    # More space in the neovim command line for displaying messages
    cmdheight = 2;

    # Hide modes like INSERT
    showmode = false;

    # Maximum number of items to show in the popup menu
    pumheight = 0;

    # Use conform-nvim for gq formatting. ('formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it)
    formatexpr = "v:lua.require'conform'.formatexpr()";

    # https://neovim.io/doc/user/options.html#'laststatus'
    laststatus = 3;
  };

  extraConfigLua = builtins.readFile ./extra.lua;
}
