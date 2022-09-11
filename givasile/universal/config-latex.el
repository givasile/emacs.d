;; LATEX configuration
;; TODO explain what this command does
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -shell-escape %S%(PDFout)")))

;; Enable reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(setq reftex-plug-into-AUCTeX t) ; make it work with auctex
(setq reftex-cite-format 'natbib)

;; (load "preview-latex.el" nil t t) ; automatically load preview latex

;; make $ to automatically insert inline math symbols "\( \)"
(add-hook 'plain-TeX-mode-hook
          (lambda () (set (make-local-variable 'TeX-electric-math)
                          (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-local-variable 'TeX-electric-math)
                          (cons "\\(" "\\)"))))

;; MARKDOWN configuration
(use-package markdown-mode
  :ensure t ;; ensure already installed, otherwise do it
  :mode ("\\.md\\'" . gfm-mode) ;; if file ends in ".md", run gfm-mode
  :commands (markdown-mode gfm-mode) ;; autoload (show to emacs where these commands live)
  :config                            ;; entering config area
  (setq markdown-command "pandoc -t html5")) ;; set the markdown command AFTER package is loaded (pandoc must be installed at the system)

(use-package simple-httpd
  :ensure t ;; ensure already installed, otherwise do it
  :config ;; entering config area
  (setq httpd-port 7070) ;; set 7070 to be the http port
  (setq httpd-host (system-name))) ;; set the host to be the system name (system-name is an env variable)

(use-package impatient-mode
  :ensure t ;; ensure already installed, otherwise do it
  :commands impatient-mode) ;; autoload (show to emacs where these commands live)

;; function for mapping content of current buffer -> html5
(defun my-markdown-filter (buffer)
  (princ
   (with-temp-buffer
     (let ((tmp (buffer-name)))
       (set-buffer buffer)
       (set-buffer (markdown tmp))
       (format "<!DOCTYPE html><html><title>Markdown preview</title><link rel=\"stylesheet\" href = \"https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css\"/>
<body><article class=\"markdown-body\" style=\"box-sizing: border-box;min-width: 200px;max-width: 980px;margin: 0 auto;padding: 45px;\">%s</article></body></html>" (buffer-string))))
   (current-buffer)))

;; function that converts md buffer to html and visualizes it at the browser on the fly
(defun md-preview ()
  "Preview markdown."
  (interactive) ;; set mode to interactive

  ;; if httpd is not already running, start it
  (unless (process-status "httpd")
    (httpd-start))

  ;; start impatient mode on current buffer
  (impatient-mode)

  ;; set filter of impatient mode to my-markdown-filter
  (imp-set-user-filter 'my-markdown-filter)

  ;; visit the current buffer in the browser
  (imp-visit-buffer))
