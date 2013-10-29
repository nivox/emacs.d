(provide 'c-common-conf)

;; Setup paren mode & instruct it to show matching line
(show-paren-mode 1)
(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
   echo area. Has no effect if the character before point is not of
   the syntax class ')'."
  (interactive)
  (if (not (minibuffer-prompt))
      (let ((matching-text nil))
        ;; Only call `blink-matching-open' if the character before point
        ;; is a close parentheses type character. Otherwise, there's not
        ;; really any point, and `blink-matching-open' would just echo
        ;; "Mismatched parentheses", which gets really annoying.
        (if (char-equal (char-syntax (char-before (point))) ?\))
            (setq matching-text (blink-matching-open)))
        (if (not (null matching-text))
            (message matching-text)))))

;; Redefine keys
(add-hook 'c-mode-common-hook
          (lambda ()
              ; Don't overwrite comment-or-uncomment-region
              (local-unset-key (kbd "C-c C-c"))))

;; Automaticaly activate linum-mode
(add-hook 'c-mode-common-hook
          (lambda () (linum-mode 1)))

;; Atumatically activate flyspell
(add-hook 'c-mode-common-hook
          (lambda () (flyspell-prog-mode)))

;; Activate semantic by default
(add-hook 'c-mode-common-hook
          (lambda ()
            (auto-complete-mode)))