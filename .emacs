(message "Loading $HOME/.emacs")

(global-set-key (kbd "<f12> r") 'start-runtime)
(global-set-key (kbd "<f12> b") 'start-bag)
(global-set-key (kbd "<f12> o") 'start-open)
(global-set-key (kbd "<f12> e") 'open-dot-emacs)
(global-set-key (kbd "<f11>") 'reload-bag-qa-framework)

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
  (reload-module ":bag_qa_framework")
  (reload-module ":bag_importer")
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

(defun iswitchb-local-keys ()
  (mapc (lambda (K) 
	  (let* ((key (car K)) (fun (cdr K)))
	    (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	'(("<right>" . iswitchb-next-match)
	  ("<left>"  . iswitchb-prev-match)
	  ("C-<tab>"  . iswitchb-next-match)
	  ("<up>"    . ignore             )
	  ("<down>"  . ignore             ))))

;; disable multiple split windows in frames
(setq same-window-regexps '("."))

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
