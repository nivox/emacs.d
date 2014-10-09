(provide 'settings-gui)
(message "Loading Emacs specific configuration for GUI")

(tool-bar-mode 0) ;Don't show the toolbar

;; Set up default face
(set-face-background 'default "black")
(set-face-foreground 'default "green3")
(set-cursor-color "red")
(setq cursor-type 'box)

(set-face-attribute 'default nil :height 90)
