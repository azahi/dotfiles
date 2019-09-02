;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(doom! :input
       chinese
       japanese

       :completion
       (company
        +auto
        -childframe
        +tng)
       (helm
        -childframe
        +fuzzy)

       :ui
       deft
       doom
       hl-todo
       indent-guides
       nav-flash
       ophints
       (popup
        +all
        +defaults)
       treemacs
       vc-gutter
       (window-select
        +ace-window)
       workspaces

       :editor
       (evil
        +everywhere)
       file-templates
       fold
       (format
        -onsave)
       lispy
       multiple-cursors
       parinfer
       rotate-text
       snippets

       :emacs
       (dired
        +ranger
        +icons)
       electric
       vc

       :term
       eshell
       shell
       term

       :tools
       debugger
       direnv
       eval
       docker
       editorconfig
       ein
       flycheck
       flyspell
       gist
       lookup
       lsp
       macos
       magit
       make
       pass
       pdf
       prodigy
       rgb
       tmux
       upload

       :lang
       assembly
       (cc
        +lsp
        +irony
        +rtags)
       common-lisp
       csharp
       data
       emacs-lisp
       ess
       (go
        +lsp)
       (haskell
        +intero)
       (java
        +meghanada)
       javascript
       latex
       ledger
       markdown
       (org
        +attach
        +babel
        +capture
        +export
        +habit
        +ipython
        +present
        +protocol)
       plantuml
       python
       qt
       racket
       rest
       scheme
       (sh
        +lsp)
       (web
        -lsp)

       :email
       (mu4e
        +gmail)
       notmuch

       :app
       calendar
       irc
       (rss
        +org)
       twitter
       (write
        +wordnut
        +langtool)

       :config
       (default
        +bindings
        +smartparens))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
