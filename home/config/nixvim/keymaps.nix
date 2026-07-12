{
  keymaps = [
    # Clear search highlight with <esc>
    {
      mode = "n";
      key = "<esc>";
      action = "<cmd>noh<cr>";
    }
    # Better window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
    }
    # Buffer cycling (Shift + H/L)
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
    }
    # Maintain indentation when visual shifting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = "<gv";
    }
  ];
}
