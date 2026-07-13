_: {
  autoGroups = {
    highlight_yank.clear = true;
    last_loc_recovery.clear = true;
    close_with_q.clear = true;
    man_unlisted.clear = true;
  };
  autoCmd = [
    {
      group = "highlight_yank";
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
    {
      group = "last_loc_recovery";
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
    {
      event = [ "FileType" ];
      group = "close_with_q";
      pattern = [
        "PlenaryTestPopup"
        "checkhealth"
        "dap-float"
        "dbout"
        "gitsigns-blame"
        "grug-far"
        "help"
        "lspinfo"
        "neotest-output"
        "neotest-output-panel"
        "neotest-summary"
        "notify"
        "qf"
        "spectre_panel"
        "startuptime"
        "tsplayground"
      ];
      callback = {
        __raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.schedule(function()
              vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
              end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer",
              })
            end)
          end
        '';
      };
    }
    {
      event = [ "FileType" ];
      group = "man_unlisted";
      pattern = [ "man" ];
      callback = {
        __raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
          end
        '';
      };
    }
  ];
}
