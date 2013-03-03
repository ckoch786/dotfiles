; Load packages from repos
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/" )
(load "~/.emacs.d/scripts/eshell-customizations.el")
;(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file.el" )

; Start server so that all new instances of Emacs will use this instance
(server-start)

; Load solarized color themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

(defalias 'yes-or-no-p 'y-or-n-p)

;enable column numbers
(column-number-mode 1)

; bind M p to auto-complete
(global-set-key "\M-p" 'auto-complete)

; Start autocomplete mode
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")


; Hide tool bar
(tool-bar-mode -1)

; add community maintained repos
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


; add bindings for kill ring browser
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

; add bindings for register browser
(require 'list-register)
(global-set-key (kbd "C-x r v") 'list-register)

(defalias 'list-buffers 'ibuffer) ; always use ibuffer


; Change major mode 
(setq auto-mode-alist
  (append
    '(("\\.groovy$" . java-mode)
      ("\\.m$" . octave-mode))
    auto-mode-alist))


; C/C++ settings
(setq c-default-style "linux"
      c-basic-offset 2)

(show-paren-mode 1)
(column-number-mode 1)

(require 'gccsense)
(setq flymake-log-level 3)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(org-mobile-files (quote (org-agenda-files "" "~/.emacs/org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
