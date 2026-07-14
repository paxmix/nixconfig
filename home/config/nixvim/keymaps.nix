{
  keymaps = [
    {
      mode = "i";
      key = "jk";
      action = "<esc><esc>";
    }
    {
      mode = "i";
      key = "<C-e>";
      action = "<End>";
    }
    {
      mode = "i";
      key = "<C-a>";
      action = "<Home>";
    }
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
    # Buffer
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
      action = ">gv";
    }
    # Flash
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
      options = {
        desc = "Flash jump";
      };
    }
    # Alt + j k to move lines
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>execute 'move .+' . v:count1<cr>==";
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
    }
    {
      mode = "i";
      key = "<A-j>";
      action = "<esc><cmd>m .+1<cr>==gi";
    }
    {
      mode = "i";
      key = "<A-k>";
      action = "<esc><cmd>m .-2<cr>==gi";
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv";
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
    }
  ];
}
