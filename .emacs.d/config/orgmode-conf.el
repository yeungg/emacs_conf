; Using Org Mode

(require 'org)
;; Basic setup
;;; All file with the extension name org, org_archive, and txt will enter
;;; automatically Org-mdoe.
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

(global-font-lock-mode 1)
(setq org-log-done t)
(setq org-enforce-todo-dependencies t)
(setq org-log-into-drawer t)

(add-hook 'message-mode-hook 'orgstruct++-mode 'append)
(add-hook 'message-mode-hook 'turn-on-auto-fill 'append)
(add-hook 'message-mode-hook 'bbdb-define-all-aliases 'append)
(add-hook 'message-mode-hook 'orgtbl-mode 'append)
(add-hook 'message-mode-hook 'turn-on-flyspell 'append)
(add-hook 'message-mode-hook
          '(lambda () (setq fill-column 72))
          'append)
(add-hook 'message-mode-hook
          '(lambda () (local-set-key (kbd "C-c M-o") 'org-mime-htmlize))
          'append)

;; Where are my Org files typically located
(setq org-directory "E:\\MY DOCUMONT\\doc\\Dropbox\\notes")
(setq org-archive-location "%s_archive::*Archived Tasks")
(setq org-default-notes-file "refile.org")
(setq org-hide-leading-stars t)
(setq org-deadline-warning-days 5)
;; Use remember to quickly capture ideas, tasks, and notes
(org-remember-insinuate)   

;; Set up the tasks workflow states
(setq org-todo-keywords
       '((sequence "TODO(t)" "NEXT(n)" "WAITING(w@/!)" "HOLD(h)" "APPT(a)" "|" 
                   "DONE(d@/!)" "CANCELLED(c@/!)" "DEFERRED(f@/!)")))

(setq org-tags-alist '((:startgroup . nil)
		      ("OFFICE" . ?o) ("HOME". ?h)
		      (:endgroup . nil) 
		      (:startgroup . nil)
		      ("COMPUTER" . ?c) ("LAPTOP". ?l)
		      (:endgroup . nil) 
                      (:startgroup . nil)
		      ("RING" . ?r) ("EMAIL" . ?m)
		      (:endgroup .nil)
		      ("PROJECT" . ?p) ("READING" . ?f)))

;; Save the clock history across Emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; ;; Use the remember mode to add task
;; Complain: Invalid function: "Todo"
;; ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U"
;;       "~/Dropbox/notes/newgtd.org" "Tasks")

'(org-refile-targets (quote (("newgtd.org" :maxlevel . 1) 
                             ("someday.org" :level . 2))))

;; Set my current org agenda collect files
(setq org-agenda-files (list "newgtd.org" "Someday.org"))

;; Customize Key binding
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "M-<f11>") 'org-clock-out)
(global-set-key (kbd "S-M-<f11>") 'org-clock-cancel)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-M-r") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls,
;; and org-protocol
;;; %?   ==> After completing the template, position cursor here. 
;;; %U%u ==> Insert inactive timestamp with date and time
;;; %a   ==> Annotation, normally the link created with org-store-link
;;; %i   ==> inserts any text in the kill ring as part of the capture task
;;; 
(setq org-capture-templates
	  (quote (("t" "Todo" entry (file+headline "refile.org" "TASKS")
		   "* TODO %?%^{Breif description} %^g\n    Added in:%U\n" :clock-in t :clock-resume t)
		  ("r" "Respond" entry (file+headline "refile.org" "TASKS")
		   "* TODO Respond to %^{Who} on %^{subject}\n%U\n" :clock-in t :clock-resume t :immediate-finish t)
		  ("n" "Note" entry (file+headline "refile.org" "NOTES")
		   "* %?%^{Brief description} %^g :NOTE:\n   Added in: %U\n" :clock-in t :clock-resume t)
		  ("a" "Appointment" entry (file+headline "newgtd.org" "TASKS")
		   "* APPT %?%^{Brief description} %^g\n  Added in: %U\n" :clock-in t :clock-resume t) ;; For appointment
		  ("j" "Journal" entry (file+datetree "journal.org")
		   "* %?\n%U\n %i" :clock-in t :clock-resume t)
		  ("p" "Phone call" entry (file+headline "refile.org" "NOTES")
		   "* TODO To %?%^{Who} about %^{Brief hint} :PHONE:\n%U" :clock-in t :clock-resume t)
		  )))

;; Cofigure the Orgmode refiling functions
;;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
;;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)
;;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)
;;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))
;;; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
;;; Refile settings

;; Customize the agenda view.
;;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Setup clocks
;;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;;
;; Show lot sof clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 36)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

;; customizing the variable `org-clock-idle-time' to 15, Emacs can alert
;; me when you get back to my computer after being idle for 15 minutes,
;; and ask what me want to do with the idle time.
(setq org-clock-idle-time 15)

;; GTD Stuff
(setq org-agenda-span 'day)

;; For MobileOrg
(setq org-mobile-directory "E:\\MY DOCUMONT\\doc\\Dropbox\\MobileOrg")
(setq org-mobile-inbox-for-pull "E:\\MY DOCUMONT\\doc\\Dropbox\\notes\\from-mobile.org")

;; ;; Inlcude in the agenda entries from the Emacs Calendar's diary
;; (setq org-agenda-include-diary t)

;; Ingore the sublevels of TODO entry
(setq org-agenda-todo-list-sublevels nil)
 
;; ;; Show the Org-mode agenda on Emacs start up
;; (add-hook 'after-init-hook 'org-agenda-list)

;; Provide a command to open my gtd file
(defun gtd()
  (interactive)
  (find-file "E:\\MY DOCUMONT\\doc\\Dropbox\\notes\\newgtd.org")
  (goto-char (point-min))
)

(provide 'orgmode-conf)
