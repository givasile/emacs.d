(add-hook 'prog-mode-hook 'copilot-mode)

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

;; config gptel
;; define a function to load secrets from a file
(let ((secrets-file (expand-file-name "~/.emacs.d/givasile/universal/.secrets.el")))
  (when (file-exists-p secrets-file)
    (load secrets-file nil 'nomessage)))

;; set the global gptel api key to be the deepseek api key
(setq gptel-api-key deepseek-api-key)

;; gptel deepseek config
(gptel-make-openai "DeepSeek"           ;Any name you want
  :host "api.deepseek.com"
  :endpoint "/chat/completions"
  :stream t
  :key deepseek-api-key
  :models '(deepseek-chat deepseek-coder))

;; set the default backend to be the deepseek backend
(setq gptel-backend (gptel-get-backend "DeepSeek"))
