;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (browse-kill-ring browse-kill-ring-default-keybindings)
;;;;;;  "browse-kill-ring/browse-kill-ring" "browse-kill-ring/browse-kill-ring.el"
;;;;;;  (20879 59891 669511 533000))
;;; Generated autoloads from browse-kill-ring/browse-kill-ring.el

(autoload 'browse-kill-ring-default-keybindings "browse-kill-ring/browse-kill-ring" "\
Set up M-y (`yank-pop') so that it can invoke `browse-kill-ring'.
Normally, if M-y was not preceeded by C-y, then it has no useful
behavior.  This function sets things up so that M-y will invoke
`browse-kill-ring'.

\(fn)" t nil)

(autoload 'browse-kill-ring "browse-kill-ring/browse-kill-ring" "\
Display items in the `kill-ring' in another buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (color-theme-solarized-light color-theme-solarized-dark
;;;;;;  color-theme-solarized) "color-theme-solarized/color-theme-solarized"
;;;;;;  "color-theme-solarized/color-theme-solarized.el" (20879 61247
;;;;;;  208233 285000))
;;; Generated autoloads from color-theme-solarized/color-theme-solarized.el

(autoload 'color-theme-solarized "color-theme-solarized/color-theme-solarized" "\
Color theme by Ethan Schoonover, created 2011-03-24.
Ported to Emacs by Greg Pfeil, http://ethanschoonover.com/solarized.

\(fn MODE)" t nil)

(autoload 'color-theme-solarized-dark "color-theme-solarized/color-theme-solarized" "\


\(fn)" t nil)

(autoload 'color-theme-solarized-light "color-theme-solarized/color-theme-solarized" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "color-theme-solarized/solarized-definitions"
;;;;;;  "color-theme-solarized/solarized-definitions.el" (20879 61247
;;;;;;  208233 285000))
;;; Generated autoloads from color-theme-solarized/solarized-definitions.el

(when (boundp 'custom-theme-load-path) (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

;;;***

;;;### (autoloads (color-theme-initialize color-theme-submit color-theme-install
;;;;;;  color-theme-compare color-theme-make-snapshot color-theme-analyze-defun
;;;;;;  color-theme-print color-theme-install-at-point-for-current-frame
;;;;;;  color-theme-install-at-mouse color-theme-describe color-theme-select)
;;;;;;  "color-theme/color-theme" "color-theme/color-theme.el" (17529
;;;;;;  41105 0 0))
;;; Generated autoloads from color-theme/color-theme.el

(autoload 'color-theme-select "color-theme/color-theme" "\
Displays a special buffer for selecting and installing a color theme.
With optional prefix ARG, this buffer will include color theme libraries
as well.  A color theme library is in itself not complete, it must be
used as part of another color theme to be useful.  Thus, color theme
libraries are mainly useful for color theme authors.

\(fn &optional ARG)" t nil)

(autoload 'color-theme-describe "color-theme/color-theme" "\
Describe color theme listed at point.
This shows the documentation of the value of text-property color-theme
at point.  The text-property color-theme should be a color theme
function.  See `color-themes'.

\(fn)" t nil)

(autoload 'color-theme-install-at-mouse "color-theme/color-theme" "\
Install color theme clicked upon using the mouse.
First argument EVENT is used to set point.  Then
`color-theme-install-at-point' is called.

\(fn EVENT)" t nil)

(autoload 'color-theme-install-at-point-for-current-frame "color-theme/color-theme" "\
Install color theme at point for current frame only.
Binds `color-theme-is-global' to nil and calls
`color-theme-install-at-point'.

\(fn)" t nil)

(autoload 'color-theme-print "color-theme/color-theme" "\
Print the current color theme function.

You can contribute this function to <URL:news:gnu.emacs.sources> or
paste it into your .emacs file and call it.  That should recreate all
the settings necessary for your color theme.

Example:

    (require 'color-theme)
    (defun my-color-theme ()
      \"Color theme by Alex Schroeder, created 2000-05-17.\"
      (interactive)
      (color-theme-install
       '(...
	 ...
	 ...)))
    (my-color-theme)

If you want to use a specific color theme function, you can call the
color theme function in your .emacs directly.

Example:

    (require 'color-theme)
    (color-theme-gnome2)

\(fn &optional BUF)" t nil)

(autoload 'color-theme-analyze-defun "color-theme/color-theme" "\
Once you have a color-theme printed, check for missing faces.
This is used by maintainers who receive a color-theme submission
and want to make sure it follows the guidelines by the color-theme
author.

\(fn)" t nil)

(autoload 'color-theme-make-snapshot "color-theme/color-theme" "\
Return the definition of the current color-theme.
The function returned will recreate the color-theme in use at the moment.

\(fn)" nil nil)

(autoload 'color-theme-compare "color-theme/color-theme" "\
Compare two color themes.
This will print the differences between installing THEME-A and
installing THEME-B.  Note that the order is important: If a face is
defined in THEME-A and not in THEME-B, then this will not show up as a
difference, because there is no reset before installing THEME-B.  If a
face is defined in THEME-B and not in THEME-A, then this will show up as
a difference.

\(fn THEME-A THEME-B)" t nil)

(autoload 'color-theme-install "color-theme/color-theme" "\
Install a color theme defined by frame parameters, variables and faces.

The theme is installed for all present and future frames; any missing
faces are created.  See `color-theme-install-faces'.

THEME is a color theme definition.  See below for more information.

If you want to install a color theme from your .emacs, use the output
generated by `color-theme-print'.  This produces color theme function
which you can copy to your .emacs.

A color theme definition is a list:
\([FUNCTION] FRAME-PARAMETERS VARIABLE-SETTINGS FACE-DEFINITIONS)

FUNCTION is the color theme function which called `color-theme-install'.
This is no longer used.  There was a time when this package supported
automatic factoring of color themes.  This has been abandoned.

FRAME-PARAMETERS is an alist of frame parameters.  These are installed
with `color-theme-install-frame-params'.  These are installed last such
that any changes to the default face can be changed by the frame
parameters.

VARIABLE-DEFINITIONS is an alist of variable settings.  These are
installed with `color-theme-install-variables'.

FACE-DEFINITIONS is an alist of face definitions.  These are installed
with `color-theme-install-faces'.

If `color-theme-is-cumulative' is nil, a color theme will undo face and
frame-parameter settings of previous color themes.

\(fn THEME)" nil nil)

(autoload 'color-theme-submit "color-theme/color-theme" "\
Submit your color-theme to the maintainer.

\(fn)" t nil)

(autoload 'color-theme-initialize "color-theme/color-theme" "\
Initialize the color theme package by loading color-theme-libraries.

\(fn)" t nil)

;;;***

;;;### (autoloads (el-get-checksum el-get-make-recipes el-get-cd
;;;;;;  el-get-self-update el-get-update-all el-get-version) "el-get/el-get"
;;;;;;  "el-get/el-get.el" (20878 60339 141297 664000))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE &optional PACKAGE-STATUS-ALIST)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (20878 60339 137297 640000))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (lisp-spell-symbol FM-offer-corrections) "fuzzy-match/fuzzy-match"
;;;;;;  "fuzzy-match/fuzzy-match.el" (20879 57432 533317 332000))
;;; Generated autoloads from fuzzy-match/fuzzy-match.el

(autoload 'FM-offer-corrections "fuzzy-match/fuzzy-match" "\
Offer corrections for ITEM from CANDIDATES.  Maybe replace ITEM.
If PROMPT-P is non-nil and there is only one candidate, ask the user before
replacing ITEM.  Replacement is performed by `replace-match'.
If more than one correction exists, call `FM-list-candidates' to display them.
Returns: nil if no correction was inserted.
         `sole' if corrected with the only correction match.
         `correct' if the only correction match is identical to ITEM.
         `listed' if a completion listing was shown.

\(fn ITEM CANDIDATES &optional PROMPT-P)" t nil)

(autoload 'lisp-spell-symbol "fuzzy-match/fuzzy-match" "\
Perform spell checking on Lisp symbol preceding point.
With prefix arg(s) and only one candidate, ask the user before replacing.
With double prefix arg (\\[universal-argument] \\[universal-argument]), use `FM-all-fuzzy-matches' rather than
`FM-all-close-matches' to find Lisp symbol candidates.  This is useful if the
Lisp symbol stub is only partially complete.

To minimize matching effort and results, the first character of the
symbol is assumed to be correct.  See also `FM-offer-corrections'.

\(fn PROMPT)" t nil)

;;;***

;;;### (autoloads (ghc-core-mode ghc-core-create-core) "haskell-mode/ghc-core"
;;;;;;  "haskell-mode/ghc-core.el" (20879 57421 897264 593000))
;;; Generated autoloads from haskell-mode/ghc-core.el

(autoload 'ghc-core-create-core "haskell-mode/ghc-core" "\
Compiled and load the current buffer as tidy core

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.hcr\\'" . ghc-core-mode))

(autoload 'ghc-core-mode "haskell-mode/ghc-core" "\
Major mode for GHC Core files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-align-imports) "haskell-mode/haskell-align-imports"
;;;;;;  "haskell-mode/haskell-align-imports.el" (20879 57421 901264
;;;;;;  607000))
;;; Generated autoloads from haskell-mode/haskell-align-imports.el

(autoload 'haskell-align-imports "haskell-mode/haskell-align-imports" "\
Align all the imports in the buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-c-mode) "haskell-mode/haskell-c" "haskell-mode/haskell-c.el"
;;;;;;  (20879 57421 901264 607000))
;;; Generated autoloads from haskell-mode/haskell-c.el

(add-to-list 'auto-mode-alist '("\\.hsc\\'" . haskell-c-mode))

(autoload 'haskell-c-mode "haskell-mode/haskell-c" "\
Major mode for Haskell FFI files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-cabal-get-dir haskell-cabal-mode) "haskell-mode/haskell-cabal"
;;;;;;  "haskell-mode/haskell-cabal.el" (20879 57421 901264 607000))
;;; Generated autoloads from haskell-mode/haskell-cabal.el

(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(autoload 'haskell-cabal-mode "haskell-mode/haskell-cabal" "\
Major mode for Cabal package description files.

\(fn)" t nil)

(autoload 'haskell-cabal-get-dir "haskell-mode/haskell-cabal" "\
Get the Cabal dir for a new project. Various ways of figuring this out,
   and indeed just prompting the user. Do them all.

\(fn)" nil nil)

;;;***

;;;### (autoloads (haskell-decl-scan-mode) "haskell-mode/haskell-decl-scan"
;;;;;;  "haskell-mode/haskell-decl-scan.el" (20879 57421 901264 607000))
;;; Generated autoloads from haskell-mode/haskell-decl-scan.el

(autoload 'haskell-decl-scan-mode "haskell-mode/haskell-decl-scan" "\
Minor mode for declaration scanning for Haskell mode.
Top-level declarations are scanned and listed in the menu item \"Declarations\".
Selecting an item from this menu will take point to the start of the
declaration.

\\[haskell-ds-forward-decl] and \\[haskell-ds-backward-decl] move forward and backward to the start of a declaration.

Under XEmacs, the following keys are also defined:

\\[fume-list-functions] lists the declarations of the current buffer,
\\[fume-prompt-function-goto] prompts for a declaration to move to, and
\\[fume-mouse-function-goto] moves to the declaration whose name is at point.

This may link with `haskell-doc' (only for Emacs currently).

For non-literate and LaTeX-style literate scripts, we assume the
common convention that top-level declarations start at the first
column.  For Bird-style literate scripts, we assume the common
convention that top-level declarations start at the third column,
ie. after \"> \".

Anything in `font-lock-comment-face' is not considered for a
declaration.  Therefore, using Haskell font locking with comments
coloured in `font-lock-comment-face' improves declaration scanning.

To turn on declaration scanning for all Haskell buffers, add this to
.emacs:

  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)

To turn declaration scanning on for the current buffer, call
`turn-on-haskell-decl-scan'.

Literate Haskell scripts are supported: If the value of
`haskell-literate' (automatically set by the Haskell mode of
Moss&Thorn) is `bird', a Bird-style literate script is assumed.  If it
is nil or `tex', a non-literate or LaTeX-style literate script is
assumed, respectively.

Invokes `haskell-decl-scan-mode-hook'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-doc-show-type haskell-doc-mode) "haskell-mode/haskell-doc"
;;;;;;  "haskell-mode/haskell-doc.el" (20879 57421 905264 629000))
;;; Generated autoloads from haskell-mode/haskell-doc.el

(autoload 'haskell-doc-mode "haskell-mode/haskell-doc" "\
Enter `haskell-doc-mode' for showing fct types in the echo area.
See variable docstring.

\(fn &optional ARG)" t nil)

(defalias 'turn-on-haskell-doc-mode 'haskell-doc-mode)

(autoload 'haskell-doc-show-type "haskell-mode/haskell-doc" "\
Show the type of the function near point.
For the function under point, show the type in the echo area.
This information is extracted from the `haskell-doc-prelude-types' alist
of prelude functions and their types, or from the local functions in the
current buffer.

\(fn &optional SYM)" t nil)

;;;***

;;;### (autoloads (haskell-indent-mode) "haskell-mode/haskell-indent"
;;;;;;  "haskell-mode/haskell-indent.el" (20879 57421 909264 654000))
;;; Generated autoloads from haskell-mode/haskell-indent.el

(autoload 'haskell-indent-mode "haskell-mode/haskell-indent" "\
``Intelligent'' Haskell indentation mode.
This deals with the layout rule of Haskell.
\\[haskell-indent-cycle] starts the cycle which proposes new
possibilities as long as the TAB key is pressed.  Any other key
or mouse click terminates the cycle and is interpreted except for
RET which merely exits the cycle.
Other special keys are:
    \\[haskell-indent-insert-equal]
      inserts an =
    \\[haskell-indent-insert-guard]
      inserts an |
    \\[haskell-indent-insert-otherwise]
      inserts an | otherwise =
these functions also align the guards and rhs of the current definition
    \\[haskell-indent-insert-where]
      inserts a where keyword
    \\[haskell-indent-align-guards-and-rhs]
      aligns the guards and rhs of the region
    \\[haskell-indent-put-region-in-literate]
      makes the region a piece of literate code in a literate script

Invokes `haskell-indent-hook' if not nil.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-indentation-mode) "haskell-mode/haskell-indentation"
;;;;;;  "haskell-mode/haskell-indentation.el" (20879 57421 909264
;;;;;;  654000))
;;; Generated autoloads from haskell-mode/haskell-indentation.el

(autoload 'haskell-indentation-mode "haskell-mode/haskell-indentation" "\
Haskell indentation mode that deals with the layout rule.
It rebinds RET, DEL and BACKSPACE, so that indentations can be
set and deleted as if they were real tabs.  It supports
autofill-mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-interactive-mode-echo haskell-interactive-switch
;;;;;;  haskell-interactive-bring haskell-interactive-mode) "haskell-mode/haskell-interactive-mode"
;;;;;;  "haskell-mode/haskell-interactive-mode.el" (20879 57421 909264
;;;;;;  654000))
;;; Generated autoloads from haskell-mode/haskell-interactive-mode.el

(autoload 'haskell-interactive-mode "haskell-mode/haskell-interactive-mode" "\
Interactive mode for Haskell.

Key bindings:
\\{haskell-interactive-mode-map}

\(fn SESSION)" t nil)

(autoload 'haskell-interactive-bring "haskell-mode/haskell-interactive-mode" "\
Bring up the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-switch "haskell-mode/haskell-interactive-mode" "\
Switch to the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-mode-echo "haskell-mode/haskell-interactive-mode" "\
Echo a read only piece of text before the prompt.

\(fn SESSION MESSAGE)" nil nil)

;;;***

;;;### (autoloads (haskell-menu) "haskell-mode/haskell-menu" "haskell-mode/haskell-menu.el"
;;;;;;  (20879 57421 909264 654000))
;;; Generated autoloads from haskell-mode/haskell-menu.el

(autoload 'haskell-menu "haskell-mode/haskell-menu" "\
Launch the Haskell sessions menu.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-hayoo haskell-hoogle literate-haskell-mode
;;;;;;  haskell-mode) "haskell-mode/haskell-mode" "haskell-mode/haskell-mode.el"
;;;;;;  (20879 57421 909264 654000))
;;; Generated autoloads from haskell-mode/haskell-mode.el

(when load-file-name (add-to-list 'load-path (file-name-directory load-file-name)))

(autoload 'haskell-mode "haskell-mode/haskell-mode" "\
Major mode for editing Haskell programs.
Blank lines separate paragraphs, comments start with `-- '.
\\<haskell-mode-map>
Literate scripts are supported via `literate-haskell-mode'.
The variable `haskell-literate' indicates the style of the script in the
current buffer.  See the documentation on this variable for more details.

Modules can hook in via `haskell-mode-hook'.  The following modules
are supported with an `autoload' command:

   `haskell-decl-scan', Graeme E Moss
     Scans top-level declarations, and places them in a menu.

   `haskell-doc', Hans-Wolfgang Loidl
     Echoes types of functions or syntax of keywords when the cursor is idle.

   `haskell-indentation', Kristof Bastiaensen
     Intelligent semi-automatic indentation Mk2

   `haskell-indent', Guy Lapalme
     Intelligent semi-automatic indentation.

   `haskell-simple-indent', Graeme E Moss and Heribert Schuetz
     Simple indentation.

Module X is activated using the command `turn-on-X'.  For example,
`haskell-indent' is activated using `turn-on-haskell-indent'.
For more information on a module, see the help for its `X-mode'
function.  Some modules can be deactivated using `turn-off-X'.  (Note
that `haskell-doc' is irregular in using `turn-(on/off)-haskell-doc-mode'.)

Use `haskell-version' to find out what version this is.

Invokes `haskell-mode-hook'.

\(fn)" t nil)

(autoload 'literate-haskell-mode "haskell-mode/haskell-mode" "\
As `haskell-mode' but for literate scripts.

\(fn)" t nil)
(add-to-list 'auto-mode-alist        '("\\.\\(?:[gh]s\\|hi\\)\\'" . haskell-mode))
(add-to-list 'auto-mode-alist        '("\\.l[gh]s\\'" . literate-haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(autoload 'haskell-hoogle "haskell-mode/haskell-mode" "\
Do a Hoogle search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hoogle 'haskell-hoogle)

(autoload 'haskell-hayoo "haskell-mode/haskell-mode" "\
Do a Hayoo search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hayoo 'haskell-hayoo)

;;;***

;;;### (autoloads (haskell-move-nested) "haskell-mode/haskell-move-nested"
;;;;;;  "haskell-mode/haskell-move-nested.el" (20879 57421 913264
;;;;;;  670000))
;;; Generated autoloads from haskell-mode/haskell-move-nested.el

(autoload 'haskell-move-nested "haskell-mode/haskell-move-nested" "\


\(fn COLUMNS)" nil nil)

;;;***

;;;### (autoloads (haskell-navigate-imports-return haskell-navigate-imports-go
;;;;;;  haskell-navigate-imports) "haskell-mode/haskell-navigate-imports"
;;;;;;  "haskell-mode/haskell-navigate-imports.el" (20879 57421 913264
;;;;;;  670000))
;;; Generated autoloads from haskell-mode/haskell-navigate-imports.el

(autoload 'haskell-navigate-imports "haskell-mode/haskell-navigate-imports" "\
Cycle the Haskell import lines or return to point (with prefix arg).

\(fn &optional RETURN)" t nil)

(autoload 'haskell-navigate-imports-go "haskell-mode/haskell-navigate-imports" "\
Go to the first line of a list of consequtive import lines. Cycles.

\(fn)" t nil)

(autoload 'haskell-navigate-imports-return "haskell-mode/haskell-navigate-imports" "\
Return to the non-import point we were at before going to the module list.
   If we were originally at an import list, we can just cycle through easily.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-process haskell-process-start haskell-process-cabal
;;;;;;  haskell-process-cabal-build haskell-process-load-or-reload
;;;;;;  haskell-process-reload-file haskell-process-load-file haskell-process-generate-tags)
;;;;;;  "haskell-mode/haskell-process" "haskell-mode/haskell-process.el"
;;;;;;  (20879 57421 913264 670000))
;;; Generated autoloads from haskell-mode/haskell-process.el

(autoload 'haskell-process-generate-tags "haskell-mode/haskell-process" "\
Regenerate the TAGS table.

\(fn &optional AND-THEN-FIND-THIS-TAG)" t nil)

(autoload 'haskell-process-load-file "haskell-mode/haskell-process" "\
Load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-reload-file "haskell-mode/haskell-process" "\
Re-load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-load-or-reload "haskell-mode/haskell-process" "\
Load or reload. Universal argument toggles which.

\(fn &optional TOGGLE)" t nil)

(autoload 'haskell-process-cabal-build "haskell-mode/haskell-process" "\
Build the Cabal project.

\(fn)" t nil)

(autoload 'haskell-process-cabal "haskell-mode/haskell-process" "\
Prompts for a Cabal command to run.

\(fn)" t nil)

(autoload 'haskell-process-start "haskell-mode/haskell-process" "\
Start the inferior Haskell process.

\(fn SESSION)" nil nil)

(autoload 'haskell-process "haskell-mode/haskell-process" "\
Get the current process from the current session.

\(fn)" nil nil)

;;;***

;;;### (autoloads (haskell-session-process haskell-session) "haskell-mode/haskell-session"
;;;;;;  "haskell-mode/haskell-session.el" (20879 57421 913264 670000))
;;; Generated autoloads from haskell-mode/haskell-session.el

(autoload 'haskell-session "haskell-mode/haskell-session" "\
Get the Haskell session, prompt if there isn't one or fail.

\(fn)" nil nil)

(autoload 'haskell-session-process "haskell-mode/haskell-session" "\
Get the session process.

\(fn S)" nil nil)

;;;***

;;;### (autoloads (haskell-show-parse haskell-show-parse-and-insert
;;;;;;  haskell-show-replace) "haskell-mode/haskell-show" "haskell-mode/haskell-show.el"
;;;;;;  (20879 57421 913264 670000))
;;; Generated autoloads from haskell-mode/haskell-show.el

(autoload 'haskell-show-replace "haskell-mode/haskell-show" "\
Replace the given region containing a Show value with a pretty
  printed collapsible version.

\(fn START END)" nil nil)

(autoload 'haskell-show-parse-and-insert "haskell-mode/haskell-show" "\
Parse a `string' containing a Show instance value and insert
  it pretty printed into the current buffer.

\(fn GIVEN)" nil nil)

(autoload 'haskell-show-parse "haskell-mode/haskell-show" "\
Parse the given input into a tree.

\(fn GIVEN)" nil nil)

;;;***

;;;### (autoloads (haskell-sort-imports) "haskell-mode/haskell-sort-imports"
;;;;;;  "haskell-mode/haskell-sort-imports.el" (20879 57421 913264
;;;;;;  670000))
;;; Generated autoloads from haskell-mode/haskell-sort-imports.el

(autoload 'haskell-sort-imports "haskell-mode/haskell-sort-imports" "\
Sort the import list at the point.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-is-prefix-of haskell-string-take haskell-trim)
;;;;;;  "haskell-mode/haskell-string" "haskell-mode/haskell-string.el"
;;;;;;  (20879 57421 913264 670000))
;;; Generated autoloads from haskell-mode/haskell-string.el

(autoload 'haskell-trim "haskell-mode/haskell-string" "\


\(fn STRING)" nil nil)

(autoload 'haskell-string-take "haskell-mode/haskell-string" "\
Take n chars from string.

\(fn STRING N)" nil nil)

(autoload 'haskell-is-prefix-of "haskell-mode/haskell-string" "\
Is x string a prefix of y string?

\(fn X Y)" nil nil)

;;;***

;;;### (autoloads (inferior-haskell-find-haddock inferior-haskell-find-definition
;;;;;;  inferior-haskell-info inferior-haskell-kind inferior-haskell-type
;;;;;;  inferior-haskell-send-decl inferior-haskell-load-and-run
;;;;;;  inferior-haskell-load-file switch-to-haskell) "haskell-mode/inf-haskell"
;;;;;;  "haskell-mode/inf-haskell.el" (20879 57421 917264 690000))
;;; Generated autoloads from haskell-mode/inf-haskell.el

(defalias 'run-haskell 'switch-to-haskell)

(autoload 'switch-to-haskell "haskell-mode/inf-haskell" "\
Show the inferior-haskell buffer.  Start the process if needed.

\(fn &optional ARG)" t nil)

(autoload 'inferior-haskell-load-file "haskell-mode/inf-haskell" "\
Pass the current buffer's file to the inferior haskell process.
If prefix arg \\[universal-argument] is given, just reload the previous file.

\(fn &optional RELOAD)" t nil)

(autoload 'inferior-haskell-load-and-run "haskell-mode/inf-haskell" "\
Pass the current buffer's file to haskell and then run a COMMAND.

\(fn COMMAND)" t nil)

(autoload 'inferior-haskell-send-decl "haskell-mode/inf-haskell" "\
Send current declaration to inferior-haskell process.

\(fn)" t nil)

(autoload 'inferior-haskell-type "haskell-mode/inf-haskell" "\
Query the haskell process for the type of the given expression.
If optional argument `insert-value' is non-nil, insert the type above point
in the buffer.  This can be done interactively with the \\[universal-argument] prefix.
The returned info is cached for reuse by `haskell-doc-mode'.

\(fn EXPR &optional INSERT-VALUE)" t nil)

(autoload 'inferior-haskell-kind "haskell-mode/inf-haskell" "\
Query the haskell process for the kind of the given expression.

\(fn TYPE)" t nil)

(autoload 'inferior-haskell-info "haskell-mode/inf-haskell" "\
Query the haskell process for the info of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-definition "haskell-mode/inf-haskell" "\
Attempt to locate and jump to the definition of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-haddock "haskell-mode/inf-haskell" "\
Find and open the Haddock documentation of SYM.
Make sure to load the file into GHCi or Hugs first by using C-c C-l.
Only works for functions in a package installed with ghc-pkg, or
whatever the value of `haskell-package-manager-name' is.

This function needs to find which package a given module belongs
to.  In order to do this, it computes a module-to-package lookup
alist, which is expensive to compute (it takes upwards of five
seconds with more than about thirty installed packages).  As a
result, we cache it across sessions using the cache file
referenced by `inferior-haskell-module-alist-file'. We test to
see if this is newer than `haskell-package-conf-file' every time
we load it.

\(fn SYM)" t nil)

;;;***

;;;### (autoloads nil "icicles/icicles" "icicles/icicles.el" (20879
;;;;;;  57415 405232 403000))
;;; Generated autoloads from icicles/icicles.el
 (autoload 'icy-mode    "icicles" "Toggle Icicle mode - see `icicle-mode'." t nil)
 (autoload 'icicle-mode "icicles" 
"Icicle mode: Toggle minibuffer input completion and cycling.
 Non-nil prefix ARG turns mode on if ARG > 0, else turns it off.
 Icicle mode is a global minor mode.  It binds keys in the minibuffer.
 \ 
 For more information, use `\\<minibuffer-local-completion-map>\\[icicle-minibuffer-help]' \
 when the minibuffer is active.
 \ 
 Depending on your platform, if you use Icicles in a text terminal
 \(that is, without a window system/manager), you might need to change
 some of the key bindings if some of the default bindings are not
 available to you.
 \ 
 Icicle mode defines many top-level commands.  For a list, see the
 Commentary headers of files `icicles-cmd1.el' and `icicles-cmd2.el'."
 t nil)

;;;***

;;;### (autoloads (ido-ubiquitous-function-compatibility-exceptions
;;;;;;  ido-ubiquitous-command-compatibility-exceptions ido-ubiquitous-function-exceptions
;;;;;;  ido-ubiquitous-command-exceptions ido-ubiquitous-mode ido-ubiquitous)
;;;;;;  "ido-ubiquitous/ido-ubiquitous" "ido-ubiquitous/ido-ubiquitous.el"
;;;;;;  (20879 57411 701214 28000))
;;; Generated autoloads from ido-ubiquitous/ido-ubiquitous.el

(let ((loads (get 'ido-ubiquitous 'custom-loads))) (if (member '"ido-ubiquitous/ido-ubiquitous" loads) nil (put 'ido-ubiquitous 'custom-loads (cons '"ido-ubiquitous/ido-ubiquitous" loads))))

(defvar ido-ubiquitous-mode nil "\
Non-nil if Ido-Ubiquitous mode is enabled.
See the command `ido-ubiquitous-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ido-ubiquitous-mode'.")

(custom-autoload 'ido-ubiquitous-mode "ido-ubiquitous/ido-ubiquitous" nil)

(autoload 'ido-ubiquitous-mode "ido-ubiquitous/ido-ubiquitous" "\
Use `ido-completing-read' instead of `completing-read' almost everywhere.

  This mode has no effect unles `ido-mode' is also enabled.

  If this mode causes problems for a function, you can force the
  function to use the original completing read by using the macro
  `ido-ubiquitous-disable-in'. For example, if a
  function `foo' cannot work with ido-style completion, evaluate
  the following (for example by putting it in your .emacs file):

    (ido-ubiquitous-disable-in foo)

\(fn &optional ARG)" t nil)

(define-obsolete-variable-alias 'ido-ubiquitous 'ido-ubiquitous-mode "0.8")

(define-obsolete-function-alias 'ido-ubiquitous 'ido-ubiquitous-mode "0.8")

(defvar ido-ubiquitous-command-exceptions 'nil "\
List of commands that should not be affected by `ido-ubiquitous'.

Even when `ido-ubiquitous' mode is enabled, these commands will
continue to use `completing-read' instead of
`ido-completing-read'.

Only *interactive* commands should go here. To disable
ido-ubiquitous in non-interactive functions, customize
`ido-ubiquitous-function-exceptions'.

Note: this feature depends on the variable `this-command' being
properly set to the name of the currently executing command.
Depending on how the command is onvoked, this may or may not
happen, so this feature may simply not work in some cases.")

(custom-autoload 'ido-ubiquitous-command-exceptions "ido-ubiquitous/ido-ubiquitous" t)

(define-obsolete-variable-alias 'ido-ubiquitous-exceptions 'ido-ubiquitous-command-exceptions "0.4")

(defvar ido-ubiquitous-function-exceptions '(grep-read-files) "\
List of functions in which to disable ido-ubiquitous.

If you need to add a function to this list, please also file a
bug report at
https://github.com/DarwinAwardWinner/ido-ubiquitous/issues

Note that certain functions, such as `read-file-name', must
always have ido-ubiquitous disabled, and cannot be added
here. (They are effectively a permanent part of this list
already.)")

(custom-autoload 'ido-ubiquitous-function-exceptions "ido-ubiquitous/ido-ubiquitous" nil)

(defvar ido-ubiquitous-command-compatibility-exceptions 'nil "\
List of commands in which to disable compatibility.

See `ido-ubiquitous-enable-compatibility' for a description of
the compatibility behavior. If this behavior causes a command to
break, add that command to this list to disable compatibility
mode for just that command.

Only *interactive* commands should go here. To disable
compatibility mode in non-interactive functions, customize
`ido-ubiquitous-function-compatibility-exceptions'.")

(custom-autoload 'ido-ubiquitous-command-compatibility-exceptions "ido-ubiquitous/ido-ubiquitous" t)

(defvar ido-ubiquitous-function-compatibility-exceptions 'nil "\
List of functions in which to disable ido-ubiquitous compatibility mode.

See `ido-ubiquitous-enable-compatibility' for a description of
the compatibility behavior. If this behavior causes a function to
break, add that function to this list to disable compatibility
mode for just that command.

If you need to add a function to this list, please also file a
bug report at
https://github.com/DarwinAwardWinner/ido-ubiquitous/issues")

(custom-autoload 'ido-ubiquitous-function-compatibility-exceptions "ido-ubiquitous/ido-ubiquitous" nil)

;;;***

;;;### (autoloads (nsis-mode) "nsis-mode/nsis-mode" "nsis-mode/nsis-mode.el"
;;;;;;  (20879 57403 765174 677000))
;;; Generated autoloads from nsis-mode/nsis-mode.el

(setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Ii]\\)$" . nsis-mode)) auto-mode-alist))

(setq auto-mode-alist (append '(("\\.\\([Nn][Ss][Hh]\\)$" . nsis-mode)) auto-mode-alist))

(autoload 'nsis-mode "nsis-mode/nsis-mode" "\
Major mode for editing Nsi files.

\(fn)" t nil)

;;;***

;;;### (autoloads (smart-tab-mode smart-tab-mode-on smart-tab) "smart-tab/smart-tab"
;;;;;;  "smart-tab/smart-tab.el" (20879 57398 481148 479000))
;;; Generated autoloads from smart-tab/smart-tab.el

(autoload 'smart-tab "smart-tab/smart-tab" "\
Try to 'do the smart thing' when tab is pressed.
`smart-tab' attempts to expand the text before the point or
indent the current line or selection.

In a regular buffer, `smart-tab' will attempt to expand with
either `hippie-expand' or `dabbrev-expand', depending on the
value of `smart-tab-using-hippie-expand'. Alternatively, if
`auto-complete-mode' is enabled in the current buffer,
`auto-complete' will be used to attempt expansion. If the mark is
active, or PREFIX is \\[universal-argument], then `smart-tab'
will indent the region or the current line (if the mark is not
active).

\(fn &optional PREFIX)" t nil)

(autoload 'smart-tab-mode-on "smart-tab/smart-tab" "\
Turn on `smart-tab-mode'.

\(fn)" nil nil)

(autoload 'smart-tab-mode "smart-tab/smart-tab" "\
Enable `smart-tab' to be used in place of tab.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (smex-initialize smex) "smex/smex" "smex/smex.el"
;;;;;;  (20879 57393 361123 85000))
;;; Generated autoloads from smex/smex.el

(autoload 'smex "smex/smex" "\


\(fn)" t nil)

(autoload 'smex-initialize "smex/smex" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet/yasnippet"
;;;;;;  "yasnippet/yasnippet.el" (20879 57385 453083 877000))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("color-theme-solarized/color-theme-solarized-pkg.el"
;;;;;;  "color-theme-solarized/solarized-dark-theme.el" "color-theme-solarized/solarized-light-theme.el"
;;;;;;  "color-theme/color-theme-autoloads.el" "deferred/concurrent-sample.el"
;;;;;;  "deferred/concurrent.el" "deferred/deferred-samples.el" "deferred/deferred.el"
;;;;;;  "deferred/test-concurrent.el" "deferred/test-deferred.el"
;;;;;;  "el-get/el-get-autoloads.el" "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "google-c-style/google-c-style.el"
;;;;;;  "haskell-mode/haskell-checkers.el" "haskell-mode/haskell-font-lock.el"
;;;;;;  "haskell-mode/haskell-ghci.el" "haskell-mode/haskell-hugs.el"
;;;;;;  "haskell-mode/haskell-package.el" "haskell-mode/haskell-simple-indent.el"
;;;;;;  "haskell-mode/haskell-site-file.el" "ido-ubiquitous/ido-ubiquitous-autoloads.el"
;;;;;;  "ido-ubiquitous/ido-ubiquitous-pkg.el" "list-register/list-register.el"
;;;;;;  "visible-mark/visible-mark.el" "yasnippet/yasnippet-debug.el"
;;;;;;  "yasnippet/yasnippet-tests.el") (20879 61250 15982 719000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
