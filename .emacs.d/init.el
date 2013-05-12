;;; init.el -- CKoch's configuration file
;;
;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq el-get-sources
      '((:name browse-kill-ring
	       :after (progn
			(browse-kill-ring-default-keybindings)))

	(:name list-register
	       :after (progn
			(global-set-key (kbd "C-x r v") 'list-register)))

	(:name auto-complete
	       :after (progn
			(global-set-key "\M-p" 'auto-complete)))))
			;; Start autocomplete mode
			;;(require 'auto-complete-config)
			;;(ac-config-default)
			;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")))))

	;; (:name smartparens
	;;        :after (progn
	;; 		;;(load "init-smartparens")
	;; 		(require 'smartparens-config)
	;; 		(smartparens-global-mode t)))))

(setq my-packages
      (append
       ;; missing recipes: w3m jedi groovy-mode gccsense flymake epc emacs-eclim dash ctable  concurrent company
       `(yasnippet visible-mark smex smart-tab 
		    popup nsis-mode  ido-ubiquitous icicles haskell-mode 
		    google-c-style fuzzy-match fuzzy deferred color-theme-solarized)
       ;; Takes to long check recipe:  ecb
       (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)




;;    Here's a couple of examples of package recipes that are using
;; `:before' and `:after' properties:

;;        (:name asciidoc
;;         :type elpa
;;         :after (lambda ()
;;            (autoload 'doc-mode "doc-mode" nil t)
;;            (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
;;            (add-hook 'doc-mode-hook '(lambda ()
;;                      (turn-on-auto-fill)
;;                      (require 'asciidoc)))))

;;        (:name anything
;;         :features anything-config
;;         :before (global-set-key (kbd "M-s a") 'dim:anything-occur)
;;         :after  (setq w3m-command nil))

;; TODO setup init-package.el to have elget byte compile the configs when neccessary?
;; and loads the compiled version
;; section 7.2
;; TODO reread node 9 

(setq general-configs "~/.emacs.d/configs/general-configs.el")
(load general-configs 'noerror)

(setq eshell-functions "~/.emacs.d/functions/eshell-functions.el")
(load eshell-functions 'noerror)

(setq imenu-functions "~/.emacs.d/functions/imenu-functions.el")
(load imenu-functions 'noerror)

(setq built-in-configs "~/.emacs.d/configs/built-in-configs.el")
(load built-in-configs 'noerror)
