;;; init.el -- CKoch's configuration file
;;
;;
(add-to-list 'load-path "~/.emacs.d/")
;; TODO move all plugins to marmalade and add to install-packages
(add-to-list 'load-path "~/.emacs.d/plugins/" )



;;;; Load packages from repos
(package-initialize)
(require 'package)
;; add community maintained repos
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(defun install-packages ()
  "Installs all packages that I use on all my boxen."
  (interactive)
  (package-refresh-contents)
  (mapc '(lambda (package)
	   (unless (package-installed-p package)
	     (package-install package)))
	'(browse-kill-ring
	  magit
	  smex
	  smartparens
	  color-theme-solarized
	  company
	  fuzzy
	  ido-ubiquitous
	  visible-mark
	  nsis-mode
	  ;;groovy-mode		       
	  fuzzy-match
	  ;;fuzzy-format
	  dtrt-indent
	  haskell-mode
	  ecb
	  emacs-eclim)))
	  ;;list-registers)))
	  

;;;; TODO check for a network connection and only run this if there is connection.
;;;; or have it fail after some amount of time and continue with initialization of emacs
(install-packages)

;;stumpwm-mode
;; TODO add this to marmalade and switch to using that
(load "~/repos/stumpwm-mode.el")
(setq stumpwm-shell-program "stumpish")


;;;; org-mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;;; Ergoemacs
;; (setq ergoemacs-theme "lvl1")
;; (setq ergoemacs-keyboard-layout "dv")
;;(require 'ergoemacs-mode)
;;(ergoemacs-mode 1)

;;;; Load d color themes
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized-light)
(load-theme 'tango-dark)

;;;; Completions
;; (setq completion-ignored-extensions `".o"',
;; `".elc"', and `"~"')
(icomplete-mode)


;;;; Mode line settings
;; show time/date and system load in mode line
(display-time-mode t)

;;;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "|")

;;;; windmove -- shift-arrow keys to switch to other buffer
(windmove-default-keybindings)

;;;; smex
(global-set-key (kbd "M-x") 'smex)

;;;; Show/hide/misc
;;(show-paren-mode nil)
(show-smartparens-global-mode t)
(column-number-mode t)
;; keep a list of recently opened files
(recentf-mode t)


;;;; auto-mode-alist
;; change major mode 
(setq auto-mode-alist
  (append
    '(;;("\\.groovy$" . java-mode)
      ("\\.m$" . octave-mode))
    auto-mode-alist))


;;;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)


