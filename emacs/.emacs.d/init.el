(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; install use-package if it does not exist
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1)))

;; org mode config
(setq org-agenda-files (quote ("~/org")))
; disable truncating lines mid-word
(setq-default org-startup-truncated nil)
(add-hook 'org-mode-hook #'visual-line-mode)
;; 'clean view' --- indents, not extra *s for headings
(setq-default org-startup-indented t)
;; don't let org edit things under collapsed headings
(setq-default org-catch-invisible-edits 'smart)
(setq-default org-todo-keywords
	      '((sequence "TODO(t)" "IN PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CLOSED(c)")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("IN PROGRESS" . font-lock-builtin-face)
	("WAITING" org-agenda-dimmed-todo-face)
	("CLOSED" org-done) ("DONE" org-done)))
(setq-default org-log-done 'time)
(setq org-directory "~/org")
(setq org-default-notes-file(concat org-directory "/inbox.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/tasks.org" "Unsorted")
	 "* TODO %^{What do you need to do?}\n%?"
	 :immediate-finish)
	("n" "Note" entry (file "~/org/inbox.org")
	 "* %^{Title}\n%?\n%U")
	("b" "Bill due" entry (file+headline "~/org/tasks.org" "Bills")
	 "* TODO %^{Payee} due $%^{Amount due}\nDEADLINE: %^t"
	 :immediate-finish)))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-archive-location (concat "archive/archive-" (format-time-string "%Y%m" (current-time)) ".org_archive::"))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-hide-emphasis-markers t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;; variable-width fonts for org mode and others
'(variable-pitch ((t (:family "Roboto" :height 160))))
(defun set-buffer-variable-pitch ()
  (interactive)
  (variable-pitch-mode t)
  (setq line-spacing 3)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block-background nil :inherit 'fixed-pitch)
  )

(add-hook 'org-mode-hook 'set-buffer-variable-pitch)
(add-hook 'eww-mode-hook 'set-buffer-variable-pitch)
(add-hook 'markdown-mode-hook 'set-buffer-variable-pitch)
(add-hook 'Info-mode-hook 'set-buffer-variable-pitch)

;; customize header colors


(let* ((variable-tuple (cond ((x-list-fonts "Roboto") '(:font "Roboto"))
                             ((x-list-fonts "Verdana")         '(:font "Verdana"))
                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground "#657b83")))

  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))
                          `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                          `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                          `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))


;; exporting
(setq org-export-with-smart-quotes t)

;; appearance
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))
(add-to-list 'default-frame-alist '(font . "Source Code Pro Medium:pixelsize=15:foundry=ADBO:weight=normal:slant=normal:width=normal:spacing=100:scalable=true"))
;; no scrollbars or toolbars
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode +1)
(setq bell-volume 0)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (markdown-mode pkgbuild-mode yaml-mode color-theme-sanityinc-tomorrow zenburn-theme olivetti darkroom solarized-theme base16-theme evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto" :height 1.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#657b83" :font "Roboto")))))
