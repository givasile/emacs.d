;; I wand the org-agenda-files to be all org files
;; inside "~/projects-org/"
(setq org-agenda-files (directory-files-recursively "~/projects-org/" "\\.org$"))

;;store org-mode links to emails
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

;; template for storing emails as todo tasks
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/projects-org/org-general/captures.org" "Tasks")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))


;; set the .org file, that all captured notes are saved to
(setq org-default-notes-file (concat org-directory "/captures.org"))


;; set org timer song
(setq org-clock-sound "~/.emacs.d/pomodoro.wav")

;; set-up org-publish
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-general-org-files"
         :base-directory "~/projects-org/org-general/"
         :base-extension "org"
         :publishing-directory "~/projects-org/org-general/published/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4; Just the default for this project.
         :auto-preamble t
         )

        ("org-general-static-files"
         :base-directory "~/projects-org/org-general/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/projects-org/org-general/published/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("org-phd-org-files"
         :base-directory "~/projects-org/org-phd/"
         :publishing-function org-html-publish-to-html
         :publishing-directory "~/projects-org/org-phd/published/"
         :exclude ".*"
         :include ["phd_ideas.org"]
         )

        ("org-phd-static-files"
         :base-directory "~/projects-org/org-phd"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/projects-org/org-phd/published/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("org-general"
         :components ("org-general-org-files" "org-general-static-files")
         )

        ("org-phd"
         :components ("org-phd-org-files" "org-phd-static-files")
         )))

;; add calendar package
(require 'calfw)
(require 'calfw-org)
(defalias 'ca 'cfw:open-org-calendar)
