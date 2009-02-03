;; disabling the windows-keys set by RW
(roos-unset-windows-keys)
(setq transient-mark-mode 1)
;;FIXME: this is a hack: find out who calls
;;RealMacs/Realworld/lisp/roos-key-bindings.el's roos-set-keys
(global-set-key (kbd "M-f") 'forward-word)

;; failsafe to chech if this is sourced
(message "hoi")

;; ***************************************************************************
;; TODO: I guess this function will also set the given path, if given, I just
;; don't know how to call it...
;;roos-ask-sw-gis-alias-path

;;(custom-set-variables
;; '(roos-custom-sw-gis-alias-pathes (quote ("m:\\smallworld\\config\\gis_aliases")))
;; )

(custom-set-variables
 '(roos-custom-sw-gis-alias-pathes (quote ("s:/GIS400/product/config/gis_aliases")))
 )

(custom-set-variables
 '(roos-custom-sw-gis-alias-pathes (quote ("c:\\SmallworldTraining\\product\\config\\gis_aliases")))
 )

;; adding the product path doesn't seems to be required, since adding the
;; gis_alias is proficient
;;(custom-set-variables
;; '(roos-custom-sw-product-pathes (quote ("c:\\SmallworldTraining\\product")))
;; )

;; TODO: give this a shortcut
;; roos-set-sw-gis-alias-command-m:-smallworld-config-gis_aliases-Heath-(more-power)

(defun myInit ()
  (interactive)
  (message "Running myInit")

  (ecb-deactivate)
  (roos-set-sw-gis-alias-command-s:-GIS400-product-config-gis_aliases-swaf)
;;  (roos-set-sw-gis-alias-command-c:-SmallworldTraining-product-config-gis_aliases-swaf)
)

(global-set-key (kbd "C-M-z") 'myInit)
