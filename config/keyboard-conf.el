(provide 'keyboard-conf)

(let ((italian-pro '(([?\M-ò] "@")
                     ("\M-5"  "~")
                     ([?\M-ì] "~")
;                     ([\M-8]  "´") ; Doesn't work
                     ("\M-9"  "`")
                     ([?\M-è] "[")
                     ([?\M-é] "{")
                     ("\M-*"  "}")
                     ("\M-+"  "]")
                     ([?\M-à] "#"))
                   ))

  ; Setup bindings for specified keymap
  (dolist (mapping italian-pro)
    (global-set-key (pop mapping) (pop mapping))
    )
  )