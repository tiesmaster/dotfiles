(message "Hoi")

(defun my-init ()
	"Custom initialization, maximizing active frame, and so on."
	(interactive)

	(cond (
	       (fboundp 'ecb-deactivate)
			(ecb-deactivate)
	       )
	)
	(install-shortcuts)
	(win32-maximize-frame)
)

(add-hook 'window-setup-hook 'my-init t)

(defun install-shortcuts()
  	"Install personal shortcuts"
	(interactive)

	(global-set-key (kbd "<f6> i") 'my-init)
	(global-set-key (kbd "<f6> x") 'kill-emacs)
	(global-set-key (kbd "<f6> m") 'win32-maximize-frame)
)

(defun win32-maximize-frame ()
	"Maximize the current frame"
	(interactive)

	(cond (
	       (fboundp 'w32-send-sys-command)
			(w32-send-sys-command 61488)
	       )
	)
)

;; ***************************************************************************
;; RealMacs stuff
(defun roos-my-init ()
	"Custom initialization, Realmacs specific, maximizing active frame, and so on."
	(interactive)

	(cond (
	       (fboundp 'ecb-deactivate)
			(ecb-deactivate)
	       )
	)
	(roos-install-shortcuts)
	(roos-revert-emacs-shortcuts)
)

(add-hook 'window-setup-hook 'roos-my-init t)

(defun roos-install-shortcuts()
  	"Install personal shortcuts"
	(interactive)

	(global-set-key (kbd "<f6> s") 'start-swaf)
	(global-set-key (kbd "<f6> u") 'start-utrm)
	;;(global-set-key (kbd "<f6> u") 'start-utrm-closed)
	(global-set-key (kbd "<f6> o") 'start-orca)
	(global-set-key (kbd "<f6> c") 'start-cambridge)
	(global-set-key (kbd "<f6> r") 'start-orca-sync-replica)
	(global-set-key (kbd "<f6> d") 'start-orca-sync-dev)
	(global-set-key (kbd "<f6> w") 'start-wml)
)

(defun roos-revert-emacs-shortcuts()
	(cond (
	       (fboundp 'roos-unset-windows-keys)
		       (roos-unset-windows-keys)
	       )
	)

	;; RealMacs documentation suggests this, let's just follow it
	(setq transient-mark-mode 1)

	;;FIXME: this is a hack: find out who calls
	;;RealMacs/Realworld/lisp/roos-key-bindings.el's roos-set-keys
	(global-set-key (kbd "M-f") 'forward-word)
)

(defun roos-add-gis-aliases(gis-alias)
	(custom-set-variables
		'(roos-custom-sw-gis-alias-pathes (list gis-alias))
	 )
)

(defun roos-add-product-path(product-path)
	(custom-set-variables
		'(roos-custom-sw-product-pathes (list product-path))
	 )
)

(defun start-swaf()
	(interactive)
	(message "Starting SWAF [image tag: SWAF]")

	(roos-set-sw-gis-alias-tag-start "swaf")
)

(defun start-utrm()
	(interactive)
	(message "Starting UTRM Open [image tag: Cambridge Open Trunk 4.2.0 [SW: 420] RW Development]")

	;;(roos-set-sw-gis-alias-tag-start "utrm_open")
	(roos-set-sw-gis-alias-tag-start "Cambridge Open Trunk 4.2.0 [SW: 420] RW Development")
)

(defun start-utrm-closed()
	(interactive)
	(message "Starting UTRM Closed [image tag: Cambridge Closed 420 RW Swaf]")

	;;(roos-set-sw-gis-alias-tag-start "utrm_open")
	(roos-set-sw-gis-alias-tag-start "Cambridge Closed 420 RW Swaf")
)

(defun start-orca()
	(interactive)
	(message "Starting ORCA [image tag: ORCA]")

	(roos-set-sw-gis-alias-tag-start "ORCA")
)

(defun start-cambridge()
	(interactive)
	(message "Starting Cambridge [image tag: cambridge_open]")

	(roos-set-sw-gis-alias-tag-start "cambridge_open")
)

(defun start-orca-sync-replica()
	(interactive)
	(message "Starting ORCA (SyncManager replica) [image tag: orca_custom_sync_replica_open]")

	(roos-set-sw-gis-alias-tag-start "orca_custom_sync_replica_open")
)

(defun start-orca-sync-dev()
	(interactive)
	(message "Starting ORCA (SyncManager dev) [image tag: orca_custom_sync_dev_open]")

	(roos-set-sw-gis-alias-tag-start "orca_custom_sync_dev_open")
)

(defun start-wml()
	(interactive)
	(message "Starting WML [image tag: WML]")

	(roos-set-sw-gis-alias-tag-start "WML")
)

;; reload function 'roos-find-sw-gis-alias-file-for-tag', it gets corrupted somehow
(load (expand-file-name "Realworld/lisp/sw-uk/sw!gis-extras.el"))

;;; init.el ends here

;;; bartO.el starts here
;;; .emacs --- dot emacs
 
;; Copyright (C) 2009  Realworld Systems
 
;; Author: BArtO
;; Created: Sep/2009
;; Updated: Nov/2010
;; Keywords: lisp

;;; .emacs ends here
(custom-set-variables
 '(roos-relocate-file-string-mappings
   (quote
    (;; ----------
     ;; 420 project
     ;; ----------
;("/swdev/build/core/420/Beta1Beta/windows/" "S:/Gis420Beta/product")
     )))
 '(roos-prefix "roos")
 '(roos-user-name    "thijs.brobbel")
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(default-input-method "latin-1-prefix")
 '(current-language-environment "Latin-1")
 '(global-font-lock-mode t nil (font-lock))
'(roos-windows-keys-p nil)
 '(current-language-environment "Dutch")
 '(transient-mark-mode t)
 '(case-fold-search t)
 '(ecb-auto-activate nil)
 '(tempo-interactive nil)
 '(initial-frame-alist (quote ((width . 150) (height . 60) (font . "-*-Fixedsys-normal-r-*-*-13-97-*-*-c-*-*-iso8859-1") (background-color . "lemon chiffon"))))
 '(mouse-avoidance-mode 'none) ;; don't want strange moves of the mouse when cursor comes along
)

;sys!slot
(fset 's
   [?\C-e C-left ?s ?y ?s ?! ?s ?l ?o ?t ?( ?: ?\C-e ?)])
(fset 'tr
   "!traceback!(!output!)")
(fset 'met
   [?\C-e M-left ?m ?e ?t ?h ?o ?d ?( ?: ?| ?\C-e ?| ?)])
;; ----------
;; source_file
;; ----------
(fset 'sf
   [?\M-x ?m ?e ?t return ?. ?s ?o ?u ?r ?c ?e ?_ ?f ?i ?l ?e])
;; ----------
;; value
;; ----------
(fset 'v
   [?\C-e M-left ?m ?e ?t ?h ?o ?d ?( ?: ?| ?\C-e ?| ?) ?. ?v ?a ?l ?u ?e ?. ?d ?p])
;; ----------
;; sys!perform()
;; ----------
(fset 'sp
      [?\C-e C-left ?s ?y ?s ?! ?p ?e ?r ?f ?o ?r ?m ?( ?: ?| end ?| ?)])
;; ----------
;; sort out results for find deprecated methods
;; ----------
(fset 'dep
      [?\M-% ?m ?e ?t ?h ?o ?d ?  return tab tab return ?! C-home ?\M-% ?  ?i ?n ?j backspace ?  return tab return ?!])
;; ----------
;; find topic (collect topic names in other buffer)
;; ----------
(fset 'ft
   [?\C-s ?t ?o ?p ?i ?c right right ?\C-  ?\C-s ?} left ?\M-w ?\C-x ?o ?\C-y return ?\C-x ?o])
;;; bartO.el ends here
