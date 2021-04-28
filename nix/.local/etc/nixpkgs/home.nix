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
      (pass.withExtensions (ext: with ext; [ pass-audit pass-otp pass-update ]))
      abi-compliance-checker
      abi-dumper
      ag
      bear
      bloaty
      bsdiff
      calibre
      ccls
      cflow
      cloc
      colordiff
      convmv
      cppcheck
      cproto
      creduce
      cscope
      ctags
      cuetools
      dos2unix
      doxygen
      editorconfig-core-c
      fd
      filezilla
      fzy
      glslang
      gnuplot
      graphviz
      haskell-language-server
      hledger
      jetbrains.clion
      ltrace
      lynx
      mediainfo
      mktorrent
      mp3val
      nixfmt
      pandoc
      patchelf
      patchutils
      pv
      pwgen
      ripgrep
      rlwrap
      sbcl
      scanmem
      shellcheck
      shfmt
      shntool
      speedtest-cli
      splint
      split2flac
      strace
      surfraw
      texlab
      texlive.combined.scheme-small
      toilet
      translate-shell
      tree
      valgrind
      vbindiff
      vmtouch
      vtable-dumper
      wakatime
    ];

    keyboard = {
      layout = "us,ru";
      variant = ",phonetic";
      options = [
        "caps:escape_shifted_capslock"
        "compose:menu"
        "grp:win_space_toggle"
        "terminate:ctrl_alt_bksp"
      ];
    };

    stateVersion = "21.05";
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
    home-manager = { enable = true; };

    aria2 = {
      enable = true;

      settings = {
        bt-max-peers = 128;
        bt-save-metadata = true;
        continue = true;
        disable-ipv6 = true;
        enable-dht = true;
        enable-peer-exchange = true;
        enable-rpc = false;
        follow-torrent = true;
        log-level = "info";
        max-connection-per-server = 16;
        max-overall-upload-limit = "1K";
        max-tries = 5;
        max-upload-limit = "1K";
        min-split-size = "1M";
        seed-ratio = 0.1;
        seed-time = 0.1;
        stream-piece-selector = "default";
        timeout = 60;
      };
    };

    bash = {
      enable = false;
      enableVteIntegration = true;

      shellOptions = [
        "cdspell"
        "checkjobs"
        "checkwinsize"
        "dirspell"
        "extglob"
        "globstar"
        "histappend"
        "histreedit"
        "histverify"
      ];

      historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
      historyFile = "${varLibDirectory}/bash/history";
      historyFileSize = 100000;

      logoutExtra = ''
        if [ -f "\$HOME/.bin/logout-hook" ]
        then
            # shellcheck disable=SC1090
            source "\$HOME/.bin/logout-hook"
        fi
      '';
    };

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
        import = {
          write = true;
          copy = true;
          move = false;
          bell = true;
        };
        match.preferred.countries = [ "JP" "GB|UK" "AU" "US" "RU" "XE" ];
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

    browserpass = {
      enable = false;

      browsers = [ "chromium" "firefox" ];
    };

    chromium = {
      enable = false;

      extensions = [{ id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }];
    };

    direnv = {
      enable = true;
      enableNixDirenvIntegration = true;
    };

    exa = {
      enable = false;
      enableAliases = true;
    };

    firefox = {
      enable = false;

      profiles = {
        default = {
          settings = {
            "browser.fixup.alternate.enabled" = false;
            "browser.newtabpage.activity-stream.feeds.section.highlights" =
              false;
            "browser.newtabpage.activity-stream.feeds.snippets" = false;
            "browser.newtabpage.activity-stream.showSearch" = false;
            "browser.newtabpage.activity-stream.showTopSites" = false;
            "browser.newtabpage.enhanced" = false;
            "browser.onboarding.enabled" = false;
            "browser.startup.homepage" = "about:home";
            "browser.tabs.warnOnClose" = false;
            "devtools.debugger.prompt-connection" = false;
            "extensions.pocket.enabled" = false;
            "general.warnOnAboutConfig" = false;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          };
        };
      };
    };

    git = {
      enable = false;

      userName = name;
      userEmail = email;

      signing = {
        key = email;
        signByDefault = true;
      };

      extraConfig = {
        core = {
          attributesFile = "${homeDirectory}/.gitattributes";
          excludesFile = "${homeDirectory}/.gitignore";
          whitespace = "trailing-space";
        };
        init.defaultBranch = "master";
        diff = {
          mnemonicPrefix = true;
          renames = "copies";
          submodule = "log";
        };
        branch = {
          autoSetupMerge = "always";
          autoSetupRebase = "always";
        };
        merge = {
          conflictStyle = "diff3";
          ff = "only";
        };
        rebase = {
          autoSquash = true;
          autoStash = true;
        };
        fetch = { prune = true; };
        push = {
          default = "current";
          followTags = true;
        };
        pull = {
          ff = "only";
          rebase = true;
        };
        status.submoduleSummary = true;
        advice.detachedHead = false;
        color.ui = true;
      };

      aliases = {
        ad = "add";
        ada = "add --all";
        al = "config --get-regexp alias";
        br = "branch --all";
        ch = "checkout";
        cho = "checkout --orphan";
        ci = "commit --edit";
        cia = "commit --amend";
        cias = "commit --amend --signoff";
        cl = "clone";
        clr = "clone --recurse-submodules";
        cls = "clone --depth=1";
        cp = "cherry-pick";
        di = "!git diff-index --quiet HEAD && git diff --patch-with-stat";
        fe = "fetch";
        fer = "fetch --all --recurse-submodules";
        fuck = "reset --hard";
        gud = "commit --message=git gud";
        lo = "log --all decorate --abbrev-commit --graph";
        ls = "ls-files";
        me = "merge";
        pl = "pull";
        plr = "pull --all --recurse-submodules";
        ps = "push";
        rb = "rebase";
        re = "reset HEAD";
        ree = "reset HEAD^";
        reee = "reset HEAD^^";
        setup = "!git init && git commit --allow-empty --message Initial";
        st = "status --short";
        sw = "switch";
        ui = "update-index --assume-unchanged";
        uiu = "update-index --un-assume-unchanged";
        wc = "whatchanged -p --abbrev-commit --pretty=medium";
        wtc = "!curl -s whatthecommit.com/index.txt | git commit --file -";
      };

      ignores = [
        "*.bak"
        "*.tmp"
        "*~"
        ".ccls-cache/"
        ".clangd/"
        ".dir-locals.el"
        ".gdb_history"
        ".idea/"
        ".netrwhist"
        ".svn/"
        ".vscode/"
        ".wakatime-project"
        "[._]*.s[a-v][a-z]"
        "[._]*.sw[a-p]"
        "[._]s[a-rt-v][a-z]"
        "[._]ss[a-gi-z]"
        "[._]sw[a-p]"
        "\\#*\\#"
        "a.out"
        "cmake-build-*/"
        "compile_commands.json"
        "cscope.*"
        "vgcore.*"
      ];

      delta = { enable = false; };

      lfs = { enable = false; };
    };

    gpg = {
      enable = false;

      settings = {
        display-charset = "utf-8";
        enable-progress-filter = true;
        fixed-list-mode = true;
        keyid-format = "0xlong";
        no-comments = true;
        no-emit-version = true;
        no-greeting = true;
        with-fingerprint = true;

        armor = true;

        use-agent = true;

        list-options = "show-uid-validity show-usage";
        verify-options = "show-uid-validity";

        default-preference-list =
          "SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";

        personal-cipher-preferences = "AES256 AES192 AES";
        personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
        personal-digest-preferences = "SHA512 SHA384 SHA256 SHA224";

        s2k-cipher-algo = "AES256";
        s2k-digest-algo = "SHA512";

        digest-algo = "SHA512";
        cert-digest-algo = "SHA512";

        no-random-seed-file = true;

        keyserver = [
          "hkps://hkps.pool.sks-keyservers.net"
          "hkps://keys.gnupg.net"
          "hkps://keys.openpgp.org"
          "hkps://pgp.mit.edu"
        ];
        keyserver-options =
          [ "auto-key-retrieve" "no-honor-keyserver-url" "no-include-revoked" ];
      };
    };

    htop = {
      enable = true;

      accountGuestInCpuMeter = true;
      cpuCountFromZero = true;
      delay = 10;
      detailedCpuTime = true;
      enableMouse = false;
      headerMargin = true;
      hideKernelThreads = true;
      hideThreads = true;
      hideUserlandThreads = true;
      highlightBaseName = true;
      highlightMegabytes = true;
      highlightThreads = true;
      shadowOtherUsers = true;
      showCpuFrequency = true;
      showCpuUsage = true;
      showProgramPath = false;
      showThreadNames = false;
      treeView = true;
      updateProcessNames = true;
    };

    info.enable = false;

    jq.enable = true;

    lesspipe.enable = true;

    man = { enable = true; };

    mbsync = { enable = false; };

    mpv = {
      enable = false;

      bindings = {
        "RIGHT" = "seek  10";
        "LEFT" = "seek -10";
        "UP" = "seek 60";
        "DOWN" = "seek -60";

        "Shift+RIGHT" = "no-osd seek  1 exact";
        "Shift+LEFT" = "no-osd seek -1 exact";
        "Shift+UP" = "no-osd seek  5 exact";
        "Shift+DOWN" = "no-osd seek -5 exact";

        "ALT+k" = "add sub-scale +0.1";
        "ALT+j" = "add sub-scale -0.1";

        "B" = ''cycle-values background "#000000" "#ffffff"'';
      };

      profiles = {
        "protocol.http" = { force-window = "immediate"; };
        "protocol.https" = { profile = "protocol.http"; };
        "extension.webm" = {
          cache = "no";
          loop-file = "inf";
        };
        "extension.gif" = { profile = "extension.gif"; };
      };

      config = {
        # General
        audio-display = "no";
        autofit-larger = "100%x95%";
        cursor-autohide = 1000;
        force-seekable = "no";
        fullscreen = true;
        load-unsafe-playlists = true;
        msg-color = true;
        msg-module = true;
        prefetch-playlist = true;
        save-position-on-quit = false;
        screenshot-format = "jpg";
        screenshot-template = "%F [%p]";
        stop-screensaver = true;
        term-osd-bar = true;
        use-filedir-conf = true;

        # OSD
        osd-bar-align-y = 0;
        osd-bar-h = 2;
        osd-bar-w = 60;
        osd-border-color = "#FF262626";
        osd-border-size = 2.5;
        osd-color = "#FFFFFFFF";
        osd-duration = 2500;
        osd-font-size = 40;
        osd-fractions = true;
        osd-level = 1;
        osd-shadow-color = "#33000000";
        osd-status-msg =
          "\${time-pos} / \${duration}\${?percent-pos: (\${percent-pos}%)}\${?frame-drop-count:\${!frame-drop-count==0: Dropped: \${frame-drop-count}}}\\n\${?chapter:Chapter: \${chapter}}";

        # OSC
        osc = false;

        # Subtitles
        sub-auto = "fuzzy";
        sub-file-paths-append = "srt";
        sub-ass-force-margins = true;
        sub-ass-force-style = "kerning=yes";
        sub-fix-timing = true;
        sub-use-margins = true;
        sub-font-size = 40;
        sub-color = "#FFFFFFFF";
        sub-border-color = "#FF262626";
        sub-border-size = 2.5;
        sub-shadow-offset = 1;
        sub-shadow-color = "#33000000";
        sub-spacing = 0.5;

        # Languages
        alang =
          "japanese,jp,jpn,jaJP,ja-JP,english,en,eng,enUS,en-US,russian,ru,rus,ruRU,ru-RU";
        slang =
          "japanese,jp,jpn,jaJP,ja-JP,english,en,eng,enUS,en-US,russian,ru,rus,ruRU,ru-RU";

        # YTDL
        ytdl = true;
        ytdl-raw-options = ''
          sub-lang="jp,jpn,jaJP,ja-JP,en,eng,enUS,en-US,ru,rus,ruRU,ru-RU",write-sub='';
        ytdl-format =
          "(bestvideo[height<=?1080][fps<=?30][protocol!=http_dash_segments])+(bestaudio[acodec=opus]/bestaudio)/best";

        # Audio
        audio-file-auto = "fuzzy";
        volume = 100;
        volume-max = 200;

        # Video
        blend-subtitles = true;
      };

      scripts = with pkgs.mpvScripts; [ autoload ];
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

      extraPackages = with pkgs; [
        bear
        ccls
        cscope
        ctags
        editorconfig-core-c
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
          pytest
          python-language-server
          setuptools
          virtualenv
        ]);

      plugins = with pkgs.vimPlugins; [
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

      withNodeJs = false;
      withPython = false;
      withPython3 = true;
      withRuby = false;
    };

    qutebrowser = {
      enable = false;

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
      enable = true;

      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      disableConfirmationPrompt = true;
      escapeTime = 0;
      historyLimit = 50000;
      newSession = true;
      resizeAmount = 10;
      terminal = "screen-256color";

      extraConfig = ''
        set -g set-titles on

        set -g status-left  ""
        set -g status-right ""

        set -g detach-on-destroy off

        set -g status-keys emacs
        set -g mode-keys   vi

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind -r H resize-pane -L 10
        bind -r J resize-pane -D 10
        bind -r K resize-pane -U 10
        bind -r L resize-pane -R 10

        bind < swap-pane -D
        bind > swap-pane -U

        bind , swap-window -t -1
        bind . swap-window -t +1

        bind Tab last-window

        bind _ split-window -v
        bind | split-window -h
      '';
    };

    vscode = {
      enable = false;
      package = pkgs.vscodium;

      extensions = with pkgs.vscode-extensions; [
        WakaTime.vscode-wakatime
        file-icons.file-icons
        haskell.haskell
        llvm-org.lldb-vscode
        ms-azuretools.vscode-docker
        ms-dotnettools.csharp
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-python.python
        ms-vscode-remote.remote-ssh
        ms-vscode.Go
        ms-vscode.cpptools
        redhat.vscode-yaml
        vscodevim.vim
      ];
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

  qt = { enable = false; };

  services = {
    gpg-agent = {
      enable = false;

      enableSshSupport = true;

      defaultCacheTtl = 999999;
      defaultCacheTtlSsh = 999999;
      maxCacheTtl = 999999;
      maxCacheTtlSsh = 999999;

      grabKeyboardAndMouse = true;

      pinentryFlavor = "qt";
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
