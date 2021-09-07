;; REMOTE PACKAGES TO BE INSTALLED APART
;; FROM THE ONES INSTALLED BY DEFAULT FROM
;; https://github.com/purcell/emacs.d
;; --------------------------------------

;; general packages
(defvar generalPackages
  '(
    use-package ;; adds use-package macro for configuring packages in a tidy way
    simple-httpd  ;; simple emacs web server
    markdown-mode ;; edit markdowns from emacs
    csv-mode      ;; edit csv from emacs
    impatient-mode ;; live-preview of html in the browser (built on top of simple-httpd)
    flycheck ;; on-the-fly checker (uses many backends, depending on the language)
    calfw    ;; calendar view
    calfw-org        ;;
    org-super-agenda ;; better-view of the typical agenda
    material-theme   ;; nano related - add the material theme
    ))

;; python packages
(defvar pythonPackages
  '(better-defaults 
    ein
    elpy
    py-autopep8
    ))

;; latex packages
(defvar latexPackages
  '(
    auctex ;; writing and formatting tex documents
    ))

;; concatenate all packages to a list
(setq allPackages (append generalPackages pythonPackages latexPackages))

;; install each package only if not installed already
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)
            )
          )
      allPackages)

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; install packages on the fly with straight.el
(straight-use-package
 '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))

(straight-use-package
 '(mu4e-thread-folding :type git :host github :repo "rougier/mu4e-thread-folding"))

(straight-use-package
 '(mu4e-dashboard :type git :host github :repo "rougier/mu4e-dashboard"))
