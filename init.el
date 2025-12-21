(package-initialize)

(use-package ace-window
  :bind (("M-o" . ace-window)))

(windmove-default-keybindings 'meta)

(setq visible-bell 1)

(load-theme 'manoj-dark t)

(set-face-attribute 'default nil
                    :family "Atkinson Hyperlegible Mono"
                    :height 140)

(setq-default line-spacing 0.2)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq-default fill-column 80)
(setq-default truncate-lines t)

(setq-default prettify-symbols-mode nil)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-display-line-numbers-mode 1)

