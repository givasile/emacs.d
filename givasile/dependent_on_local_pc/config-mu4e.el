;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

;; where the local imap is on my pc
(setq mu4e-maildir (expand-file-name "~/Maildir"))

;; Mail folders:
(setq mu4e-drafts-folder "/Gmail/[Gmail].Borradores")
(setq mu4e-sent-folder   "/Gmail/[Gmail].Enviados")
(setq mu4e-trash-folder  "/Gmail/[Gmail].Papelera")

;; email address of the user
(setq user-mail-address "ntipakos@gmail.com")

;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; give me ISO(ish) format date-time stamps in the header list
(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

;; set the header fields and the column-width they span
(setq mu4e-headers-fields '((:human-date . 18)
                            ;; (:flags . 6)
                            (:mailing-list . 10)
                            (:from . 22)
                            (:subject)))


;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu
;; (require 'smtpmail)
;; (setq message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials
;;       '(("smtp.gmail.com" 587 "ntipakos@gmail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)
