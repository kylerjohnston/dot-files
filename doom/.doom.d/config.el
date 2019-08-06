;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; ui
(setq doom-theme 'doom-vibrant
      doom-font (font-spec :family "Source Code Pro" :size 15)
      doom-variable-pitch-font (font-spec :family "Source Sans Pro")
      doom-big-font (font-spec :family "Source Code Pro" :size 20))
(global-visual-line-mode 1)

;; emacs
(setq dired-dwim-target t)

;; lang

;; Fedora 30 installs Guile 2.0 and 2.2 as separate packages;
;; make Geiser use 2.2
(setq geiser-guile-binary "/usr/bin/guile2.2")

;; org-mode
(after! org
  (add-hook 'org-mode-hook #'visual-line-mode)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "IN PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CLOSED(c)")))
  (setq org-todo-keyword-faces
        '(("IN PROGRESS" warning bold)
          ("WAITING" error bold)
          ("CLOSED" org-done)))
  (setq org-default-notes-file
        (expand-file-name +org-capture-notes-file org-directory)
        org-capture-templates
        '(("t" "TODO" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %^{What do you need to do?}\n%?" :prepend t :kill-buffer t)))
  (setq org-archive-location (concat "archive/archive-" (format-time-string "%Y%m" (current-time)) ".org_archive::"))
  (setq org-startup-truncated nil)
  (setq org-log-done 'time)
  (setq org-export-with-smart-quotes t))