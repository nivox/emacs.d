(provide 'keybindings)

;; Assorted keybindings
(global-set-key (kbd "<C-tab>") 'company-complete)
(global-set-key (kbd "C-c a") 'company-mode)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

;; Window size management
(global-set-key (kbd "M-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-S-<down>") 'shrink-window)
(global-set-key (kbd "M-S-<up>") 'enlarge-window)

(setq multiline-move-number 5)
(global-set-key (kbd "M-p") '(lambda() (interactive) (previous-line multiline-move-number)))
(global-set-key (kbd "M-n") '(lambda() (interactive) (next-line multiline-move-number)))
