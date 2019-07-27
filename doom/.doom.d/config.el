;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq custom-file (concat doom-etc-dir "custom.el"))

(setq doom-theme 'doom-tomorrow-night)

(setq doom-font (font-spec :family "Source Code Pro" :size 12)
      doom-big-font (font-spec :family "Source Code Pro" :size 19))

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(setq org-log-into-drawer "LOGBOOK")

(setq-default c-default-style "linux")

(setq langtool-language-tool-jar "language-tool")

(set-irc-server!
 "znc-rizon"
 `(:host "systemd.club"
         :port 1550
         :use-tls t
         :user "azahi/rizon"
         :pass (lambda (&rest _) (+pass-get-secret "servers/remilia/services/znc/azahi"))))

(set-irc-server!
 "znc-freenode"
 `(:host "systemd.club"
         :port 1550
         :use-tls t
         :user "azahi/freenode"
         :pass (lambda (&rest _) (+pass-get-secret "servers/remilia/services/znc/azahi"))))

(set-irc-server!
 "bitlbee"
 `(:host "localhost"
         :port 6667))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
