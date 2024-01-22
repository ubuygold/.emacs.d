(require 'prelude-programming)
(prelude-require-packages '(lsp-mode tide web-mode typescript-mode))

;; 设置 .tsx 文件使用 web-mode
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(defun setup-tsx-mode ()
  (when (string-equal "tsx" (file-name-extension buffer-file-name))
    ;; 启动 Tide 用于 TypeScript 支持
    (tide-setup)
    (tide-hl-identifier-mode +1)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (add-hook 'before-save-hook 'tide-format-before-save nil t)

    ;; 启动 LSP 和 LSP-TailwindCSS
    (require 'lsp-mode)
    (lsp-deferred)))

;; 在 web-mode 下为 .tsx 文件启动配置
(add-hook 'web-mode-hook #'setup-tsx-mode)

(provide 'prelude-typescript-tsx)
