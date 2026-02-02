;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-


;;; custom.el file
;;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;; backups & autosave

(make-directory (expand-file-name "backups" user-emacs-directory) t)
(make-directory (expand-file-name "autosaves" user-emacs-directory) t)

(setq backup-directory-alist
      `((".*" . ,(expand-file-name "backups/" user-emacs-directory))))

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "autosaves/" user-emacs-directory) t)))

(setq auto-save-list-file-prefix
      (expand-file-name "autosaves/.saves-" user-emacs-directory))

;;; help
(which-key-mode t)

;;; ui
(setq mac-right-option-modifier 'none) ;; macos consider right alt as not a modifier

;;; disable beeping or blinking
(setq visible-bell nil)
(setq ring-bell-function #'ignore)

;;; custom theme
(load-theme 'manoj-dark t)

;;; custom font
(set-face-attribute 'default nil
                    :family "Atkinson Hyperlegible Mono"
                    :height 140)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default line-spacing 0.2)
(setq-default fill-column 80)
(setq-default truncate-lines t)

(setq-default prettify-symbols-mode nil)

;;;
;;; PACKAGES
;;;

;;; setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;;; use-package
(require 'use-package)

;;; load env from current user shell
;;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

;;; magit
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
)

;;; company (autocomplete)
;;; https://company-mode.github.io/
(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

;;;
;;; LANGS
;;;

;;; https://web-mode.org/
(use-package web-mode
  :ensure t
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode))
   ("\\.html?\\'" . web-mode))

;;; markdown
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;;; python
(setq python-shell-interpreter "python3")
(add-hook 'python-mode-hook 'eglot-ensure) ;; C-h .

;;; lua
(setq treesit-language-source-alist
      '((lua "https://github.com/MunifTanjim/tree-sitter-lua")))

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))

;;;
;;; MISC
;;;

;;; display line number
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
;; relative line number
(setq display-line-numbers-type 'relative)

;;; allow for shorter responses: "y" for yes and "n" for no.
(setq read-answer-short t)
(setq use-short-answers t)

(add-to-list 'default-frame-alist '(tool-bar-lines . 0)) ;; fix to remove tool bar from current frame
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)
(desktop-save-mode 1)

(fido-vertical-mode t)

(save-place-mode 1)
(savehist-mode 1)

(repeat-mode 1)  ;; C-x o o o to keep switching windows

(global-completion-preview-mode 1) ;; inline autocomplete preview

;;; recent files
;;; https://www.emacswiki.org/emacs/RecentFiles
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq confirm-kill-emacs 'y-or-n-p)
