(provide 'haskell-conf)

(require 'haskell-mode-autoloads)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-hook 'haskell-mode-hook 'subword-mode)
(add-hook 'haskell-mode-hook (lambda () (imenu-add-to-menubar "SourceNavigation")))


;; Setting auto-fill-mode
(add-hook 'haskell-mode-hook
          (lambda ()
            (progn
              (setq fill-column 80)
              (setq auto-fill-column 80)
              (auto-fill-mode 1)
              )))
