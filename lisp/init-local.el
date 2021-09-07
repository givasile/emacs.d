;; givasile part
;; add internal configs in after-init-hook to make sure it runs last
(add-hook 'after-init-hook '(lambda ()
                              (load "~/.emacs.d/givasile/config-internals.el")
                              ))

;; loads additional package managers
(load "~/.emacs.d/givasile/add-repos.el")

;; ;; loads remote packages (through package manager)
(load "~/.emacs.d/givasile/add-remote-packages.el")

;; loads packages downloaded manualy
(load "~/.emacs.d/givasile/add-local-packages.el")

;; ;; runs cofiguration for general packages
(load "~/.emacs.d/givasile/config-general.el")

;; run cofiguration for python - ELPy dependent configurations
(load "~/.emacs.d/givasile/config-python.el") ;; configs python

;; run configuration for latex (and in general text-based documents)
(load "~/.emacs.d/givasile/config-latex.el") ;; configs auctex

;; run configuration for docker
(load "~/.emacs.d/givasile/config-docker.el") ;; configs docker

;; run configuration for org-mode
(load "~/.emacs.d/givasile/config-org.el") ;; configs org-mode

;; run configuration for mu4e
(load "~/.emacs.d/givasile/config-mu4e.el") ;; configs org-mode

;; ;; run configuration for nano-emacs (https://github.com/rougier/nano-emacs)
;; (load "~/.emacs.d/givasile/config-nano.el")

(provide 'init-local)
