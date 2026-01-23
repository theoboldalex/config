(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; basics
(transient-mark-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(fset 'yes-or-no-p 'y-or-n-p)
(set-frame-font "Monaspace Neon 15" nil t)

(setq mac-option-modifier 'meta)
(setq mac-right-option-modifier nil)

;; emacs compile window fix
(use-package ansi-color
    :hook (compilation-filter . ansi-color-compilation-filter))


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

;; dired
;; (setq dired-listing-switches "-lah --group-directories-first")
;; (add-hook 'dired-mode-hook
;; 	  (lambda () (dired-hide-details-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(jetbrains-darcula))
 '(custom-safe-themes
   '("9b55271bec4b2bae7eca6c96eac974b19f2f6d8cccc8fd34b30ab67220bb19d5" default))
 '(package-selected-packages '(magit smex jetbrains-darcula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
