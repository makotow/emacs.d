;; カスタマイズ用
;; font
(when (>= emacs-major-version 23)
  (let* ((size 16)
         (asciifont "Ricty") ; ASCII fonts
         (jpfont "Ricty") ; Japanese fonts
         (h (* size 10))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
    (set-fontset-font nil '(#x0080 . #x024F) fontspec)
    (set-fontset-font nil '(#x0370 . #x03FF) fontspec))

  (dolist (elt '(("^-apple-hiragino.*" . 1.2)
                 (".*osaka-bold.*" . 1.2)
                 (".*osaka-medium.*" . 1.2)
                 (".*courier-bold-.*-mac-roman" . 1.0)
                 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
                 (".*monaco-bold-.*-mac-roman" . 0.9)))
    (add-to-list 'face-font-rescale-alist elt)))

;;フレームの設定もここへいれてしまう
(setq default-frame-alist
      (append '( (cursor-color . "Navy")
                 (height . 70)
                 (top . 50)
                 (left . 120)
                 (width . 100)
                 )
              default-frame-alist))

;; don't show startup
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; alpha
(set-frame-parameter nil 'alpha 85)
;; generic-mode 
(require 'generic-x)

;; 行番号の表示
(global-linum-mode 1)

;; ビープ音,画面フラッシュなし
(setq ring-bell-function 'ignore)

;; OSX <-> Emacsのクリップボード共有
(setq x-select-enable-clipboard nil)
(setq x-select-enable-primary t)
(setq select-active-regions nil)

;; 保存時に行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
