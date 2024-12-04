;;; early-init.el --- early initialization file -*- lexical-binding: t -*-

;; disable package.el
(setq package-enable-at-startup nil)

;; set eln-cache dir
(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache (expand-file-name "eln-cache/" "~/.local/share/emacs")))
