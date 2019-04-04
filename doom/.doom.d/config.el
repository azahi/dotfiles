;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
