;; INSTALL PACKAGES
;; --------------------------------------

(defvar generalPackages
  '(
    use-package               ;; adds use-package macro for configuring packages in a tidy way
    simple-httpd              ;; simple emacs web server
    ;; yasnippet                 ;; supports auto-complete snippets
    ;; yasnippet-snippets        ;; list of common snippets
    ;; company                   ;; auto-completion tool
    ;; projectile                ;; offers project-level manipulation (find etc)
    ;; magit                     ;; git inside emacs
    markdown-mode             ;; edit markdowns from emacs
    csv-mode                  ;; edit csv from emacs
    impatient-mode            ;; live-preview of html in the browser (built on top of simple-httpd)
    flycheck                  ;; on-the-fly checker (uses many backends, depending on the language)
    ;; nord-theme                ;; nice theme from https://github.com/arcticicestudio/nord-emacs
    ;; material-theme            ;; add the material theme
    ))

;; TODO add descriptions
(defvar pythonPackages
  '(better-defaults 
    ein
    elpy
    py-autopep8
    ))

(defvar latexPackages
  '(
    auctex ;; writing and formatting tex documents
    ))

;; concatenate all packages to a list
(setq allPackages (append generalPackages pythonPackages latexPackages))

;; install each package only if not installed already
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      allPackages)
