;;——————- Diary & Calendar —————-
;; holiday-fixed m d 固定阳历节日， m 月 d 日
;; holiday-float m w n 浮动阳历节日， m 月的第 n 个星期 w%7
;; 
;; ———————————————-
;; . 跳回当前天
;; o 跳到某一个月
;; g d 跳到某年某月某日
;; g c 跳到某年某星期的星期几
;; g C 跳到阴历的某一天
;; p C 显示当前的阴历日期
;; h 显示当前节日
;; i d 加入当前这一天的日程安排
;; i w 加入每周这一天的日程安排
;; i m 加入每月这一天的日程安排
;; i y 加入每年这一天的日程安排
;; i a 加入周年纪念（anniversary），比如生日等
;; d 察看当前日期的diary
;; ———————————————–
;;

(defun animals(birthyear)
  "Calculate the Chinese aninal by year"
  (let ((x (% (- 1997 birthyear) 12)))
    (cond ((or (= x 1) (= x -11)) "鼠")
	  ((= x 0) "牛")
	  ((or (= x 11) (= x -1)) "虎")
	  ((or (= x 10) (= x -2)) "兔")
	  ((or (= x 9) (= x -3)) "龙")
	  ((or (= x 8) (= x -4)) "蛇")
	  ((or (= x 7) (= x -5)) "马")
	  ((or (= x 6) (= x -6)) "羊")
	  ((or (= x 5) (= x -7)) "猴")
	  ((or (= x 4) (= x -8)) "鸡")
	  ((or (= x 3) (= x -9)) "狗")
	  ((or (= x 2) (= x -10)) "猪") )
    )
)

;; 默认的日记文件
(setq diary-file "E:\\MY DOCUMONT\\doc\\Dropbox\\diary")
(setq diary-mail-addr "yang.gang@gmail.com")
(add-hook 'diary-hook 'appt-make-list)

;; make the calendar and diary display fancier
(setq calendar-view-diary-initially-flag t
      calendar-mark-diary-entries-flag t
      diary-number-of-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;;appointment
;;(setq appt-issue-message t)

;;设置所在地的经纬度和地名，calendar中按S,可以根据这些信息告知你每天的
;;日出和日落的时间。
(setq calendar-latitude 41.843318)
(setq calendar-longitude -87.660108)
(setq calendar-location-name "Chicago")

(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1) ; 每周第一天是Monday
(setq calendar-mark-diary-entries-flag t) ; 标记有记录的日子
(setq calendar-mark-holidays-flag t) ; 日历中突出标记节日
(setq calendar-view-holidays-initially-flag t) ; 不显示节日列表

;;除去基督徒的节日、希伯来人的节日和伊斯兰教的节日。
(setq holiday-christian-holidays nil
      holiday-hebrew-holidays nil
      holiday-islamic-holidays nil
      holiday-solar-holidays nil
      holiday-bahai-holidays nil
)

(setq holiday-general-holidays 
      '((holiday-fixed 1 1 "New Year's Day")
        (holiday-fixed 2 14 "Valentine's Day")
        (holiday-fixed 4 1 "April Fools' Day")
        (holiday-fixed 12 25 "Christmas Day")

        (holiday-float 5 0 2 "Mother's Day")
        (holiday-float 6 0 3 "Father's Day")
        (holiday-fixed 10 1 "National Day")))

;; Calendar 中 p C 可以看到我们的阴历有中文的天干地支。
(setq calendar-chinese-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
      calendar-chinese-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

(provide 'cal-conf)
;;——————- Diary & Calendar —————-