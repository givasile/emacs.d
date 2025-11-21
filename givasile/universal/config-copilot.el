(add-hook 'prog-mode-hook 'copilot-mode)

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

;; config gptel
;; define a function to load secrets from a file
(let ((secrets-file (expand-file-name "~/.emacs.d/givasile/universal/.secrets.el")))
  (when (file-exists-p secrets-file)
    (load secrets-file nil 'nomessage)))

;; ;; set the global gptel api key to be the deepseek api key
;; (setq gptel-api-key gptel-api-key)

;; ;; gptel deepseek config
;; (gptel-make-deeepseek "DeepSeek"           ;Any name you want
;;                       :stream t
;;                       :key deepseek-api-key)

;; ;; set the default backend to be the deepseek backend
;; (setq gptel-backend (gptel-get-backend "DeepSeek"))

(use-package gptel
  :straight (:host github :repo "karthink/gptel")
  :ensure t
  :config
  ;; 1. OPTIONAL: Set the default backend (what gptel uses when it starts)
  ;; If not set, it defaults to ChatGPT.
  ;; (setq gptel-model 'gpt-4o)
  ;; (setq gptel-backend (gptel-make-openai "ChatGPT" :stream t :key "YOUR_OPENAI_KEY"))

  ;; --- Global API Key Configuration ---
  ;; It is best practice to use `(gptel-api-key-from-auth-source)` for security,
  ;; but for simplicity, we set the keys directly here.
  ;; Replace "YOUR_..._KEY" with your actual API strings.

  ;; 2. Configure ChatGPT (OpenAI)
  ;; gptel comes with OpenAI pre-configured, but we register it explicitly
  ;; to ensure we have the specific models we want in the menu.
  (gptel-make-openai "ChatGPT"
    :stream t
    :key gptel-api-key
    :models '(gpt-4o
              gpt-4o-mini
              o1-preview
              o1-mini))

  ;; 3. Configure DeepSeek
  ;; Requires gptel v0.9.8 or later for the dedicated `gptel-make-deepseek` function.
  (gptel-make-deepseek "DeepSeek"
    :stream t
    :key deepseek-api-key
    :models '(deepseek-chat
              deepseek-reasoner)) ; This is the R1 reasoning model

  ;; ;; 4. Configure Anthropic (Claude)
  ;; (gptel-make-anthropic "Claude"
  ;;   :stream t
  ;;   :key "YOUR_ANTHROPIC_API_KEY"
  ;;   :models '(claude-3-5-sonnet-20241022
  ;;             claude-3-5-haiku-20241022
  ;;             claude-3-opus-20240229))
  )
