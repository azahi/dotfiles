(define custom-activate-default-im-name? #t)
(define custom-preserved-default-im-name 'skk)
(define default-im-name 'skk)
(define enabled-im-list '(skk))
(define enable-im-switch? #f)
(define switch-im-key '("<Control>Shift_key" "<Shift>Control_key"))
(define switch-im-key? (make-key-predicate '("<Control>Shift_key" "<Shift>Control_key")))
(define switch-im-skip-direct-im? #f)
(define enable-im-toggle? #t)
(define toggle-im-key '("<IgnoreShift><Meta>`"))
(define toggle-im-key? (make-key-predicate '("<IgnoreShift><Meta>`")))
(define toggle-im-alt-im 'direct)
(define uim-color 'uim-color-uim)
(define candidate-window-style 'vertical)
(define candidate-window-position 'caret)
(define enable-lazy-loading? #t)
(define bridge-show-input-state? #f)
(define bridge-show-with? 'time)
(define bridge-show-input-state-time-length 3)
