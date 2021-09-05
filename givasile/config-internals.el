;; This is the configuration file associated with the internal (built-in components) of Emacs.

;; CUSTOM-KEY BINDINGS
;; --------------------------------------
;; open new line as in vim
(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun vi-open-line (&optional abovep)
  "Insert a newline below the current line and put point at beginning.
With a prefix argument, insert a newline above the current line."
  (interactive "P")
  (if abovep
      (vi-open-line-above)
    (vi-open-line-below)))

(global-set-key (kbd "C-o") 'vi-open-line-below)
(global-set-key (kbd "M-o") 'vi-open-line-above)


;; PROJECTILE KEY BINDINGS
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Remove scrollbars, menu bars, and toolbars
;; (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t) ;; hide the startup message

;; (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/")) ;; add path where nord-emacs theme is stored
;; (load-theme 'nord t) ;; load material theme

;; (global-linum-mode t) ;; enable line numbers globally
(setq show-paren-style 'mixed) ;; highlight brackets if visible, else entire expression
(electric-pair-mode 1) ;; insert closing bracket, when opening one
