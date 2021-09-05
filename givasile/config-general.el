;; enable syntax checking with flycheck, everywhere
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; enable company mode everywhere
;; (add-hook 'after-init-hook 'global-company-mode)

;; enable search keywords in google
(defun er-google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
				 (read-string "Google: "))))))

;; add keybinding
(global-set-key (kbd "C-c g") #'er-google)
