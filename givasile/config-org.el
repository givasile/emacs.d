;; defines the directory where the agenda files are
(setq org-agenda-files (list "~/org/"))


;;store org-mode links to emails
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

;; template for storing emails as todo tasks
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/org/captures.org" "Tasks")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))


;; set the .org file, that all captured notes are saved to
(setq org-default-notes-file (concat org-directory "/captures.org"))


;; add calendar package
(require 'calfw)
(require 'calfw-org)
(defalias 'ca 'cfw:open-org-calendar)



;; org-super-agenda configuration
(  )

(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode)
  )

(setq org-agenda-custom-commands
      '(("c" "Super Agenda" agenda
         (org-super-agenda-mode)
         ((org-super-agenda-groups
           '(
             (:name "Next Items"
                    :time-grid t
                    :tag ("NEXT" "outbox"))
             (:name "Important"
                    :priority "A")
             (:name "Today"
                    :time-grid t
                    :scheduled today)
             (:name "Quick Picks"
                    :effort < 00:30 ; ← that one doesn't seem to work, no?
                    )
             (:priority<= "B"
                          :order 1)
             )))
         (org-agenda nil "a"))))

(setq super-agenda-groups1
      '((:log t)  ; Automatically named "Log"
        (:name "Schedule"
               :time-grid t)
        (:name "Today"
               :scheduled today)
        (:habit t)
        (:name "Due today"
               :deadline today)
        (:name "Overdue"
               :deadline past)
        (:name "Due soon"
               :deadline future)
        (:name "Unimportant"
               :todo ("SOMEDAY" "MAYBE" "CHECK" "TO-READ" "TO-WATCH")
               :order 100)
        (:name "Waiting..."
               :todo "WAITING"
               :order 98)
        (:name "Scheduled earlier"
               :scheduled past))
      )
(setq super-agenda-groups
      '(;; Each group has an implicit boolean OR operator between its selectors.
        (:name "Today"            ; Optionally specify section name
               :time-grid t       ; Items that appear on the time grid
               )
        (:name "DEADLINES" :deadline t :order 1)
        (:name "Focus" :tag "Focus" :order 2 :face (:append t :weight bold))
        (:name "Important" :priority "A" :order 4)
        (:priority<= "B"
                     ;; Show this section after "Today" and "Important", because
                     ;; their order is unspecified, defaulting to 0. Sections
                     ;; are displayed lowest-number-first.
                     :order 6)
                                        ;        (:name "Habits" :habit t :order 3)
        (:name "Shopping" :tag "Besorgung" :order 8)
        ;; Boolean AND group matches items that match all subgroups
        ;;  :and (:tag "shopping" :tag "@town")
        ;; Multiple args given in list with implicit OR
        ;;  :tag ("food" "dinner"))
        ;;  :habit t
        ;;  :tag "personal")
        (:name "Started" :todo "STARTED" :order 10)
        ;;(:name "Space-related (non-moon-or-planet-related)"
        ;;       ;; Regexps match case-insensitively on the entire entry
        ;;       :and (:regexp ("space" "NASA")
        ;;                     ;; Boolean NOT also has implicit OR between selectors
        ;;                     :not (:regexp "moon" :tag "planet")))
        (:name "BWG" :tag "@BWG" :order 16)
        (:todo "WAITING" :order 18)     ; Set order of this section
        (:name "read" :tag "2read" :order 22)
        ;; Groups supply their own section names when none are given
        (:todo ("SOMEDAY" "WATCHING")
               ;; Show this group at the end of the agenda (since it has the
               ;; highest number). If you specified this group last, items
               ;; with these todo keywords that e.g. have priority A would be
               ;; displayed in that group instead, because items are grouped
               ;; out in the order the groups are listed.
               :order 25)
        (:name "reward"
               :tag ("reward" "lp")
               :order 100
               )

        ;; After the last group, the agenda will display items that didn't
        ;; match any of these groups, with the default order position of 99
        )
      )

(defun my-super-agenda()
  "generates my super-agenda"
  (interactive)
  (org-super-agenda-mode)
  (let
      ((org-super-agenda-groups super-agenda-groups1))
    (org-agenda nil "a")
    )
  )
