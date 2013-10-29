(provide 'utils)

(defun all(f lst)
  "Return non-nil if function f(list_element) returns non-nil for all
   the elements of the list"
  (let ((result t))
    (dolist (el lst)
      (setq result (and result (funcall f el))))
       result))


(defvar remove-tabs-inhibit-for-modes '()
  "Mode to not untabify")

(defun remove-tabs-trspaces-empltylines()
  "Clean the current buffer from trailing spaces and empty lines at the end of the file.
   Also untabify the buffer in major-mode not in list remove-tabs-inhibit-for-modes"
  (interactive)
  (message "Cleaning the buffer from tabs, trailing whitespaces and empty lines")

  (when (or (not remove-tabs-inhibit-for-modes)
            (all '(lambda (e) (not (derived-mode-p e))) remove-tabs-inhibit-for-modes))
    (untabify 0 (point-max)))

  (delete-trailing-whitespace)
  (let ((current (point)))
    (goto-char (point-max))
    (delete-blank-lines)
    (goto-char current)
    )
  )

(defun string-strip (str)
  "Strip leading and tailing whitespace from STR."
  (let ((s (if (symbolp str) (symbol-name str) str)))
    (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" s)))



(defun getenv-list (name)
  (let (separator)
    (if (string= system-type "windows-nt")
        (setq separator ";")
      (setq separator ":"))

    (let (env_lst)
      (when (getenv name)
        (dolist (el (split-string (getenv name) separator))
          (if (not (string= (string-strip el) "")) (add-to-list 'env_lst el))))
      env_lst)))
