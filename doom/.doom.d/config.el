;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-tomorrow-night)

;;(setq doom-font (font-spec :family "Source Code Pro" :size 12)
;;      doom-variable-pitch-font (font-spec :family "DejaVu Sans")
;;      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
;;      doom-big-font (font-spec :family "Source Code Pro" :size 19))

;;(when (display-graphic-p)
;; (prettify-symbols-mode -1))

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(setq org-log-into-drawer "LOGBOOK")

(set-irc-server! "znc-rizon"
  `(:host "systemd.club"
    :port 1550
    :use-tls t
    :user "azahi/rizon"
    :pass (lambda (&rest _) (+pass-get-secret "servers/remilia/services/znc/azahi"))))

(set-irc-server! "znc-freenode"
  `(:host "systemd.club"
    :port 1550
    :use-tls t
    :user "azahi/freenode"
    :pass (lambda (&rest _) (+pass-get-secret "servers/remilia/services/znc/azahi"))))

(set-irc-server! "bitlbee"
  `(:host "localhost"
    :port 6667))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
