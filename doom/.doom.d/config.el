;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Azat Bahawi"
      user-mail-address "azahi@teknik.io")

(setq doom-theme 'doom-tomorrow-night)

;(setq doom-font (font-spec :family "UW Ttyp0" :size 16)
;      doom-unicode-font (font-spec :family "Efont Biwidth" :size 16)
;      doom-big-font (font-spec :family "UW Ttyp0" :size 22))

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(setq plantuml-jar-path "/usr/share/plantuml/lib/plantuml.jar")

(when (eq initial-window-system 'x)
  (toggle-frame-maximized)
  (toggle-frame-fullscreen))

(set-irc-server! "Freenode"
  `(
     :host "znc.systemd.club"
     :port 6501
     :use-tls nil
     :user "azahi/freenode"
     :pass (lambda (&rest _)
             (+pass-get-secret "server/flandre/service/znc/azahi"))))

(set-irc-server! "Rizon"
  `(
     :host "znc.systemd.club"
     :port 6501
     :use-tls nil
     :user "azahi/rizon"
     :pass (lambda (&rest _)
             (+pass-get-secret "server/flandre/service/znc/azahi"))))

;(require 'exwm)
;(require 'exwm-config)
;(exwm-config-example)

(after! 'exwm
  (setq exwm-input-global-keys
    `(
       ([?\s-r] . exwm-reset)
       ([?\s-w] . exwm-workspace-switch)
       ([?\s-&] . (lambda (command)
                    (interactive (list (read-shell-command "$ ")))
                    (start-process-shell-command command nil command)))
       ,@(mapcar (lambda (n)
                   `(,(kbd (format "s-%d" n)) . (lambda ()
                                                  (interactive)
                                                  (exwm-workspace-switch-create ,n))))
           (number-sequence 1 9)))))

(provide 'config)
;;; config.el ends here
