;; PYTHON CONFIGURATION
;; --------------------------------------

;; set the rpc (= background process elpy runs for code inspection/completion etc)
;; to use the current active environments binaries
;; (by default, it uses a separate dedicated environment at ~/.emacs.d/elpy/rpc/)
(setq elpy-rpc-virtualenv-path 'current)

;; set the WORKON_HOME env variable where miniconda is installed
;; for being able to choose an environment with pyvenv-activate
(setenv "WORKON_HOME" "~/miniconda3/envs")

;; start elpy 
(elpy-enable)

;; defice the interpreter to use with C-c C-c
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; set tab width to 2
(setq-default tab-width 2)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting when save a file
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; INSTRUCTIONS
;; Every time we open a python-project, I have to set up the virtual-env
;; either with pyvenv-activate or with pyvenv-workon

;; It is good to set the project root with M-x elpy-set-project-root
;; for finding all files inside the project
