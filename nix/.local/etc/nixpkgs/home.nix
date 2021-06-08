{ config, pkgs, ... }:
let
  name = "Azat Bahawi";
  username = "azahi";
  email = "${username}@teknik.io";
  homeDirectory = "/home/${username}";
  localDirectory = "${homeDirectory}/.local";
  etcDirectory = "${localDirectory}/etc";
  varLibDirectory = "${localDirectory}/var/lib";
  varCacheDirectory = "${localDirectory}/var/cache";

  font1 = "UW Ttyp0";
  font2 = "Efont Biwidth";
  xftBase = ":pixelsize=14:style=Regular:antialias=false";
  xftFont1 = "${font1}${xftBase}";
  xftFont2 = "${font2}${xftBase}";

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
      ansible
      bat
      bear
      cabal-install
      calibre
      clang-tools
      clang_11
      cmake-language-server
      cuetools
      doxygen
      emscripten
      fd
      filezilla
      ghc
      gnuplot
      gocode
      gomodifytags
      gore
      gotests
      graphicsmagick
      graphicsmagick-imagemagick-compat
      graphviz
      haskell-language-server
      hledger
      include-what-you-use
      jetbrains.clion
      jetbrains.datagrip
      jre
      mediainfo
      mktorrent
      mp3val
      nixfmt
      pandoc
      plan9port
      plantuml
      python-language-server
      python38Packages.adblock
      python38Packages.black
      python38Packages.isort
      python38Packages.pyflakes
      rappel
      ripgrep
      ripgrep-all
      shellcheck
      shfmt
      shntool
      speedtest-cli
      split2flac
      sqlitebrowser
      stack
      stdman
      texlab
      texlive.combined.scheme-small
      toilet
      translate-shell
      yaml-language-server
    ];

    stateVersion = "21.11";
  };

  xdg = {
    configHome = etcDirectory;
    dataHome = varLibDirectory;
    cacheHome = varCacheDirectory;

    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "$HOME/documents";
      documents = "$HOME/documents";
      download = "$HOME/downloads";
      music = "$HOME/music";
      pictures = "$HOME/pictures";
      publicShare = "$HOME/documents";
      templates = "$HOME/documents";
      videos = "$HOME/videos";
    };
  };

  programs = {
    home-manager.enable = true;

    bat = {
      enable = true;

      config = {
        style = "plain";
        tabs = "4";
        theme = "base16";
        wrap = "never";
      };
    };

    beets = {
      enable = true;

      settings = {
        library = "${varLibDirectory}/beets/library.db";
        directory = "${homeDirectory}/music";
        plugins = "badfiles edit fetchart info mbsync scrub";
        original_date = true;
        import = {
          write = true;
          copy = true;
          move = false;
          bell = true;
          from_scratch = true;
        };
        match = {
          preferred = {
            countries = [ "JP" "KR" "TW" "HK" "CN" "RU" "GB|UK" "AU" "NZ" "US" ];
            original_year = true;
          };
        };
        edit = {
          albumfields = "album artist albumartist";
          itemfields =
            "track title album artist albumartist day month year genre";
        };
        fetchart = {
          auto = true;
          cautious = true;
          cover_names =
            "cover Cover folder Folder art Art album Album front Front";
          sources = "filesystem coverart itunes amazon albumart wikipedia";
        };
        scrub.auto = true;
      };
    };

    direnv = {
      enable = true;
      enableNixDirenvIntegration = true;
    };

    neovim = {
      enable = true;

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
      '';

      plugins = with pkgs.vimPlugins; [
        ansible-vim
        auto-pairs
        calendar-vim
        csv-vim
        editorconfig-vim
        gentoo-syntax
        neco-vim
        neoinclude-vim
        nginx-vim
        rainbow_parentheses-vim
        vim-SyntaxRange
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
        vim-repeat
        vim-rhubarb
        vim-shellcheck
        vim-sleuth
        vim-sneak
        vim-speeddating
        vim-surround
        vim-tmux
        vim-tmux-focus-events
        vim-unimpaired
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

      withNodeJs = false;
      withPython3 = true;
      withRuby = false;
    };

    zathura = {
      enable = true;

      options = {
        font = font1;

        default-fg = colorWhite0;
        default-bg = colorBlack0;

        statusbar-fg = colorBlack0;
        statusbar-bg = colorWhite0;

        inputbar-fg = colorBlack0;
        inputbar-bg = colorGreen1;

        notification-fg = colorBlack0;
        notification-bg = colorBlue1;

        notification-error-fg = colorBlack0;
        notification-error-bg = colorRed1;

        notification-warning-fg = colorBlack0;
        notification-warning-bg = colorYellow1;

        highlight-color = colorYellow1;
        highlight-active-color = colorYellow0;

        completion-fg = colorWhite1;
        completion-bg = colorBlack1;

        completion-highlight-fg = colorBlack0;
        completion-highlight-bg = colorRed1;

        completion-group-fg = colorBlack0;
        completion-group-bg = colorRed1;

        recolor-darkcolor = colorBlack0;
        recolor-lightcolor = colorWhite0;

        recolor = true;
        recolor-keephue = false;
        recolor-reverse-video = false;

        highlight-transparency = "0.3";

        n-completion-items = 10;

        guioptions = "";

        statusbar-basename = true;
        statusbar-home-tilde = true;

        statusbar-h-padding = 0;
        statusbar-v-padding = 0;

        window-height = 800;
        window-width = 600;

        window-icon = "";

        abort-clear-search = true;

        incremental-search = true;

        adjust-open = "best-fit";

        advance-pages-per-row = false;

        database = "sqlite";

        dbus-service = false;

        page-padding = 0;

        pages-per-row = 1;

        render-loading = false;

        show-directories = true;
        show-hidden = true;
        show-recent = 10;

        link-zoom = true;
        link-hadjust = true;

        window-title-basename = true;
        window-title-home-tilde = true;
        window-title-page = true;

        zoom-center = false;
        zoom-max = 1000;
        zoom-min = 10;
        zoom-step = 10;

        scroll-hstep = -1;
        scroll-step = 40;
        scroll-full-overlap = 0;
        scroll-wrap = true;
        scroll-page-aware = false;

        selection-clipboard = "primary";
        selection-notification = false;
      };
    };
  };

  xresources = {
    properties = {
      "*.font" = xftFont1;

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

      "*.color0" = colorBlack0;
      "*.color8" = colorBlack1;
      "*.color1" = colorRed0;
      "*.color9" = colorRed1;
      "*.color2" = colorGreen0;
      "*.color10" = colorGreen1;
      "*.color3" = colorYellow0;
      "*.color11" = colorYellow1;
      "*.color4" = colorBlue0;
      "*.color12" = colorBlue1;
      "*.color5" = colorMagenta0;
      "*.color13" = colorMagenta1;
      "*.color6" = colorCyan0;
      "*.color14" = colorCyan1;
      "*.color7" = colorWhite0;
      "*.color15" = colorWhite1;

      "*.background" = colorBlack0;
      "*.foreground" = colorWhite0;
    };
  };
}
