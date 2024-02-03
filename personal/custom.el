(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(coffee-mode geiser-mit geiser-chez company-solidity solidity-flycheck solidity-mode csv-mode counsel-tramp lsp-tailwindcss helm-rg prettier ace-window)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode))

;; Change default find-file to find file for better tramp instead of ivy
(global-set-key (kbd "C-x C-f") 'find-file)

;; Set ivy Project find function
(global-set-key (kbd "C-c C-s") 'counsel-rg)

;; chezscheme
(setq scheme-program-name "chezscheme")
(setq geiser-chez-binary "chezscheme")

;;coffee-lsp
;; (require 'lsp-mode)
;; (add-to-list 'lsp-language-id-configuration '(coffee-mode . "coffeescript-language-server"))
;; (lsp-register-client
;;  (make-lsp-client :new-connection (lsp-stdio-connection "coffeesense-language-server")
;;                   :major-modes '(coffee-mode)
;;                   :server-id 'coffeesense))

;; eglot coffeescript
(require 'eglot)
;; Auto lauch eglot
(add-to-list 'eglot-server-programs '(coffee-mode . ("coffeesense-language-server")))
(require 'coffee-mode)
(add-hook 'coffee-mode-hook 'eglot-ensure)
