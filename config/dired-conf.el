(provide 'dired-conf)

(require 'dired-single)
(require 'dired-x)

(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer "..")))))

;load my-dired-init
(if (boundp 'dired-mode-map)
    (my-dired-init)
  (add-hook 'dired-load-hook 'my-dired-init))


(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq dired-omit-files "^\\..*$")

(add-hook 'dired-mode-hook 'my-dired-buffer-name)
(defun my-dired-buffer-name ()
  (rename-buffer (concat "DIRED:" (buffer-name))))

  ;; (let ((name (buffer-name)))
  ;;   (if (not (string-match "/$" name))
  ;;       (rename-buffer (concat name "/") t))))
