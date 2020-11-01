;;; YY --- description -*- lexical-binding: t; -*-
;;;
;;
;; Copyright (C) YY YY
;;
;; Author: YY <http://github/YY>
;; Maintainer: YY <YY>
;; Created: YY
;; Modified: YY
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/YY/YY
;; Package-Requires: ((emacs YY) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

;; Visit a commonly used URL.
;; TODO: Add hook to browse-url to show a list of
;; frequently used websites to visit in a minibuffer;
;; determine these based on previous uses of browse-url
;; or from browser history somehow.
(use-package! browse-url
  :init
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "firefox"))

(use-package! link-hint
  :ensure t
  :defer t)

(define-key evil-normal-state-map (kbd "SPC a") 'link-hint-open-link)

(defun visit-localhost ()
  "Visit a specified localhost port."
  (interactive)
  (browse-url
   (concat "localhost:" (read-string "Visit port:"))))

  ;; Find a URL
  (map! :leader
        "\"" (lambda ()
               (interactive)
               (browse-url (read-string "URL:"))))
  (map! :leader
        "'" (lambda () (interactive) (counsel-search)))
  (map!
   :leader
   :prefix "v"
   :desc "Visit Calendar" "c" (lambda () (interactive) (browse-url "https://calendar.google.com"))
   :desc "Visit Discord" "d" (lambda () (interactive) (browse-url "https://discord.gg"))
   :desc "Visit Spotify" "s" (lambda () (interactive) (browse-url "https://open.spotify.com"))
   :desc "Visit Gmail" "m" (lambda () (interactive) (browse-url "https://gmail.com"))
   :desc "Visit GitHub" "g" (lambda () (interactive) (browse-url "https://github.com/jakechv"))
   :desc "Visit local port" "l" 'visit-localhost
   )

;; (use-package! elfeed
;;   :init
;;   (setq elfeed-protocol-ttrss-maxsize 200 elfeed-set-timeout 36000
;;         elfeed-show-entry-switch 'display-buffer
;;         elfeed-search-remain-on-entry t
;;         elfeed-feeds
;;         '(("ttrss+https://jake@rss.chvatal.com"
;;            :password (read-passwd "Provide your tt-rss password:"))))
;;   :config
;;   (map! :map elfeed-search-mode-map
;;         "n" (lambda () (interactive) (next-line) (call-interactively 'elfeed-search-show-entry))
;;         "p" (lambda () (interactive) (previous-line) (call-interactively 'elfeed-search-show-entry))
;;         "m" (lambda () (interactive) (apply 'elfeed-search-toggle-all '(star))))
;;   (map!
;;    :leader
;;    :prefix "o"
;;    :desc "elfeed" "e" #'elfeed)
;;   (map! :leader
;;         :prefix "e"
;;         :desc "elfeed" "e" #'elfeed
;;         :desc "elfeed-protocol-ttrss-update" "u" #'elfeed-protocol-ttrss-update
;;         :desc "elfeed-protocol-ttrss-update-star" "s" #'elfeed-protocol-ttrss-update-star))

;; (use-package! elfeed-protocol
;;   :after elfeed
;;   :config
;;   (elfeed-protocol-enable))

(provide 'config)
;;; config.el ends here