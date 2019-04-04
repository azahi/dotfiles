;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(doom! :feature
       debugger
       eval
       (evil
         +everywhere)
       file-templates
       lookup
       snippets
       workspaces

       :completion
       company
       helm

       :ui
       deft
       doom
       doom-dashboard
       doom-quit
       evil-goggles
       hl-todo
       indent-guides
       modeline
       nav-flash
       (popup
         +all
         +defaults)
       pretty-code
       treemacs
       vc-gutter
       vi-tilde-fringe
       window-select

       :editor
       fold
       (format +onsave)
       lispy
       multiple-cursors
       parinfer
       rotate-text

       :emacs
       (dired
         +ranger
         +icons)
       electric
       eshell
       imenu
       term
       vc

       :tools
       docker
       editorconfig
       flycheck
       flyspell
       gist
       lsp
       magit
       make
       password-store
       pdf
       prodigy
       rgb
       tmux
       upload
       wakatime
       vterm

       :lang
       assembly
       (cc
         +irony
         +rtags)
       common-lisp
       csharp
       data
       emacs-lisp
       ess
       go
       (haskell +intero)
       (java +meghanada)
       javascript
       latex
       ledger
       markdown
       (org
        +attach
        +babel
        +capture
        +export
        +present)
       plantuml
       python
       qt
       racket
       rest
       rust
       sh
       web

       :app
       (email
         +gmail)
       irc
       (rss
         +org)
       (write
        +wordnut
        +langtool)

       :config
       (default
         +bindings
         +smartparens))
