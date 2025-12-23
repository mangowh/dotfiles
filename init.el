;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-


;; custom.el file

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; autosave

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; help

(which-key-mode 1)

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
;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; use-package
(require 'use-package)

(use-package company
  :ensure t)

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

;;; coding

;; lua
(setq treesit-language-source-alist
      '((lua "https://github.com/MunifTanjim/tree-sitter-lua")))

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))

;; font
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq-default fill-column 80)
(setq-default truncate-lines t)

(setq-default prettify-symbols-mode nil)

(global-display-line-numbers-mode 1)

;; langs

;;; markdown

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;;; misc

;; allow for shorter responses: "y" for yes and "n" for no.
(setq read-answer-short t)

(column-number-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)
(desktop-save-mode 1)
