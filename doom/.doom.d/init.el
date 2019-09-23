;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(when (string-equal (system-name) "tp-gentoo")
  (doom! :input
         chinese
         japanese

         :completion
         (company
          +auto
          +tng)
         (helm
          +fuzzy)

         :ui
         deft
         doom
         doom-dashboard
         hl-todo
         indent-guides
         modeline
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
          +smartparens)))

(when (eq system-type 'darwin)
  (doom! :input

         :completion
         (company
          +auto
          +childframe
          +tng)
         (helm
          +childframe
          +fuzzy)

         :ui
         deft
         doom
         doom-dashboard
         hl-todo
         indent-guides
         modeline
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
         ft-header
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

         :tools
         direnv
         eval
         editorconfig
         flycheck
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
         data
         emacs-lisp
         (org
          +attach
          +babel
          +capture
          +export
          +habit
          +ipython
          +present
          +protocol)
         (sh
          -lsp)
         plantuml

         :email
         mu4e
         notmuch

         :app
         calendar
         irc
         (rss
          +org)

         :config
         (default
          +bindings
          +smartparens)))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
