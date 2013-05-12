((auto-complete status "installed" recipe
		(:name auto-complete :website "http://cx4a.org/software/auto-complete/" :description "The most intelligent auto-completion extension." :type github :pkgname "m2ym/auto-complete" :depends
		       (popup fuzzy)
		       :after
		       (progn
			 (global-set-key "\360" 'auto-complete))))
 (browse-kill-ring status "installed" recipe
		   (:name browse-kill-ring :description "Interactively insert items from kill-ring" :type emacswiki :features browse-kill-ring :after
			  (progn
			    (browse-kill-ring-default-keybindings))))
 (color-theme status "installed" recipe
	      (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
		     ("xzf")
		     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
		     (progn
		       (color-theme-initialize)
		       (setq color-theme-is-global t))))
 (color-theme-solarized status "installed" recipe
			(:name color-theme-solarized :description "Emacs highlighting using Ethan Schoonover's Solarized color scheme" :type github :pkgname "sellout/emacs-color-theme-solarized" :depends color-theme :prepare
			       (progn
				 (add-to-list 'custom-theme-load-path default-directory)
				 (autoload 'color-theme-solarized-light "color-theme-solarized" "color-theme: solarized-light" t)
				 (autoload 'color-theme-solarized-dark "color-theme-solarized" "color-theme: solarized-dark" t))))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp" :website "https://github.com/kiwanami/emacs-deferred" :type github :pkgname "kiwanami/emacs-deferred" :features "deferred"))
 (ecb status "required" recipe nil)
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/m2ym/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "m2ym/fuzzy-el"))
 (fuzzy-match status "installed" recipe
	      (:name fuzzy-match :auto-generated t :type emacswiki :description "fuzzy matching" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/fuzzy-match.el"))
 (google-c-style status "installed" recipe
		 (:name google-c-style :type http :description "Google's C/C++ style for c-mode" :url "http://google-styleguide.googlecode.com/svn/trunk/google-c-style.el" :features google-c-style :post-init
			(progn
			  (add-hook 'c-mode-common-hook 'google-set-c-style)
			  (add-hook 'c-mode-common-hook 'google-make-newline-indent))))
 (haskell-mode status "installed" recipe
	       (:name haskell-mode :description "A Haskell editing mode" :type github :pkgname "haskell/haskell-mode" :load "haskell-site-file.el" :post-init
		      (progn
			(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
			(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))))
 (icicles status "installed" recipe
	  (:name icicles :auto-generated t :type emacswiki :description "Minibuffer input completion and cycling." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/icicles.el"))
 (ido-ubiquitous status "installed" recipe
		 (:name ido-ubiquitous :description "Use ido (nearly) everywhere" :type elpa))
 (list-register status "installed" recipe
		(:name list-register :auto-generated t :type emacswiki :description "List register" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/list-register.el" :after
		       (progn
			 (global-set-key
			  (kbd "C-x r v")
			  'list-register))))
 (nsis-mode status "installed" recipe
	    (:name nsis-mode :website "https://github.com/mlf176f2/nsis-mode" :description "A major mode for editing NSIS files" :type github :pkgname "mlf176f2/nsis-mode"))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin 24 :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (setq package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))
			 package-directory-list
			 (list
			  (file-name-as-directory package-user-dir)
			  "/usr/share/emacs/site-lisp/elpa/"))
		   (make-directory package-user-dir t)
		   (unless
		       (boundp 'package-subdirectory-regexp)
		     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
		   (setq package-archives
			 '(("ELPA" . "http://tromey.com/elpa/")
			   ("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/m2ym/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "m2ym/popup-el"))
 (smart-tab status "installed" recipe
	    (:name smart-tab :description "Intelligent tab completion and indentation." :type github :pkgname "genehack/smart-tab" :features smart-tab))
 (smex status "installed" recipe
       (:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
	      (smex-initialize)))
 (visible-mark status "installed" recipe
	       (:name visible-mark :auto-generated t :type emacswiki :description "Make marks visible." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/visible-mark.el"))
 (yasnippet status "installed" recipe
	    (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
		   (unless
		       (or
			(boundp 'yas/snippet-dirs)
			(get 'yas/snippet-dirs 'customized-value))
		     (setq yas/snippet-dirs
			   (list
			    (concat el-get-dir
				    (file-name-as-directory "yasnippet")
				    "snippets"))))
		   :post-init
		   (put 'yas/snippet-dirs 'standard-value
			(list
			 (list 'quote
			       (list
				(concat el-get-dir
					(file-name-as-directory "yasnippet")
					"snippets")))))
		   :compile nil :submodule nil)))
