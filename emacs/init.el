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
(setq-default tab-width 4)

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
  (add-hook 'emacs-lisp-mode-hook (paredit-mode 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-medium))
 '(custom-safe-themes
   '("51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "e14289199861a5db890065fdc5f3d3c22c5bac607e0dbce7f35ce60e6b55fc52" "921f165deb8030167d44eaa82e85fcef0254b212439b550a9b6c924f281b5695" "9e5e0ff3a81344c9b1e6bfc9b3dcf9b96d5ec6a60d8de6d4c762ee9e2121dfb2" "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1" "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1" "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4" "3613617b9953c22fe46ef2b593a2e5bc79ef3cc88770602e7e569bbd71de113b" "42a6583a45e0f413e3197907aa5acca3293ef33b4d3b388f54fa44435a494739" "c9d837f562685309358d8dc7fccb371ed507c0ae19cf3c9ae67875db0c038632" "70c88c01b0b5fde9ecf3bb23d542acba45bb4c5ae0c1330b965def2b6ce6fac3" "fffef514346b2a43900e1c7ea2bc7d84cbdd4aa66c1b51946aade4b8d343b55a" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176" "f1e8339b04aef8f145dd4782d03499d9d716fdc0361319411ac2efc603249326" "4b88b7ca61eb48bb22e2a4b589be66ba31ba805860db9ed51b4c484f3ef612a7" "c3c135e69890de6a85ebf791017d458d3deb3954f81dcb7ac8c430e1620bb0f1" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "22a0d47fe2e6159e2f15449fcb90bbf2fe1940b185ff143995cc604ead1ea171" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "83550d0386203f010fa42ad1af064a766cfec06fc2f42eb4f2d89ab646f3ac01" "5244ba0273a952a536e07abaad1fdf7c90d7ebb3647f36269c23bfd1cf20b0b8" "9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9" "166a2faa9dc5b5b3359f7a31a09127ebf7a7926562710367086fcc8fc72145da" "7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "261a03733c20ebcf26e6f9533359977f3040a9aa10088727893ae4954369eb43" "9b55271bec4b2bae7eca6c96eac974b19f2f6d8cccc8fd34b30ab67220bb19d5" default))
 '(package-selected-packages
   '(paredit company lsp-java lsp-mode python-mode gruvbox-theme dockerfile-mode yaml-mode magit smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
