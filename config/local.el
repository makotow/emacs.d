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

(when window-system
  (if (>= (x-display-pixel-width) 800) (setq width-gain 0.6) (setq width-gain 0.8))
  (if (>= (x-display-pixel-height) 1000) (setq height-gain 0.7) (setq height-gain 0.87))
  (set-frame-size (selected-frame)
                  (floor (/ (* (x-display-pixel-width) width-gain) (frame-char-width)))
                  (floor (/ (* (x-display-pixel-height) height-gain) (frame-char-height))))
)


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
(setq x-select-enable-clipboard t)
(global-set-key "C-y" 'x-clipboard-yank)
;;(setq x-select-enable-primary t)
;;(setq select-active-regions t)

;; 保存時に行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
