(provide 'java-conf)

;; Configure javadoc-lookup
(require 'javadoc-lookup)

(require 'java-import)
;(javadoc-add-roots "~/opt/doc/java/api7" "~/opt/doc/scala/api-2.9.3")

(defun my-javadoc-keys ()
  (local-set-key (kbd "C-h j") 'javadoc-lookup)
  (local-set-key (kbd "C-c j a") 'add-java-import)
  (local-set-key (kbd "C-c j s") 'sort-java-imports)
)
(add-hook 'java-mode-hook 'my-javadoc-keys)
(add-hook 'scala-mode-hook 'my-javadoc-keys)


;; Configure annotation
(require 'java-mode-indent-annotations)
(add-hook 'java-mode-hook 'java-mode-indent-annotations-setup)

(require 'scala-mode-auto)

(require 'groovy-mode-autoloads)

;; Setting styles

;; Setting fill & marker
(defun my-java-set-fill ()
  (setq auto-fill-column 80)
  (setq fill-column 80)
  (auto-fill-mode 1))

(add-hook 'java-mode-hook 'my-java-set-fill)

(defun my-java-conf ()
  (subword-mode)
  (imenu-add-to-menubar "SourceNavigation"))
(add-hook 'java-mode-hook 'my-java-conf)
(add-hook 'scala-mode-hook 'my-java-conf)

;; Eclim configuration
(require 'eclim)
(require 'eclimd)
(global-eclim-mode)

(custom-set-variables
  '(eclim-eclipse-dirs '("~/opt/eclipse/"))
  '(eclim-executable "~/opt/eclipse/eclim"))
