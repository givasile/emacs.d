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
