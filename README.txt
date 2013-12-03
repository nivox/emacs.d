Steps:
 1. Setup .emacs
 2. Byte-compile el sources

1) To setup put this in the .emacs:

;; path to the dir
(setq emacs-base-dir "path/to/emacs.d")

;; path to project conf file
(setq ede-project-def-file "~/.ede-projects")

(add-to-list 'load-path emacs-base-dir)
(require 'settings)

2) Recompile all el files
select the following line and then evalueate it with M-x eval-region
(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
