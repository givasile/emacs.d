;; givasile part


;; configuration non-dependent on local configuration
;; ___________________________________________________________

;; add internal configs in after-init-hook to make sure it runs last
(add-hook 'after-init-hook '(lambda ()
                              (load "~/.emacs.d/givasile/universal/config-internals.el")
                              ))

;; loads additional package managers
(load "~/.emacs.d/givasile/universal/add-repos.el")

;; ;; loads remote packages (through package manager)
(load "~/.emacs.d/givasile/universal/add-remote-packages.el")

;; run cofiguration for python - ELPy dependent configurations
(load "~/.emacs.d/givasile/universal/config-python.el") ;; configs python

;; run configuration for latex (and in general text-based documents)
(load "~/.emacs.d/givasile/universal/config-latex.el") ;; configs auctex

;; run configuration for docker
(load "~/.emacs.d/givasile/universal/config-docker.el") ;; configs docker

;; ;; run configuration for nano-emacs (https://github.com/rougier/nano-emacs)
;; (load "~/.emacs.d/givasile/universal/config-nano.el")

;; run configuration for copilot
(load "~/.emacs.d/givasile/universal/config-copilot.el") ;; configs copilot

;; configuration dependent on local configuration
;; ___________________________________________________________

;; loads packages downloaded manualy
(when (file-exists-p "~/.emacs.d/givasile/dependent_on_local_pc/add-local-packages.el")
  (load "~/.emacs.d/givasile/dependent_on_local_pc/add-local-packages.el"))

(when (file-exists-p "~/.emacs.d/givasile/dependent_on_local_pc/config-internals.el")
  (load "~/.emacs.d/givasile/dependent_on_local_pc/config-internals.el"))

(when (file-exists-p "~/.emacs.d/givasile/dependent_on_local_pc/config-org.el")
  (load "~/.emacs.d/givasile/dependent_on_local_pc/config-org.el"))

;; run configuration for mu4e
(when (file-exists-p "~/.emacs.d/givasile/dependent_on_local_pc/config-mu4e.el")
  (load "~/.emacs.d/givasile/dependent_on_local_pc/config-mu4e.el"))


(provide 'init-local)
