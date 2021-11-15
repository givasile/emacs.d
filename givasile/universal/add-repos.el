(require 'package)

;; add melpa repo
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; initialize them all
(package-initialize)

;; check that package content is set
(when (not package-archive-contents)
  (package-refresh-contents))
