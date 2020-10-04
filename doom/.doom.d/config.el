;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Azat Bahawi"
      user-mail-address "azahi@teknik.io")

(setq doom-theme 'doom-monokai-spectrum)

(setq doom-font (font-spec :family "Source Code Pro" :size 12)
      doom-bin-font (font-spec :family "Source Code Pro" :size 19))

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(setq-default c-default-style "linux")

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(setq plantuml-jar-path "/usr/share/plantuml/lib/plantuml.jar")

(when (eq initial-window-system 'x)
  (toggle-frame-maximized)
  (toggle-frame-fullscreen))

(set-irc-server! "Freenode"
  `(:host "znc.systemd.club"
     :port 6501
     :use-tls nil
     :user "azahi/freenode"
     :pass (lambda (&rest _)
             (+pass-get-secret "server/flandre/service/znc/azahi"))))

(set-irc-server! "Rizon"
 `(:host "znc.systemd.club"
   :port 6501
   :use-tls nil
   :user "azahi/rizon"
   :pass (lambda (&rest _)
           (+pass-get-secret "server/flandre/service/znc/azahi"))))
