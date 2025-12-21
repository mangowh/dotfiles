(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;; packages
(package-initialize)

;; ensure use-package is available
(require 'use-package)

;; custom packages
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

;;; ui

;; moving between buffers
(windmove-default-keybindings 'meta)

;; disable beeping or blinking
(setq visible-bell nil)
(setq ring-bell-function #'ignore)

;; custom theme
(load-theme 'manoj-dark t)

;; custom font
(set-face-attribute 'default nil
                    :family "Atkinson Hyperlegible Mono"
                    :height 140)
(setq-default line-spacing 0.2)

;;; coding

;; font
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq-default fill-column 80)
(setq-default truncate-lines t)

(setq-default prettify-symbols-mode nil)

(global-display-line-numbers-mode 1)

;;; misc

;; allow for shorter responses: "y" for yes and "n" for no.
(setq read-answer-short t)
