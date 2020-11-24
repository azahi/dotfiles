;;; init.el -*- lexical-binding: t; -*-

(doom!
  :input
  japanese

  :completion
  (company +tng)
  (ivy +fuzzy +prescient)

  :ui
  ;; deft
  doom
  fill-column
  hl-todo
  hydra
  indent-guides
  nav-flash
  ophints
  (popup +defaults)
  ;; treemacs
  vc-gutter
  window-select
  workspaces
  ;; zen

  :editor
  (evil +everywhere)
  file-templates
  fold
  (format +onsave)
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
  ;; ansible
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
  prodigy
  rgb
  taskrunner
  tmux
  upload

  :os
  tty

  :lang
  (cc +lsp)
  common-lisp
  (csharp +lsp)
  data
  emacs-lisp
  (go +lsp)
  (haskell +lsp)
  json
  latex
  ledger
  (markdown +grip)
  (org +brain +dragndrop +gnuplot +journal +noter +pandoc +pomodoro +roam)
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

(provide 'init)
;;; init.el ends here