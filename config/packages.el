;;; el-get
;; 複数のソースからパッケージをインストールできるパッケージ管理システム
;; 2012-03-15
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))
;; レシピ置き場
(add-to-list 'el-get-recipe-path
             (concat (file-name-directory load-file-name) "/el-get/recipes"))
;; 追加のレシピ置き場
(add-to-list 'el-get-recipe-path
             "~/.emacs.d/config/el-get/local-recipes")

;;; grep-edit
;; *grep*で編集できるようにする
(el-get 'sync '(grep-edit))
(add-hook 'grep-setup-hook
          (lambda ()
            (define-key grep-mode-map
              (kbd "C-c C-c") 'grep-edit-finish-edit)))

;;; ポップアップ
;; 2012-03-16
(el-get 'sync '(popup))

;;; Auto Complete
;; 自動補完
(el-get 'sync '(auto-complete))
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))

;;; Anything
;; iswitchbの代わり
(let ((original-browse-url-browser-function browse-url-browser-function))
  (el-get 'sync '(anything))
  (require 'anything-config)
  (anything-set-anything-command-map-prefix-key
   'anything-command-map-prefix-key "C-c C-<SPC>")
  (define-key global-map (kbd "C-x b") 'anything-for-files)
  (define-key global-map (kbd "C-x g") 'anything-imenu) ; experimental
  (define-key global-map (kbd "M-y") 'anything-show-kill-ring)
  (define-key anything-map (kbd "C-z") nil)
  (define-key anything-map (kbd "C-l") 'anything-execute-persistent-action)
  (define-key anything-map (kbd "C-o") nil)
  (define-key anything-map (kbd "C-M-n") 'anything-next-source)
  (define-key anything-map (kbd "C-M-p") 'anything-previous-source)
  (setq browse-url-browser-function original-browse-url-browser-function))

;;; Migemo
;; ローマ字で日本語をインクリメンタルサーチする。
;; 2012-03-19
;; インストールされていたら有効にする。
(require 'migemo nil t)

;;; ruby-mode
;; Emacsにバンドルされているruby-modeは古いのでRubyのリポジ
;; トリに入っているものを使う。
;; 2012-03-15
(el-get 'sync '(ruby-mode))

;;; rabbit-mode
;; 2012-03-16
;(el-get 'sync '(rabbit-mode))

;;; run-test
;; テスト実行
(el-get 'sync '(run-test))

;;; Magit
;; 2012-03-24
(load "config/packages/magit")

;;; rst-mode
;; reStructuredText編集用のモード
;; 2012-03-24
;(el-get 'sync '(rst-mode))

;; color-theme
;; 標準のカラーテーマを使用
;;(load "config/packages/color-theme")

;; lang

;scala
;(load "config/packages/scala")

;; golang
(load "config/packages/go")

;; javascript
(load "config/packages/javascript")

;; yaml
(load "config/packages/yaml")

;; markdown-mode
(load "config/packages/markdown")

;; haskell-mode
(load "config/packages/haskell")
;; yasnipet, flymake

;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-15
(condition-case err
    (load "config/packages/local")
  (error))
