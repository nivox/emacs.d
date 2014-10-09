(provide 'settings)

;; First of all set the coding system
(prefer-coding-system 'utf-8)

;; Setting load path
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "config"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp/auto-complete-1.4"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp/popup-0.5")) ;; required by auto-complete
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp/haskell-mode-13.7"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp/javadoc-lookup"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp/scala-mode"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp/groovy-mode-201203310931"))
(add-to-list 'load-path (format "%s/%s" emacs-base-dir "site-elisp/multi-term-0.8.8"))

;; Load specific configuration for gui or terminal
(if window-system
    (require 'settings-gui)
  (require 'settings-terminal))

;; Load features
(require 'idomenu)
(require 'dired-aux)

;; Configuration
(require 'utils)
(require 'multi-term-conf)
(require 'keyboard-conf)
(require 'keybindings)
(require 'dired-conf)

;; Setup language specific feature
(require 'c-common-conf)
(require 'c-conf)
(require 'java-conf)
(require 'haskell-conf)

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

;; Setup package.el on Emacs 23
(if (< emacs-major-version 24)
    (progn
      (require 'package)
      (add-to-list 'package-archives
                   '("marmalade" .
                     "http://marmalade-repo.org/packages/"))
      (package-initialize)
      ))

;; Setup general modes preferences
(ido-mode 1)
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

; set browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;; Setup AutoComplete mode
(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-sources (append ac-sources '(ac-source-imenu)))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(setq ac-auto-show-menu nil)
(setq ac-ignore-case nil)

;; Setup imenu mode
(setq imenu-auto-rescan t)
(setq imenu-max-item-length 200)

;; MarkDown suffix configuration
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Setup coding system
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)

;; Setup Hooks
(add-hook 'before-save-hook 'remove-tabs-trspaces-empltylines) ;Clean the buffer when saving
