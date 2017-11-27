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
	      '((sequence "TODO(t)" "IN PROGRESS(p)" "|" "DONE(d)")))
(setq-default org-long-done 'time)
(setq org-directory "~/org")
(setq org-default-notes-file(concat org-directory "/inbox.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/org/inbox.org")
	 "* TODO %?\n")
	("n" "Note" entry (file "~/org/inbox.org")
	 "* %?\n")))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; appearance
(load-theme 'solarized-light t)
(add-to-list 'default-frame-alist '(font . "Source Code Pro:pixelsize=15:foundry=ADBO:weight=normal:slant=normal:width=normal:spacing=100:scalable=true"))
;; no scrollbars or toolbars
(scroll-bar-mode -1)
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (solarized-theme base16-theme evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )