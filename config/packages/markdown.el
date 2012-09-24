;; 2012-09-08
(el-get 'sync '(markdown-mode))
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.md$" . markdown-mode)
             '("\\.markdown$" . gfm-mode))
(setq markdown-command "/usr/local/bin/markdown")
