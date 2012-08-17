;; Disable splash screen and show fancy message on scratch
(setq inhibit-startup-screen t)
(setq initial-scratch-message
      "\n\n\n
       It does not matter how slowly you go as long as you do not stop.
                                                        ~~ Confucius
       \n\n"        
      )


;; Set the default directory
(setq default-directory "E:\\MY DOCUMONT\\doc\\")
(global-linum-mode 1)                ;; always show line numbers
;;(setq tramp-default-method "ssh")    ;; set tramp mode to ssh
(setq kill-ring-max 200)
(setq frame-title-format "emacs@%b") ;; show buffer name on title
(tool-bar-mode -1)                   ;; disable the tool-bar
(toggle-scroll-bar -1)               ;; disable the scroll-bar
(setq scroll-margin 3                ;; scroll when 3-line left
      scroll-conservatively 10000)

;; chang "yes or no" to "y or p"
(defalias 'yes-or-no-p 'y-or-n-p)
;; Highlight the current line
(global-hl-line-mode t)
(setq calendar-week-start-day 1)

(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;; Specify whether to have vertical scroll bars, and on which side.
;; Possible values are nil (no scroll bars), `left' (scroll bars on left)
;; and `right' (scroll bars on right).
(scroll-bar-mode nil)                   
;; Set the template for displaying the title bar of visible frames.
;; A string is printed verbatim in the mode line except for %-constructs:
;;   (%-constructs are allowed when the string is the entire mode-line-format
;;    or when it is found in a cons-cell or a list)
;;   %b -- print buffer name.      %f -- print visited file name.
;;   %F -- print frame name.
;;   %* -- print %, * or hyphen.   %+ -- print *, % or hyphen.
;;   %& is like %*, but ignore read-only-ness.
;; 	 % means buffer is read-only and * means it is modified.
;;   %s -- print process status.   %l -- print the current line number.
;;   %c -- print the current column number (this makes editing slower).
;;   %i -- print the size of the buffer.
;;   %I -- like %i, but use k, M, G, etc., to abbreviate.
;;   %p -- print percent of buffer above top of window, or Top, Bot or All.
;;   %P -- print percent of buffer above bottom of window, perhaps plus Top,
;;         or print Bottom or All.
;;   %n -- print Narrow if appropriate.
;;   %t -- visited file is text or binary (if OS supports this distinction).
;;   %z -- print mnemonics of keyboard, terminal, and buffer coding systems.
;;   %Z -- like %z, but including the end-of-line format.
;;   %e -- print error message about full memory.
;;   %@ -- print @ or hyphen.  @ means that default-directory is on a
;;         remote machine.
;;   %[ -- print one [ for each recursive editing level.  %] similar.
;;   %% -- print %.   %- -- print infinitely many dashes.
;; Decimal digits after the % specify field width to which to pad.
(setq frame-title-format "%b(%s)@Yeungg")

;; Set emacs's cutting and pasting uses the clipboard
(setq x-select-enable-clipboard t)
;; Display the column numberin the modebar
(setq column-number-mode t)
;; ?? too complex!!
(global-font-lock-mode 1)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil) ;; Always insert spaces when press TAB

(set-cursor-color "Wheat")
(set-mouse-color "Wheat")
(set-foreground-color "Wheat")
(set-background-color "DarkSlateGray")

;; Enable the Cua-mode.
;; Cua-mode allows one to use ‘C-v’, ‘C-c’, and ‘C-x’ to paste, copy, and
;; cut the region. Since this conflicts with very important keybindings
;; in Emacs, these CUA bindings are only active when the mark is active
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; make Emacs org-mode open links to sites in Google chrome
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "C:\\Users\\yeungg\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe")

;; Some simple for Appt mode
(setq appt-display-format 'window)
(setq appt-display-duration 20)
(setq appt-message-warning-time 10)

;; Set up the ispell mode
(setq-default ispell-program-name "C:\\Program Files\\Aspell\\bin\\aspell.exe")

;; Redefine the "o" as a dired-mode shortcut to open the file with the default
;; application associated with the type of this file.
(require 'w32-browser)
;; Open file externally
(add-hook 'dired-mode-hook
		  '(lambda ()
			 (define-key dired-mode-map "o" 'dired-open-file)
			 ))

(defun dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (w32-browser file)
    (message "Opening %s done" file)))

;; Try to make emacs save file as utf-8

(setq buffer-file-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)
;;(set-default-coding-systems 'utf-8)
;;(setq buffer-file-coding-system 'utf-8)
;;(setq default-file-name-coding-system 'utf-8)
;;(setq default-keyboard-coding-system 'utf-8)
;;(setq default-process-coding-system '(utf-8 . utf-8))
;;(setq default-sendmail-coding-system 'utf-8)
;;(setq default-terminal-coding-system 'utf-8)

(provide 'basic-conf)