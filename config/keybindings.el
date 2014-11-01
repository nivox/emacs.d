(provide 'keybindings)


(setq my-general-commands '(company-mode
                            company-complete
                            ido-goto-symbol
                            goto-line
                            upcase-word
                            downcase-word
                            fill-paragraph
                            comment-region
                            uncomment-region
                            comment-or-uncomment-region
                            compile
                            multi-term))


;; Assorted keybindings
(global-set-key (kbd "<C-tab>") 'company-complete)
(global-set-key (kbd "C-c a") 'company-mode)
(global-set-key (kbd "C-c g") 'ido-goto-symbol)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c c") 'compile)

;; Window size management
(global-set-key (kbd "M-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-<down>") 'shrink-window)
(global-set-key (kbd "M-s-<up>") 'enlarge-window)

(setq multiline-move-number 5)
(global-set-key (kbd "M-p") '(lambda() (interactive) (previous-line multiline-move-number)))
(global-set-key (kbd "M-n") '(lambda() (interactive) (next-line multiline-move-number)))

(global-set-key (kbd "C-c t") 'multi-term)


(defun keys-general()
  (interactive)
  (let ((help_buffer "*General-Keybindings*"))
    (if (not (get-buffer help_buffer))
        (progn
          (generate-new-buffer help_buffer)
          (set-buffer help_buffer)
          (insert "Genearl keybindings\n")
          (insert "--------------------------\n")

          (dolist (cmd my-general-commands)

            (insert (format "%s:\t%s\n" cmd (key-description (where-is-internal cmd nil t)))))
          (setq buffer-read-only t)))
    (pop-to-buffer help_buffer)))
