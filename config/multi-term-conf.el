(provide 'multi-term-conf)

(require 'multi-term)
(setq multi-term-program "/bin/bash")

(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(set 'term-bind-key-alist ())

(add-to-list 'term-bind-key-alist '("C-c C-c" . term-interrupt-subjob))
(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))
(add-to-list 'term-bind-key-alist '("C-p" . term-send-up))
(add-to-list 'term-bind-key-alist '("M-p" . previous-line))
(add-to-list 'term-bind-key-alist '("C-n" . term-send-down))
(add-to-list 'term-bind-key-alist '("M-n" . next-line))

(add-to-list 'term-bind-key-alist '("C-r" . term-send-reverse-search-history))
(add-to-list 'term-bind-key-alist '("C-y" . term-paste))

(add-to-list 'term-bind-key-alist '("M-f" . term-send-forward-word))
(add-to-list 'term-bind-key-alist '("M-b" . term-send-backward-word))
(add-to-list 'term-bind-key-alist '("M-d" . term-send-forward-kill-word))
(add-to-list 'term-bind-key-alist '("M-<DEL>" . term-send-backward-kill-word))

(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-esc))
(add-to-list 'term-bind-key-alist '("C-c C-j" . term-line-mode))
(add-to-list 'term-bind-key-alist '("C-c C-k" . term-char-mode))
(add-to-list 'term-bind-key-alist '("C-c C-p" . multi-term-prev))
(add-to-list 'term-bind-key-alist '("C-c C-n" . multi-term-next))
