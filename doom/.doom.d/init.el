;;; init.el -*- lexical-binding: t; -*-

(doom! :input
       japanese

       :completion
       (company +tng)
       (ivy +fuzzy +prescient)

       :ui
       deft
       doom
       fill-column
       hl-todo
       hydra
       indent-guides
       (modeline +light)
       nav-flash
       ophints
       (popup +defaults)
       treemacs
       vc-gutter
       window-select
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       format
       lispy
       multiple-cursors
       parinfer
       snippets
       word-wrap

       :emacs
       dired
       electric
       ibuffer
       undo
       vc

       :term
       eshell
       vterm

       :checkers
       syntax
       (spell +hunspell)
       grammar

       :tools
       ansible
       debugger
       docker
       editorconfig
       (eval +overlay)
       gist
       (lookup +dictionary)
       (lsp +peek)
       (magit +forge)
       make
       (pass +auth)
       pdf

       :os
       tty

       :lang
       (cc +lsp)
       common-lisp
       (csharp +lsp)
       emacs-lisp
       (go +lsp)
       (haskell +lsp)
       json
       (latex +latexmk +cdlatex +lsp +fold)
       ledger
       (markdown +grip)
       (org +brain +journal +noter +pandoc +pomodoro +roam)
       plantuml
       (python +lsp)
       qt
       scheme
       sh
       web
       yaml

       :email
       mu4e

       :app
       calendar
       irc
       (rss +org)

       :config
       (default +bindings +smartparens))
