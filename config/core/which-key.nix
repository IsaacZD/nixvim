let
  leader = k: act: desc: {
    mode = "n";
    key = "<leader>${k}";
    action = act;
    options.desc = desc;
  };
in {
  plugins.which-key.enable = true;
  keymaps = [
    (leader "c" "+code" null)
    (leader "d" "+debug" null)
    (leader "f" "+find" null)
    (leader "g" "+git" null)
    (leader "s" "+search" null)
    (leader "u" "+misc" null)
  ];
}
