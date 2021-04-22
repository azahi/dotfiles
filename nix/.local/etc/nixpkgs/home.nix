{ config, pkgs, ... }:
let
  username = "azahi";
  homeDirectory = "/home/${username}";
  localDirectory = "${homeDirectory}/.local";

  xftFont1 = "UW Ttyp0:pixelsize=14:style=Regular:antialias=false";
  xftFont2 = "Efont Biwidth:pixelsize=14:style=Regular:antialias=false";

  colorBlack0 = "#161719";
  colorBlack1 = "#969896";
  colorRed0 = "#cc6666";
  colorRed1 = "#cc6666";
  colorGreen0 = "#b5bd68";
  colorGreen1 = "#b5bd68";
  colorYellow0 = "#f0c674";
  colorYellow1 = "#f0c674";
  colorBlue0 = "#81a2be";
  colorBlue1 = "#81a2be";
  colorMagenta0 = "#b294bb";
  colorMagenta1 = "#b294bb";
  colorCyan0 = "#8abeb7";
  colorCyan1 = "#8abeb7";
  colorWhite0 = "#c5c8c6";
  colorWhite1 = "#ffffff";
in {
  home = {
    username = username;
    homeDirectory = homeDirectory;

    packages = with pkgs; [
      bat
      calibre
      fd
      filezilla
      hledger
      jetbrains.clion
      pandoc
      ripgrep
      toilet
    ];

    stateVersion = "21.05";
  };

  xdg = {
    cacheHome = "${localDirectory}/var/cache";
    configHome = "${localDirectory}/etc";
    dataHome = "${localDirectory}/var/lib";
    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "\$HOME/documents";
      documents = "\$HOME/documents";
      download = "\$HOME/downloads";
      music = "\$HOME/music";
      pictures = "\$HOME/pictures";
      publicShare = "\$HOME/documents";
      templates = "\$HOME/documents";
      videos = "\$HOME/videos";
    };
  };

  programs = {
    home-manager = { enable = true; };

    direnv = {
      enable = true;
      # TODO Test

      enableNixDirenvIntegration = true;
    };

    neovim = {
      enable = true;
      # TODO Fix that error

      extraConfig = ''
        set autoread
        set backspace=indent,eol,start
        set clipboard=unnamed,unnamedplus
        set fillchars=vert:\ "
        set hidden
        set lazyredraw
        set modeline
        set mouse=
        set noshowmode
        set path+=**

        set statusline=
        set statusline+=\ %m%r
        set statusline+=%f\ "
        set statusline+=%1*
        set statusline+=%*
        set statusline+=%=
        set statusline+=%1*
        set statusline+=\ %l:%c/%L\ %p%%\ "
        set statusline+=%*

        set noerrorbells
        set novisualbell

        set splitbelow
        set splitright

        set complete=
        set complete+=.
        set complete+=b
        set complete+=t
        set completeopt=
        set completeopt+=menu
        set completeopt+=longest

        set gdefault
        set hlsearch
        set incsearch
        set iskeyword+=-
        set magic

        set foldmethod=marker
        set nofoldenable

        set shortmess=
        set shortmess+=I
        set shortmess+=T
        set shortmess+=a
        set shortmess+=c
        set shortmess+=t

        set nolist
        set nowrap
        set scrolloff=10
        set sidescrolloff=10

        set number
        set relativenumber

        set wildignorecase
        set wildmenu
        set wildignore=

        set nobackup
        set noswapfile
        set noundofile
        set nowritebackup

        set smartcase
        set ignorecase

        set autoindent
        set breakindent
        set smartindent

        set expandtab
        set shiftround
        set shiftwidth=4
        set smarttab
        set softtabstop=4
        set tabstop=4

        try
            set encoding=utf-8
            scriptencoding utf-8
        catch
        endtry

        if has('autocmd')
            filetype on
            filetype plugin on
            filetype indent on
        endif

        if has('syntax')
            syntax enable
        endif

        let mapleader = ' '

        nnoremap <Expr> j           v:count ? 'j' : 'gj'
        nnoremap <Expr> k           v:count ? 'k' : 'gk'

        nnoremap        J           gt
        nnoremap        K           gT

        nnoremap        <C-a>       ^h
        vnoremap        <C-a>       ^h
        nnoremap        H           ^h
        vnoremap        H           ^h

        nnoremap        <C-e>       $
        vnoremap        <C-e>       $
        nnoremap        L           $
        vnoremap        L           $

        nnoremap        N           Nzzzv
        nnoremap        n           nzzzv

        vnoremap        <           <gv
        vnoremap        >           >gv

        nnoremap        ]b          :<C-u>bnext<CR>
        nnoremap        [b          :<C-u>bprevious<CR>

        nnoremap        <C-h>       <C-w>h
        nnoremap        <C-j>       <C-w>j
        nnoremap        <C-k>       <C-w>k
        nnoremap        <C-l>       <C-w>l

        nnoremap        <C-l>       :<C-u>nohlsearch<Bar>redraw!<Bar>echo<CR><C-l>

        cnoremap        ;/          <C-r>=expand('%:p:h').'/'<CR>
        cnoremap        ;;          <C-r>=expand('%:t')<CR>
        cnoremap        ;.          <C-r>=expand('%:p:r')<CR>

        nnoremap        <Leader>.   :lcd %:p:h<CR>

        cnoremap        <C-a>       <Home>
        cnoremap        <C-e>       <End>

        nnoremap        gw          vapgw

        nnoremap        Q           @q

        nnoremap        <Leader>c   ^v$h
        nnoremap        <Leader>v   ggVG

        map             <Leader>sn  ]s
        map             <Leader>sp  [s
        map             <Leader>sa  zg
        map             <Leader>s?  z=

        nnoremap        <Leader>y   "+y
        nnoremap        <Leader>Y   "+Y

        nnoremap        <Leader>p   "+p
        nnoremap        <Leader>P   "+P

        inoremap        <C-v>       <C-c>"+pi
        cnoremap        <C-v>       <C-r>+

        nmap            <Leader>w   :<C-u>w!<CR>
        nmap            <Leader>wq  :<C-u>wq!<CR>

        nnoremap        ZX          :<C-u>qa!<CR>

        nnoremap        <Leader>q   :q<CR>

        function! SwitchCase()
            normal! ~
            if strlen(getline('.')) != virtcol('.')
                normal! h
            endif
        endfunction
        nnoremap        ~           :<C-u>call SwitchCase()<CR>

        function! MapGoToTab()
            let s:i = 1
            while s:i < 10
                exe 'nnoremap <Leader>' . s:i . ' :<C-u>tabnext ' . s:i . '<CR>'
                let s:i += 1
            endwhile
        endfunction
        call MapGoToTab()

        autocmd BufEnter * set noreadonly

        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
      '';

      extraPackages = with pkgs; [
        ccls
        clang
        editorconfig-core-c
        gopls
        haskell-language-server
        nixfmt
        pipenv
        poetry
        shellcheck
        shfmt
        texlab
        wakatime
      ];

      extraPython3Packages = (ps:
        with ps; [
          autopep8
          black
          isort
          mccabe
          nose
          pip
          pyflakes
          pylint
          pyls-black
          pyls-isort
          pytest
          python-language-server
          setuptools
          virtualenv
        ]);

      plugins = with pkgs.vimPlugins; [
        # TODO Add suda.vim
        SyntaxRange
        ansible-vim
        auto-pairs
        calendar-vim
        csv-vim
        editorconfig-vim
        gentoo-syntax
        neco-vim
        neoinclude
        nginx-vim
        rainbow_parentheses
        vim-abolish
        vim-commentary
        vim-cool
        vim-eunuch
        vim-expand-region
        vim-fugitive
        vim-gnupg
        vim-husk
        vim-illuminate
        vim-lastplace
        vim-nix
        vim-obsession
        vim-polyglot
        vim-python-pep8-indent
        vim-repeat
        vim-rhubarb
        vim-shellcheck
        vim-sleuth
        vim-speeddating
        vim-surround
        vim-tmux
        vim-tmux-focus-events
        vim-unimpaired
        vim-wakatime
        {
          plugin = vim-sneak;
          config = ''
            let g:sneak#label = 1

            nmap f <Plug>Sneak_f
            nmap F <Plug>Sneak_F
            vmap f <Plug>Sneak_f
            vmap F <Plug>Sneak_F

            nmap t <Plug>Sneak_t
            nmap T <Plug>Sneak_T
            vmap t <Plug>Sneak_t
            vmap T <Plug>Sneak_T

            nmap <Plug>(Go_away_Sneak_s) <Plug>Sneak_s
            nmap <Plug>(Go_away_Sneak_S) <Plug>Sneak_S
          '';
        }
        {
          plugin = supertab;
          config = ''
            let g:SuperTabDefaultCompletionType = '<C-n>'
          '';
        }
        {
          plugin = vim-clang-format;
          config = ''
            nnoremap <Buffer><Leader>cf :<C-u>ClangFormat<CR>
            vnoremap <Buffer><Leader>cf :<C-u>ClangFormat<CR>
          '';
        }
        {
          plugin = LanguageClient-neovim;
          config = ''
            let g:LanguageClient_loadSettings = 1

            nnoremap <Leader>lm :<C-u>call LanguageClient_contextMenu()<CR>
            nnoremap <Leader>la :<C-u>call LanguageClient_workspace_applyEdit()<CR>
            nnoremap <Leader>lc :<C-u>call LanguageClient#textDocument_completion()<CR>
            nnoremap <Leader>ld :<C-u>call LanguageClient#textDocument_definition()<CR>
            nnoremap <Leader>le :<C-u>call LanguageClient#textDocument_references()<CR>
            nnoremap <Leader>lf :<C-u>call LanguageClient#textDocument_formatting()<CR>
            nnoremap <Leader>lh :<C-u>call LanguageClient#textDocument_hover()<CR>
            nnoremap <Leader>lr :<C-u>call LanguageClient#textDocument_rename()<CR>
            nnoremap <Leader>ls :<C-u>call LanguageClient#textDocument_documentSymbol()<CR>
            nnoremap <Leader>lt :<C-u>call LanguageClient#textDocument_typeDefinition()<CR>

            let g:LanguageClient_serverCommands = {}

            if executable('ccls')
                let g:LanguageClient_serverCommands[ 'c'   ] = [ 'ccls' ]
                let g:LanguageClient_serverCommands[ 'cpp' ] = [ 'ccls' ]

                nnoremap <Leader>h :<C-u>call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<CR>
                nnoremap <Leader>j :<C-u>call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<CR>
                nnoremap <Leader>k :<C-u>call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<CR>
                nnoremap <Leader>l :<C-u>call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<CR>
            elseif executable('clangd')
                let g:LanguageClient_serverCommands[ 'c'   ] = [ 'clangd', '-background-index' ]
                let g:LanguageClient_serverCommands[ 'cpp' ] = [ 'clangd', '-background-index' ]
            endif

            if executable('gopls')
                let g:LanguageClient_serverCommands[ 'go' ] = [ 'gopls' ]
            endif

            if executable('haskell-language-server-wrapper')
                let g:LanguageClient_serverCommands[ 'haskell' ] = [ 'haskell-language-server-wrapper', '--lsp' ]
            endif

            if executable('pyls')
                let g:LanguageClient_serverCommands[ 'python' ] = [ 'pyls' ]
            endif
          '';
        }
      ];

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      withNodeJs = false;
      withPython = false;
      withPython3 = true;
      withRuby = false;
    };

    qutebrowser = {
      enable = false;
      # TODO

      keyBindings = {
        normal = { "z" = "hint links spawn --detach mpv {hint-url}"; };
      };
      searchEngines = {
        d = "https://duckduckgo.com/?q={}'";
        g = "https://www.google.com/search?q={}";
        aw = "https://wiki.archlinux.org/?search={}";
        nw = "https://nixos.wiki/index.php?search={}";
      };
    };

    readline = {
      enable = false;
      # TODO Test

      bindings = {
        "$" = "end-of-line";
        "/" = "forward-search-history";
        "?" = "reverse-search-history";
        "G" = "end-of-history";
        "\\C-a" = "beginning-of-line";
        "\\C-e" = "end-of-line";
        "\\C-l" = "clear-screen";
        "\\C-n" = "history-search-forward";
        "\\C-p" = "history-search-backward";
        "\\C-w" = "backward-kill-word";
        "\\t" = "menu-complete";
        "^" = "beginning-of-line";
        "b" = "backward-word";
        "gg" = "beginning-of-history";
        "j" = "history-search-forward";
        "k" = "history-search-backward";
        "w" = "forward-word";
        "x" = "delete-char";
      };
      variables = {
        bell-style = "visible";
        bind-tty-special-chars = false;
        blink-matching-paren = true;
        colored-completitrue-prefix = true;
        colored-stats = true;
        completitrue-ignore-case = true;
        ctruevert-meta = false;
        echo-ctruetrol-characters = false;
        editing-mode = "vi";
        input-meta = true;
        mark-symlinked-directories = true;
        match-hidden-files = false;
        menu-complete-display-prefix = true;
        meta-flag = true;
        output-meta = true;
        page-completitrues = true;
        show-all-if-ambiguous = true;
        show-all-if-unmodified = true;
        show-mode-in-prompt = true;
        visible-stats = true;
      };
      extraConfig = ''
        $if term=linux
          set vi-ins-mode-string \1\e[?0c\2
          set vi-cmd-mode-string \1\e[?8c\2
        $else
          set vi-ins-mode-string \1\e[6 q\2
          set vi-cmd-mode-string \1\e[2 q\2
        $endif
      '';
    };

    ssh = {
      enable = false;

      compression = true;
      controlMaster = "auto";
      controlPath = "${homeDirectory}/.ssh/%r@%h:%p.sock";
      controlPersist = "24H";
      hashKnownHosts = true;
      serverAliveCountMax = 30;
      serverAliveInterval = 60;
      matchBlocks = {
        # TODO Add masked work hosts?
        "github" = {
          hostname = "github.com";
          user = "git";
        };
        "gitlab" = {
          hostname = "gitlab.com";
          user = "git";
        };
        "bitbucket" = {
          hostname = "bitbucket.com";
          user = "git";
        };
        "azahi" = {
          hostname = "azahi.cc";
          user = "azahi";
          port = 22022;
        };
        "yavanna" = {
          hostname = "yavanna.azahi.cc";
          user = "azahi";
          port = 22022;
        };
      };
    };

    tmux = {
      enable = false;

      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      disableConfirmationPrompt = true;
      escapeTime = 0;
      keyMode = "vi";
      newSession = true;
      resizeAmount = 10;
      shortcut = "b";
      terminal = "screen-256color";

      # TODO
    };

    vscode = {
      enable = false;
      # TODO

      haskell = {
        enable = true;
        hie = {
          enable = false;
          # TODO
        };
      };
    };

    zathura = {
      enable = false;
      # TODO
    };
  };

  services = {
    # TODO Test on systemd
    dunst = {
      enable = false;
      # TODO
    };

    dwm-status = {
      enable = false;
      # TODO
    };

    emacs = {
      enable = false;
      # TODO
    };

    gpg-agent = {
      enable = false;
      # TODO Test

      enableSshSupport = true;

      defaultCacheTtl = 999999;
      defaultCacheTtlSsh = 999999;
      maxCacheTtl = 999999;
      maxCacheTtlSsh = 999999;

      grabKeyboardAndMouse = true;

      pinentryFlavor = "qt";
    };

    mbsync = {
      enable = false;
      # TODO
    };

    mpd = {
      enable = false;
      # TODO
    };
  };

  xresources = {
    properties = {
      "*.font" = "${xftFont1}";

      "Xcursor.theme" = "core";
      "Xcursor.theme_core" = "true";
      "Xcursor.size" = 16;

      "Xft.antialias" = 1;
      "Xft.autohint" = 0;
      "Xft.dpi" = 96;
      "Xft.hinting" = 1;
      "Xft.hintstyle" = "hintslight";
      "Xft.lcdfilter" = "lcddefault";
      "Xft.rgba" = "rgb";

      "*.color0" = "${colorBlack0}";
      "*.color8" = "${colorBlack1}";
      "*.color1" = "${colorRed0}";
      "*.color9" = "${colorRed1}";
      "*.color2" = "${colorGreen0}";
      "*.color10" = "${colorGreen1}";
      "*.color3" = "${colorYellow0}";
      "*.color11" = "${colorYellow1}";
      "*.color4" = "${colorBlue0}";
      "*.color12" = "${colorBlue1}";
      "*.color5" = "${colorMagenta0}";
      "*.color13" = "${colorMagenta1}";
      "*.color6" = "${colorCyan0}";
      "*.color14" = "${colorCyan1}";
      "*.color7" = "${colorWhite0}";
      "*.color15" = "${colorWhite1}";

      "*.background" = "${colorBlack0}";
      "*.foreground" = "${colorWhite0}";
    };
  };
}
