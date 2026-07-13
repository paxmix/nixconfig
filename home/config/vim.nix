_: {
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
      mouse = "a";
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      ignorecase = true;
      smartcase = true;
    };
    extraConfig = ''
      			set clipboard=unnamedplus
      			filetype plugin indent on
      			syntax on
      			set autoindent
      			set smartindent
      			set hlsearch
      			set incsearch
      			let mapleader = " "

      			nnoremap <leader><space> :nohlsearch<CR>
                  inoremap jk <Esc>
      		'';

  };
}
