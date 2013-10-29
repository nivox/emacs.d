(provide 'multi-term-conf)

(require 'multi-term)
(setq multi-term-program "/bin/bash")

(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))