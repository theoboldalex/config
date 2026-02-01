(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; basics
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq-default tab-width 4)

(transient-mark-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(set-frame-font "Monaspace Neon 15" nil t)
;; fix macos option key issues
(setq mac-option-modifier 'meta)
(setq mac-right-option-modifier nil)

;; emacs compile window and shell colors fix
(use-package ansi-color
  :hook ((compilation-filter . ansi-color-compilation-filter)
         (shell-mode . (lambda ()
                         (setq-local ansi-color-for-comint-mode t)))))
;; macos
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta
		mac-right-command-modifier 'super
		mac-option-modifier 'meta
		frame-resize-pixelwise t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (dotimes (n 5)
    (toggle-frame-maximized)))

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "s-x") 'smex) ;; spent too many years on MacOs
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(use-package yaml-mode
  :ensure t)
(use-package dockerfile-mode
  :ensure t)
(use-package python-mode
  :ensure t)
(use-package php-mode
  :ensure t)

(use-package lsp-mode
  :config
  (setq lsp-prefer-flymake nil)
  :hook (java-mode . lsp)
  :commands lsp)
(use-package lsp-java
  :ensure t
  :after lsp-mode
  :config)
(use-package company
  :config
  (global-company-mode)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0))
(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (paredit-mode 1))
  (add-hook 'clojure-mode-hook (paredit-mode 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-medium))
 '(custom-safe-themes
   '("5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" default))
 '(package-selected-packages
   '(paredit company lsp-java lsp-mode python-mode gruvbox-theme dockerfile-mode yaml-mode magit smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
