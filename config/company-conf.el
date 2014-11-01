(provide 'company-conf)

(autoload 'company-mode "company" nil t)

;; company-eclim
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)
