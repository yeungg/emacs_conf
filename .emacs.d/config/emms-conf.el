(require 'emms-setup)
(require 'emms-mode-line)
(require 'emms-mark)
(require 'emms-streams)
(require 'emms-lyrics)


(emms-standard)
(emms-mode-line 1)
(emms-mode-line-blank)
(emms-lyrics 1)

;; players
(setq ;;emms-player-mpg321-command-name "mpg321"
      emms-player-mplayer-command-name "D:\\Program Files\\SMPlayer\\mplayer\\mplayer.exe"
      emms-player-list '(emms-player-mplayer
                         emms-player-mplayer-playlist
                         emms-player-ogg123
                         emms-player-mpg321))

;; Show the current track each time EMMS
;; starts to play a track with "播放 : "
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "Playing: %s")
;; When asked for emms-play-directory,
;; always start from this 默认的播放目录
(setq emms-source-file-default-directory "E:\\MUSIC\\")
(setq emms-playlist-buffer-name "Music")

(provide 'emms-conf)