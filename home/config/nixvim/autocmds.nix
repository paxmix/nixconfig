_: {
  autoCmd = [
    # Highlight on yank
    {
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank({
              higroup = "IncSearch", 
              timeout = 150,        
            })
          end
        '';
      };
    }
    # go to last loc when opening a buffer
    {
      event = [ "BufReadPost" ];
      callback = {
        __raw = ''
          function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
      };
    }
  ];
}
