
(provide 'settings)

;; First of all set the coding system
(prefer-coding-system 'utf-8)

;; Setting exec path
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Setting load path
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "config"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp"))

;; Load specific configuration for gui or terminal
(if window-system
    (require 'settings-gui)
  (require 'settings-terminal))

;; Setup package
(require 'package-conf)
(require 'install-packages)

;; Load features
;;(autoload 'idomenu "idomenu" nil t)

;; Configuration
(require 'utils)
(require 'keybindings)
(require 'dired-conf)
(require 'company-conf)
(require 'speedbar-conf)

;; Setup language specific feature
(require 'scala-conf)
(require 'c-common-conf)
(require 'c-conf)


(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

;; Setup general modes preferences
(ivy-mode 1)
(define-key ivy-minibuffer-map (kbd "TAB") 'ivy-partial)

(windmove-default-keybindings)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil) ;Use spaces not tabs!
(add-to-list 'remove-tabs-inhibit-for-modes 'makefile-mode)
(add-to-list 'remove-tabs-inhibit-for-modes 'BSDmakefile)

(global-hl-line-mode t) ;Show current line
(column-number-mode 1) ;Show column number

(setq-default truncate-lines t) ; don't wrap!
(setq truncate-partial-width-windows nil)
(defalias 'yes-or-no-p 'y-or-n-p) ; don't make me type yes!

; don't put backup file (~) everywhere!
(setq backup-directory-alist `(("." . "~/.emacs-backups")))
(setq browse-url-browser-function 'eww-browse-url)


;; Setup imenu mode
(setq imenu-auto-rescan t)
(setq imenu-max-item-length 200)

;; MarkDown suffix configuration
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Setup coding system
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)

;; Don't open new frames
(setq ns-pop-up-frames nil)
