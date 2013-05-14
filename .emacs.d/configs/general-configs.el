;;;; Mode line settings
;; show time/date and system load in mode line
(display-time-mode t)

;;;; Show/hide/misc
(show-paren-mode t)
(column-number-mode t)
;; keep a list of recently opened files
(recentf-mode t)

;;;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

;;;; custom-set-variables
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file 'noerror)

;;;; Start server so that all new instances of Emacs will use this instance
(server-start)
