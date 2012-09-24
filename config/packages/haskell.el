;;2012-09-23
;; (el-get 'sync '(haskell-mode))
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
