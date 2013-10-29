(provide 'c-conf)

;; Setting auto-fill-mode
(add-hook 'c-mode-hook
          (lambda ()
            (progn
              (setq fill-column 80)
              (setq auto-fill-column 80)
              (auto-fill-mode 1)
              )))
