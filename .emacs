(message "Loading $HOME/.emacs")

(global-set-key (kbd "<f12> r") 'start-runtime)
(global-set-key (kbd "<f12> b") 'start-bag)
(global-set-key (kbd "<f12> o") 'start-open)
(global-set-key (kbd "<f12> e") 'open-dot-emacs)
(global-set-key (kbd "<f12> s") 'open-dot-startup-magik)
(global-set-key (kbd "<f11>") 'reload-bag-importer)

(defun open-dot-startup-magik()
	(interactive)
	(find-file "~/startup.magik")
)

(defun open-dot-emacs()
	(interactive)
	(find-file "~/.emacs")
)

(defun start-runtime()
	(interactive)
	(message "Starting runtime [image tag: runtime]")

	(find-file (getenv "SW_WHICH_GIS_ALIAS_FILE"))
	(aliases-run-program "runtime")
)

(defun start-bag()
	(interactive)
	(message "Starting bag [image tag: bag]")

	(find-file (getenv "SW_WHICH_GIS_ALIAS_FILE"))
	(aliases-run-program "bag")
)

(defun start-open()
	(interactive)
	(message "Starting open [image tag: open]")

	(find-file (getenv "SW_WHICH_GIS_ALIAS_FILE"))
	(aliases-run-program "open")
)

(defun reload-bag-qa-framework()
  (interactive)

  (save-some-buffers t)
  (reload-module ":bag_qa_framework")
)

(defun reload-bag-importer()
  (interactive)

  (save-some-buffers t)
  (reload-module ":bag_importer")
  (reload-module ":bag_dev")
)

(defun reload-module (module)
  "Reloads the given module."
  (interactive "r")
  (magik-transmit-string
   (concatenate 'string "reload_module(" module ")")
   "user:"
   (lambda (f) (magik-function "load_file" f 'unset (or (buffer-file-name) 'unset)))
   (lambda (f) (magik-function "system.unlink" f 'false 'true)))
  )

;; (require 'iswitchb)
;; (iswitchb-mode 1)
(global-set-key (kbd "C-<tab>") 'iswitchb-buffer)

(defun iswitchb-local-keys ()
  (mapc (lambda (K) 
	  (let* ((key (car K)) (fun (cdr K)))
	    (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	'(("<right>" . iswitchb-next-match)
	  ("<left>"  . iswitchb-prev-match)
	  ("C-<tab>"  . iswitchb-next-match)
	  ("<up>"    . ignore             )
	  ("<down>"  . ignore             ))))

;; (add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

;; disable multiple split windows in frames
(setq same-window-regexps '("."))

;; enable list of buffers in the mini buffer
(require 'edmacro)
(iswitchb-mode 1)
;; (defun iswitchb-local-keys ()
;;  (mapc (lambda (K)
;; (let* ((key (car K)) (fun (cdr K)))
;;             (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
;;           '(("<right>" . iswitchb-next-match)
;;             ("<left>"  . iswitchb-prev-match)
;;             ("<up>"    . ignore             )
;;             ("<down>"  . ignore             ))))

(defun iswitchb-local-keys ()
 (mapc (lambda (K)
(let* ((key (car K)) (fun (cdr K)))
            (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
          '(("C-f"      . iswitchb-next-match)
            ("C-b"      . iswitchb-prev-match)
            ("<right>"  . iswitchb-next-match)
            ("<left>"   . iswitchb-prev-match))))


;;add to switch
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

;;auto refresh of files
(global-auto-revert-mode 1)

;;some nice key mappings >>
(global-set-key (kbd "M-s M-s") 'speedbar-get-focus)
(global-set-key (kbd "M-z") 'shell)
(global-set-key (kbd "M-<f2>") 'list-processes)

;; prevent emacs from copying files when dragging from explorer
(setq dired-dnd-protocol-alist nil)

;; maximise emacs 
(w32-send-sys-command 61488) 

;;(tabbar-mode)

;; add a shortcut to the magik F2-x buffer to unfold lines. 
;; You can use undo to fold the lines again:
;; Ctrl-_ (control + shift + underscore) 
(require 'deep-print)
(define-key deep-print-mode-map [(shift return)] 'deep-print-unfold)

;; when windows keys are activated Ctrl-c no longer works on a stanza in the gis-aliases
(require 'aliases)
(define-key aliases-mode-map [(shift return)] 'aliases-run-program)

;; add this to enable deletion of marked areas 
(delete-selection-mode 1)


(load "load_sw_defs")            ; Smallworld extra functionality.
(load "sw_defaults")             ; Some default customisations.
(electric-magik-mode)

;; smallworld file to select multiple environments of smallworld
;;(defvar gis-version-file "h:/TAS/Realworld/worksource/Pieter/config/gis_version.txt" )

;; list of gis aliases to load 
;; (setq aliases-user-file-list '( "h:/TAS/Realworld/worksource/Pieter/config/dev_gis_aliases"
;;                                 "//enc-cap-gis-01/ASSETS/ENECO_GIS42/Config/gis_aliases"
;; 				"h:/TAS/realworld/ontwikkel/ENECO_GIS_SWAF/config/ontw_gis_aliases"
;; 				"h:/TAS/ENECO_GIS_SWAF/config/test_gis_aliases"
;; 				"h:/TAS/ENECO_GIS_SWAF/config/dev_gis_aliases"
;; 				"//enc-cap-gis-02/TAS/Eneco_gis42/Config/gis_aliases"))

;; gis commands that can be executed with F2-z (use up-down arrows to select)
(push "[] gis swaf"  gis-command-history)          
(push "gis.exe -a t:/rw/bag/bag/config/magik_images/resources/base/data/gis_aliases bag" gis-command-history)
;;(push "[I:/TAS42/eneco_schemas] gis -a i:/TAS42/eneco_schemas/config/gis_aliases swaf_closed" gis-command-history)
;;(push "[I:/TAS42/eneco_schemas] gis -a i:/TAS42/eneco_schemas/config/gis_aliases swaf_schemas" gis-command-history)
;;(push "[I:/TAS42/eneco_schemas] gis -a i:/TAS42/eneco_schemas/config/gis_aliases eneco_auth_open_tas" gis-command-history)
;;(push "[c:/smallworld/sw420/product] sw_magik_win32 -image c:/Smallworld/sw420/cambridge_db/images/open_swaf.msf -cli" gis-command-history)
;;(push "[c:/smallworld/sw410/product] sw_magik_win32 -image c:/Smallworld/sw410/pni410/images/pni410_open.msf -cli" gis-command-history)

;; VIM's * feature

(require 'etags) ;; provides `find-tag-default' in Emacs 21.

(defun isearch-yank-regexp (regexp)
  "Pull REGEXP into search regexp." 
  (let ((isearch-regexp nil)) ;; Dynamic binding of global.
    (isearch-yank-string regexp))
  (isearch-search-and-update))

(defun isearch-yank-symbol (&optional partialp)
  "Put symbol at current point into search string.
  
  If PARTIALP is non-nil, find all partial matches."
  (interactive "P")
  (let* ((sym (find-tag-default))
	 ;; Use call of `re-search-forward' by `find-tag-default' to
	 ;; retrieve the end point of the symbol.
	 (sym-end (match-end 0))
	 (sym-start (- sym-end (length sym))))
    (if (null sym)
	(message "No symbol at point")
      (goto-char sym-start)
      ;; For consistent behavior, restart Isearch from starting point
      ;; (or end point if using `isearch-backward') of symbol.
      (isearch-search)
      (if partialp
	  (isearch-yank-string sym)
	(isearch-yank-regexp
	 (concat "\\_<" (regexp-quote sym) "\\_>"))))))

(defun isearch-current-symbol (&optional partialp)
  "Incremental search forward with symbol under point.
  
  Prefixed with \\[universal-argument] will find all partial
  matches."
  (interactive "P")
  (let ((start (point)))
    (isearch-forward-regexp nil 1)
    (isearch-yank-symbol partialp)))

(defun isearch-backward-current-symbol (&optional partialp)
  "Incremental search backward with symbol under point.
  
  Prefixed with \\[universal-argument] will find all partial
  matches."
  (interactive "P")
  (let ((start (point)))
    (isearch-backward-regexp nil 1)
    (isearch-yank-symbol partialp)))

;; /VIM's *

(global-set-key [(control *)] 'isearch-current-symbol)
;; (global-set-key [(control f3)] 'isearch-backward-current-symbol)

;; Subsequent hitting of the keys will increment to the next
;; match--duplicating `C-s' and `C-r', respectively.
(define-key isearch-mode-map [(control *)] 'isearch-repeat-forward)
;; (define-key isearch-mode-map [(control f3)] 'isearch-repeat-backward)

(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

(if (boundp 'add-to-list)
	    (add-to-list 'iswitchb-buffer-ignore "^ ?\\*")
)

;; (defun my-init ()
;; 	"Custom initialization, maximizing active frame, and so on."
;; 	(interactive)

;; 	(cond (
;; 	       (fboundp 'ecb-deactivate)
;; 			(ecb-deactivate)
;; 	       )
;; 	)
;; 	(install-shortcuts)
;; 	(win32-maximize-frame)
;; )

;; (add-hook 'window-setup-hook 'my-init t)

;; (defun install-shortcuts()
;;   	"Install personal shortcuts"
;; 	(interactive)

;; 	(global-set-key (kbd "<f6> i") 'my-init)
;; 	(global-set-key (kbd "<f6> x") 'kill-emacs)
;; 	(global-set-key (kbd "<f6> m") 'win32-maximize-frame)
;; )

;; (defun win32-maximize-frame ()
;; 	"Maximize the current frame"
;; 	(interactive)

;; 	(cond (
;; 	       (fboundp 'w32-send-sys-command)
;; 			(w32-send-sys-command 61488)
;; 	       )
;; 	)
;; )

;; ;; ***************************************************************************
;; ;; RealMacs stuff
;; (defun roos-my-init ()
;; 	"Custom initialization, Realmacs specific, maximizing active frame, and so on."
;; 	(interactive)

;; 	(cond (
;; 	       (fboundp 'ecb-deactivate)
;; 			(ecb-deactivate)
;; 	       )
;; 	)
;; 	(roos-install-shortcuts)
;; 	(roos-revert-emacs-shortcuts)
;; )

;; (add-hook 'window-setup-hook 'roos-my-init t)

;; (defun roos-install-shortcuts()
;;   	"Install personal shortcuts"
;; 	(interactive)

;; 	(global-set-key (kbd "<f6> s") 'start-swaf)
;; 	(global-set-key (kbd "<f6> o") 'start-open)
;; 	(global-set-key (kbd "<f6> r") 'start-runtime)
;; 	(global-set-key (kbd "<f6> c") 'start-core)
;; 	(global-set-key (kbd "<f6> l") 'start-length-analysis)
;; )

;; (defun roos-revert-emacs-shortcuts()
;; 	(cond (
;; 	       (fboundp 'roos-unset-windows-keys)
;; 		       (roos-unset-windows-keys)
;; 	       )
;; 	)

;; 	;; RealMacs documentation suggests this, let's just follow it
;; 	(setq transient-mark-mode 1)

;; 	;;FIXME: this is a hack: find out who calls
;; 	;;RealMacs/Realworld/lisp/roos-key-bindings.el's roos-set-keys
;; 	(global-set-key (kbd "M-f") 'forward-word)
;; )

;; (defun roos-add-gis-aliases(gis-alias)
;; 	(custom-set-variables
;; 		'(roos-custom-sw-gis-alias-pathes (list gis-alias))
;; 	 )
;; )

;; (defun roos-add-product-path(product-path)
;; 	(custom-set-variables
;; 		'(roos-custom-sw-product-pathes (list product-path))
;; 	 )
;; )

;; (defun start-swaf()
;; 	(interactive)
;; 	(message "Starting swaf [image tag: swaf]")

;; 	(roos-set-sw-gis-alias-tag-start "swaf")
;; )

;; (defun start-open()
;; 	(interactive)
;; 	(message "Starting open [image tag: open]")

;; 	(roos-set-sw-gis-alias-tag-start "open")
;; )

;; (defun start-runtime()
;; 	(interactive)
;; 	(message "Starting runtime [image tag: runtime]")

;; 	(roos-set-sw-gis-alias-tag-start "runtime")
;; )

;; (defun start-core()
;; 	(interactive)
;; 	(message "Starting core [image tag: core]")

;; 	(roos-set-sw-gis-alias-tag-start "core")
;; )

;; (defun start-length-analysis()
;; 	(interactive)
;; 	(message "Starting length-analysis [image tag: length_analysis]")

;; 	(roos-set-sw-gis-alias-tag-start "length_analysis")
;; )

;; ;; reload function 'roos-find-sw-gis-alias-file-for-tag', it gets corrupted somehow
;; (load (expand-file-name "Realworld/lisp/sw-uk/sw!gis-extras.el"))

;; ;;; init.el ends here

;; ;;; bartO.el starts here
;; ;;; .emacs --- dot emacs
 
;; ;; Copyright (C) 2009  Realworld Systems
 
;; ;; Author: BArtO
;; ;; Created: Sep/2009
;; ;; Updated: Nov/2010
;; ;; Keywords: lisp

;; ;;; .emacs ends here
;; (custom-set-variables
;;  '(roos-relocate-file-string-mappings
;;    (quote
;;     (;; ----------
;;      ;; 420 project
;;      ;; ----------
;; ;("/swdev/build/core/420/Beta1Beta/windows/" "S:/Gis420Beta/product")
;;      )))
;;  '(roos-prefix "roos")
;;  '(roos-user-name    "thijs.brobbel")
;;  '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
;;  '(default-input-method "latin-1-prefix")
;;  '(current-language-environment "Latin-1")
;;  '(global-font-lock-mode t nil (font-lock))
;; '(roos-windows-keys-p nil)
;;  '(current-language-environment "Dutch")
;;  '(transient-mark-mode t)
;;  '(case-fold-search t)
;;  '(ecb-auto-activate nil)
;;  '(tempo-interactive nil)
;;  '(initial-frame-alist (quote ((width . 150) (height . 60) (font . "-*-Fixedsys-normal-r-*-*-13-97-*-*-c-*-*-iso8859-1") (background-color . "lemon chiffon"))))
;;  '(mouse-avoidance-mode 'none) ;; don't want strange moves of the mouse when cursor comes along
;; )

;; ;sys!slot
;; (fset 's
;;    [?\C-e C-left ?s ?y ?s ?! ?s ?l ?o ?t ?( ?: ?\C-e ?)])
;; (fset 'tr
;;    "!traceback!(!output!)")
;; (fset 'met
;;    [?\C-e M-left ?m ?e ?t ?h ?o ?d ?( ?: ?| ?\C-e ?| ?)])
;; ;; ----------
;; ;; source_file
;; ;; ----------
;; (fset 'sf
;;    [?\M-x ?m ?e ?t return ?. ?s ?o ?u ?r ?c ?e ?_ ?f ?i ?l ?e])
;; ;; ----------
;; ;; value
;; ;; ----------
;; (fset 'v
;;    [?\C-e M-left ?m ?e ?t ?h ?o ?d ?( ?: ?| ?\C-e ?| ?) ?. ?v ?a ?l ?u ?e ?. ?d ?p])
;; ;; ----------
;; ;; sys!perform()
;; ;; ----------
;; (fset 'sp
;;       [?\C-e C-left ?s ?y ?s ?! ?p ?e ?r ?f ?o ?r ?m ?( ?: ?| end ?| ?)])
;; ;; ----------
;; ;; sort out results for find deprecated methods
;; ;; ----------
;; (fset 'dep
;;       [?\M-% ?m ?e ?t ?h ?o ?d ?  return tab tab return ?! C-home ?\M-% ?  ?i ?n ?j backspace ?  return tab return ?!])
;; ;; ----------
;; ;; find topic (collect topic names in other buffer)
;; ;; ----------
;; (fset 'ft
;;    [?\C-s ?t ?o ?p ?i ?c right right ?\C-  ?\C-s ?} left ?\M-w ?\C-x ?o ?\C-y return ?\C-x ?o])
;; ;;; bartO.el ends here
