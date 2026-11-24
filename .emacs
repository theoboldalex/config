(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package emacs
  :ensure
  :init
  (load-theme 'wombat)
  
  (setq inhibit-splash-screen t)
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
  (set-frame-font "Monaspace Neon 14" nil t) ;; check if available and falback to system font otheriwse
  (fido-vertical-mode) ;; possibly don't need ido/smex or vertico etc

  (when (eq system-type 'darwin)
	(setq mac-command-modifier 'meta
		  mac-right-command-modifier 'super
		  mac-right-option-modifier nil
		  mac-option-modifier 'meta
		  frame-resize-pixelwise t)
	(dotimes (n 5)
      (toggle-frame-maximized))))

(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook #'enable-paredit-mode))

;; emacs compile window and shell colors fix
(setq display-buffer-alist
      '(("\\*compilation\\*"
         (display-buffer-same-window))))
(setq compilation-scroll-output t)
(use-package ansi-color
  :hook ((compilation-filter . ansi-color-compilation-filter)
         (shell-mode . (lambda ()
                         (setq-local ansi-color-for-comint-mode t)))))
;; Make magit open in the same window
(setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit paredit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
