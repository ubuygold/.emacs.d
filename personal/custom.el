(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(package-selected-packages
   '(counsel-tramp lsp-tailwindcss helm-rg prettier ace-window)))

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

(with-eval-after-load 'typescript-mode
  (defun prelude-ts-mode-defaults ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (lsp-mode +1)
    (tide-hl-identifier-mode +1))

  ;; formats the buffer before saving
  (add-hook 'before-save-hook
            (lambda ()
              (when prelude-format-on-save
                (tide-format-before-save))))

  (setq prelude-ts-mode-hook 'prelude-ts-mode-defaults)

  (add-hook 'typescript-mode-hook (lambda () (run-hooks 'prelude-ts-mode-hook))))
