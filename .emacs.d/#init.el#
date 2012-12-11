(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/" )
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file.el" )
(server-start)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

; add bindings for kill ring browser
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

; add bindings for register browser
(require 'list-register)
(global-set-key (kbd "C-x r v") 'list-register)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
