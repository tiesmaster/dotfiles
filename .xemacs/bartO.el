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
  '(roos-custom-sw-gis-alias-pathes	'("P:/UT/smallworld/420/utrm/tags/trunk/build/config/gis_aliases.txt"
					  "Z:/source/support/upgrade420/gis_aliases.txt"))
; '(roos-custom-sw-product-pathes	'("P:/UT/smallworld/420/utrm/Gis420/product"))
 '(roos-custom-sw-message-db-pathes	'("//files3/Software/smallworld/Gis420/product/data"))
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
