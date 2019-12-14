;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(when (string-equal (system-name) "tp-gentoo")
  (doom! :input
         chinese
         japanese

         :completion
         (company
          -chilframe
          +auto
          +tng)
         (ivy
          -childframe
          +prescient
          +fuzzy)

         :ui
         deft
         doom
         doom-dashboard
         hl-todo
         hydra
         indent-guides
         modeline
         nav-flash
         ophints
         (popup
          +all
          +defaults)
         treemacs
         unicode
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
         objed
         parinfer
         rotate-text
         snippets
         word-wrap

         :emacs
         dired
         electric
         ibuffer
         vc

         :term
         eshell
         shell

         :tools
         ansible
         debugger
         direnv
         docker
         editorconfig
         ein
         (eval
          +overlay)
         flycheck
         flyspell
         gist
         lookup
         lsp
         magit
         make
         pass
         pdf
         prodigy
         rgb
         tmux
         upload
         wakatime

         :lang
         assembly
         (cc
          +lsp)
         common-lisp
         csharp
         data
         emacs-lisp
         (java
          +meghanada)
         javascript
         (go
          +lsp)
         (haskell
          +intero)
         latex
         ledger
         markdown
         ocaml
         (org
          +dragndrop
          +gnuplot
          +ipython
          +pandoc
          +present)
         perl
         plantuml
         python
         qt
         racket
         rest
         ruby
         scheme
         sh
         web

         :email
         (mu4e
          +gmail)
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

(when (eq system-type 'darwin)
  (doom! :completion
         (company
          -childframe
          +auto
          +tng)
         (ivy
          -childframe
          +prescient
          +fuzzy)

         :ui
         deft
         doom
         doom-dashboard
         hl-todo
         hydra
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
         objed
         parinfer
         rotate-text
         snippets
         word-wrap

         :emacs
         dired
         electric
         ibuffer
         vc

         :term
         eshell
         shell

         :tools
         debugger
         direnv
         docker
         editorconfig
         (eval +overlay)
         flycheck
         lookup
         lsp
         magit
         make
         pass
         prodigy
         rgb
         tmux
         upload
         wakatime

         :lang
         assembly
         (cc
          -lsp)
         data
         emacs-lisp
         org
         python
         sh

         :email

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
