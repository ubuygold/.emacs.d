(use-package lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t))

;; Solve tramp slow
;; (setq remote-file-name-inhibit-cache nil)
;; (setq vc-ignore-dir-regexp
;;       (format "%s\\|%s"
;;               vc-ignore-dir-regexp
;;               tramp-file-name-regexp))
;; (setq tramp-verbose 1)
