(provide 'multi-term-conf)

(require 'multi-term)
(setq multi-term-program "/bin/bash")

(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))
(add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))
(add-to-list 'term-bind-key-alist '("C-c C-k" . term-char-mode))
(add-to-list 'term-bind-key-alist '("C-c C-p" . multi-term-prev))
(add-to-list 'term-bind-key-alist '("C-c C-n" . multi-term-next))
