;; Define a function to append all subdirecroties in Dir recursively to load-path.
;; So what i need to do is just leave all my own elisp files in one specific
;; direcotory in my home directory.
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (setq load-path
            (append
             (let ((load-path (copy-sequence load-path))) ;; Shadow
               (normal-top-level-add-subdirs-to-load-path))
             load-path))))
(add-subdirs-to-load-path "~/.emacs.d/config/")

(require 'basic-conf)
(require 'cal-conf)
(require 'emms-conf)
(require 'orgmode-conf)