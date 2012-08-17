;; AUCTex mode
(load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(setq reftex-plug-into-auctex t)
(provide 'auctex-conf)