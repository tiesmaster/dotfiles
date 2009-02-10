;; disabling the windows-keys set by RW
(roos-unset-windows-keys)
(setq transient-mark-mode 1)
;;FIXME: this is a hack: find out who calls
;;RealMacs/Realworld/lisp/roos-key-bindings.el's roos-set-keys
(global-set-key (kbd "M-f") 'forward-word)

;; failsafe to chech if this is sourced
(message "hoi")


(custom-set-variables
	'(roos-custom-sw-gis-alias-pathes (quote ("Z:/gis_aliases")))
 )

(custom-set-variables
	'(roos-custom-sw-gis-alias-pathes (quote ("c:/SmallworldTraining/product/config/gis_aliases")))
)

(defun myInit ()
	(interactive)
	(message "Running myInit")

	(ecb-deactivate)
	(install-shortcuts)
	(win32-maximize-frame)
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

(defun win32-maximize-frame ()
	"Maximize the current frame"
	(interactive)

	(w32-send-sys-command 61488)
)

(defun install-shortcuts()
	(interactive)
	(message "Installing shortcuts")

	(global-set-key (kbd "<f6> i") 'myInit)
	(global-set-key (kbd "<f6> x") 'kill-emacs)
	(global-set-key (kbd "<f6> o") 'start-orca)
	(global-set-key (kbd "<f6> t") 'start-training)
	(global-set-key (kbd "<f6> m") 'win32-maximize-frame)
)

(add-hook 'window-setup-hook 'myInit t)

;;(install-shortcuts)

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

