;; This is the configuration file associated with some general setting,
;; related to all modes i.e. custom functionalities, personal keybindings

;; BASIC CUSTOMIZATION
;; --------------------------------------
(setq inhibit-startup-message t) ;; hide the startup message
(setq show-paren-style 'mixed) ;; highlight brackets if visible, else entire expression
(electric-pair-mode 1) ;; insert closing bracket, when opening one


;; SET COLORTHEME
;; --------------------------------------
(load-theme 'nord t)

;; SET FONT
;; --------------------------------------
(set-frame-font "Inconsolata-14" nil t)

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


;; CUSTOM FUNCTIONALITIES
;; --------------------------------------
;; kill all other buffers, except current one
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(global-set-key (kbd "C-x C-b") 'kill-other-buffers)


;; enable search keywords in google
(defun search-google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Google: "))))))
(global-set-key (kbd "C-c g") #'search-google)
