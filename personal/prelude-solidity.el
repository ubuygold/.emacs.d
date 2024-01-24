(require 'prelude-programming)
(require 'prelude-lsp)
(prelude-require-packages '(lsp-mode lsp-ui company-solidity solidity-mode))

;; 设置 .sol 文件使用 solidity
(add-to-list 'auto-mode-alist '("\\.sol\\'" . solidity-mode))

(with-eval-after-load 'solidity-mode
  (defun prelude-solidity-mode-defaults ()
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (require 'lsp-mode)
    (lsp-deferred))

  ;; format
  (add-hook 'before-save-hook
            (lambda ()
              (when prelude-format-on-save
                (lsp-format-buffer))))
  (setq prelude-solidity-mode-hook 'prelude-solidity-mode-defaults)
  (add-hook 'solidity-mode-hook (lambda () (run-hooks 'prelude-solidity-mode-hook))))

(provide 'prelude-solidity)
