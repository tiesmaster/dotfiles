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
	;;(roos-add-gis-aliases-old)
	(roos-add-gis-aliases-new "Z:/gis_aliases")
	(roos-add-gis-aliases-new "c:/SmallworldTraining/product/config/gis_aliases")
)

(add-hook 'window-setup-hook 'roos-my-init t)

(defun roos-install-shortcuts()
  	"Install personal shortcuts"
	(interactive)

	(global-set-key (kbd "<f6> o") 'start-orca)
	(global-set-key (kbd "<f6> t") 'start-training)
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

(defun roos-add-gis-aliases-old()
  	;;TODO: move hard-coded filenames to a different file (~/.emacs.d/gis-aliases
	(custom-set-variables
		'(roos-custom-sw-gis-alias-pathes (quote ("Z:/gis_aliases")))
	 )

	(custom-set-variables
		'(roos-custom-sw-gis-alias-pathes (quote ("c:/SmallworldTraining/product/config/gis_aliases")))
	)
)

(defun roos-add-gis-aliases-new(gis-alias)
	(custom-set-variables
		'(roos-custom-sw-gis-alias-pathes (quote (gis-alias)))
	 )
)

(defun start-orca()
	(interactive)
	(message "Starting ORCA")

	(roos-set-sw-gis-alias-start-Z:-gis_aliases-orca_custom_dev_open)
)

(defun start-training()
	(interactive)
	(message "Starting Smallworld for training")

	(roos-set-sw-gis-alias-start-c:-SmallworldTraining-product-config-gis_aliases-swaf)
)

;; SCRATCH
;; ***************************************************************************
;; TODO: I guess this function will also set the given path, if given, I just
;; don't know how to call it...
;;roos-ask-sw-gis-alias-path

;;(custom-set-variables
;; '(roos-custom-sw-gis-alias-pathes (quote ("m:\\smallworld\\config\\gis_aliases")))
;; )

;; adding the product path doesn't seems to be required, since adding the
;; gis_alias is proficient
;;(custom-set-variables
;; '(roos-custom-sw-product-pathes (quote ("c:\\SmallworldTraining\\product")))
;; )

;; TODO: give this a shortcut
;; roos-set-sw-gis-alias-command-m:-smallworld-config-gis_aliases-Heath-(more-power)
