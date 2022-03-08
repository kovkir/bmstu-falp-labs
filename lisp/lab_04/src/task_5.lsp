;; 5. Написать простой вариант игры в кости, в котором бросаются две правильные кости. Если сумма выпавших очков равна 7 или 11 -- выигрыш, если выпало (1,1) или (6,6) -- игрок получает право снова бросить кости, во всех остальных случаях ход переходит ко второму игроку, но запоминается сумма выпавших очков. Если второй игрок не выигрывает абсолютно, то выигрывает тот игрок, у которого больше очков. Результат игры и значения выпавших костей выводить на экран с помощью функции print.

(defvar name-first  'first_player)
(defvar name-second 'second_player)

(defvar dice-first)
(defvar dice-second)
(defvar tmp-dice)

(defun roll-one-dice ()
	(+ (random 6) 1))

(defun roll-two-dice ()
	(list (roll-one-dice) (roll-one-dice)))

(defun sum (dice) 
	(+ (car dice) (cadr dice)))

(defun print-res (name dice) 
    (print `(Win ,name)))

(defun is-win (dice) 
	(cond ((= (sum dice) 7 )) 
		  ((= (sum dice) 11))
    )
)

(defun repeat-roll (dice)
	(cond ((= (car dice) (cadr dice) 6))
	      ((= (car dice) (cadr dice) 1))
    ) 
)

(defun players-move (name)
    (setf tmp-dice (roll-two-dice)
    )
    (print `(,name ,tmp-dice sum = ,(sum tmp-dice))
    )
    (cond 
        ((is-win tmp-dice) 
            (list tmp-dice 1))
        ((repeat-roll tmp-dice) 
            (players-move name))
        (T (list tmp-dice 0))
    )	
)

(defun continue-game (dice-first)
    (setf dice-second (players-move name-second)
    )
    (cond 
        ((= (cadr dice-second) 1) 
            (print-res name-second dice-second))
        ((> (sum (car dice-first)) (sum (car dice-second))) 
            (print-res name-first dice-first))
        ((< (sum (car dice-first)) (sum (car dice-second))) 
            (print-res name-second dice-second))
        (T (print '(Draw)))
    )
)

(defun play ()
    (setf dice-first  (players-move name-first)
    )
    (cond 
        ((= (cadr dice-first) 1) 
            (print-res name-first dice-first))
        (T (continue-game dice-first))
    )
    (terpri) (terpri)
)

(play)

;; (FIRST_PLAYER (1 3) SUM = 4) 
;; (SECOND_PLAYER (1 1) SUM = 2) 
;; (SECOND_PLAYER (3 3) SUM = 6) 
;; (WIN SECOND_PLAYER) 

;; (FIRST_PLAYER (1 6) SUM = 7) 
;; (WIN FIRST_PLAYER) 

;; (FIRST_PLAYER (4 6) SUM = 10) 
;; (SECOND_PLAYER (6 4) SUM = 10) 
;; (DRAW) 