(defun my-c-mode-cedet-hook ()
  (imenu-add-to-menubar "TAGS")
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; (when (cedet-gnu-global-version-check t)
;;   (semanticdb-enable-gnu-global-databases 'c-mode)
;;   (semanticdb-enable-gnu-global-databases 'c++-mode))
;; (ede-cpp-root-project "C-Client-Server"
;;                 :name "C-Client-Server Project"
;;                 :file "~/Dropbox/Fall2013/EECS3150-data-com/C-Client-Server/CMakeLists.txt"
;;                 :include-path '("/"
;;                                 "/server"
;; 				"client")
;;                 :system-include-path '("/usr/include"))

;;;; IRC
(rcirc-track-minor-mode 1)

;; TODO show/hide time stamp "toggle"
(setq rcirc-time-format "%m-%d %r ")

(add-to-list 'rcirc-server-alist
	     '("irc.freenode.net"
	       :channels ("#emacs" "#bedrock" "#lisp" "#lispcafe" "#stumpwm" "#clnoobs")))

(setq rcirc-default-user-name "ckoch786"
      rcirc-default-user-full-name "Cory Koch")

(eval-after-load 'rcirc
  '(defun-rcirc-command reconnect (arg)
     "Reconnect the server process."
     (interactive "i")
     (unless process
       (error "There's no process for this target"))
     (let* ((server (car (process-contact process)))
	    (port (process-contact process :service))
	    (nick (rcirc-nick process))
	    channels query-buffers)
       (dolist (buf (buffer-list))
	 (with-current-buffer buf
	   (when (eq process (rcirc-buffer-process))
	     (remove-hook 'change-major-mode-hook
			  'rcirc-change-major-mode-hook)
	     (if (rcirc-channel-p rcirc-target)
		 (setq channels (cons rcirc-target channels))
	       (setq query-buffers (cons buf query-buffers))))))
       (delete-process process)
       (rcirc-connect server port nick
		      rcirc-default-user-name
		      rcirc-default-user-full-name
		      channels))))



;;;; imenu
(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
	  (ido-enable-flex-matching
	   (if (boundp 'ido-enable-flex-matching)
	       ido-enable-flex-matching t))
	  name-and-pos symbol-names position)
      (unless ido-mode
	(ido-mode 1)
	(setq ido-enable-flex-matching t))
      (while (progn
	       (imenu--cleanup)
	       (setq imenu--index-alist nil)
	       (ido-goto-symbol (imenu--make-index-alist))
	       (setq selected-symbol
		     (ido-completing-read "Symbol? " symbol-names))
	       (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
	(push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
	(goto-char (overlay-start position)))
       (t
	(goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
	(cond
	 ((and (listp symbol) (imenu--subalist-p symbol))
	  (ido-goto-symbol symbol))
	 ((listp symbol)
	  (setq name (car symbol))
	  (setq position (cdr symbol)))
	 ((stringp symbol)
	  (setq name symbol)
	  (setq position
		(get-text-property 1 'org-imenu-marker symbol))))
	(unless (or (null position) (null name)
		    (string= (car imenu--rescan-item) name))
	  (add-to-list 'symbol-names name)
	  (add-to-list 'name-and-pos (cons name position))))))))
(global-set-key "\C-ci" 'ido-goto-symbol)	


;;;; smartparens
;;(load "init-smartparens")
(require 'smartparens-config)
(smartparens-global-mode t)



;;;; slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")


;;;; yasnippets
;;(yas-global-mode t)



;;;; erc
;;(erc-select)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))



;;;; icicles
;;(icy-mode t)



;;; ido-mode
(require 'ido)
(ido-mode 1)
;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))


;;;; hippie-expand
(global-set-key (kbd "M-/") 'hippie-expand)



;;;; auto-complete
;; bind M p to auto-complete
(global-set-key "\M-p" 'auto-complete)
;; Start autocomplete mode
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")



;;;; browse-kill-ring
;; add bindings for kill ring browser
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))



;;;; list-register
;; add bindings for register browser
(require 'list-register)
(global-set-key (kbd "C-x r v") 'list-register)



;;;; C/C++ settings
(setq c-default-style "linux"
      c-basic-offset 2)
;; C++ Style for NLDS
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)



;;;; CEDET
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another 
;; package (Gnus, auth-source, ...).
;; (load-file "/home/$USER/builds/cedet/cedet-devel-load.el")

;; ;; Add further minor-modes to be enabled by semantic-mode.
;; ;; See doc-string of `semantic-default-submodes' for other things
;; ;; you can use here.
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; Enable Semantic
(semantic-mode t)

;; Enable EDE (Project Management) features
(global-ede-mode t)



;;;; gccsense
(require 'gccsense)



;;;; flymake
(setq flymake-log-level 3)



;;;; eshell
(setq eshell-history-size 1024)
(setq eshell-prompt-regexp "^[^#$]*[#$] ")

(load "em-hist")           ; So the history vars are defined
(if (boundp 'eshell-save-history-on-exit)
    (setq eshell-save-history-on-exit t)) ; Don't ask, just save
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)
(if (boundp 'eshell-ask-to-save-history)
    (setq eshell-ask-to-save-history 'always)) ; For older(?) version
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)

(defun eshell/ef (fname-regexp &rest dir) (ef fname-regexp default-directory))


;;; ---- path manipulation

(defun pwd-repl-home (pwd)
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
   (home-len (length home)))
    (if (and
   (>= (length pwd) home-len)
   (equal home (substring pwd 0 home-len)))
  (concat "~" (substring pwd home-len))
      pwd)))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (propertize (concat "["
              (if (> (length git-output) 0)
                  (substring git-output 0 -1)
                "(no branch)")
              "]") 'face `(:foreground "green"))
      )))

(setq eshell-prompt-function
      (lambda ()
        (concat
         (propertize ((lambda (p-lst)
            (if (> (length p-lst) 3)
                (concat
                 (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                            (substring elm 0 1)))
                            (butlast p-lst 3)
                            "/")
                 "/"
                 (mapconcat (lambda (elm) elm)
                            (last p-lst 3)
                            "/"))
              (mapconcat (lambda (elm) elm)
                         p-lst
                         "/")))
          (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground "blue"))
         (or (curr-dir-git-branch-string (eshell/pwd)))
         (propertize "# " 'face 'default))))
         ;(if (= (user-uid) 0) " # " " $ ")

(setq eshell-highlight-prompt nil)



;;;; Cory's functions
(defun open-and-mark-in-ibuffer (file-path)
  "Opens the file and marks the file in the ibuffer
file-path : the full path to the file for example
~/.emacs.d/init.el to open your init.el.
This function is especially useful if you desire to 
reguarly open a list of files or directories and use the occurs function
in ibuffer to search for files."
  (interactive)
  (ibuffer)
  (ibuffer-mark-by-file-name-regexp 
   (car 
    (last 
     (split-string file-path "/")))))

;;(org-remeber-insinuate)


;; TODO use thing-at ?? See video
;; TODO use a custom variable for the finished.org file instead of the hard coded value
(defun org-move-finished ()
  ""
  (interactive)
  ;; find checked items, if on a check box TODO check
  (when (org-at-item-checkbox-p)
    (outline-previous-heading) ; move to the header of the list
    (org-cut-special) ; get the list
    (let ((s (car kill-ring)))
      (append-to-file s nil "~/Dropbox/ELisp/finished.org")))

  ;; append a time stamp to finished
  ;; grab the header list item and append it to finished
  ;; grab the checked items and their sublists if any and append them to finished
  )
;; TODO bind org-move-finished to C-c f

;;;; TODO use a hook to add this function to doc-view-mode
(require 'doc-view)
(defvar dv-mark)
(defun dv-push-mark ()
  (interactive)
  (push dv-mark (doc-view-current-page)))

(defun dv-pop-mark ()
  (interactive)
  (doc-view-goto-page (pop dv-mark)))


 ;;;; custom-set-variables
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file 'noerror)


;;;; Start server so that all new instances of Emacs will use this instance
(server-start)





