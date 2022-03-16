;; Задачи

;; 1. Написать функцию, которая принимает целое число и возвращает первое четное число, не меньшее аргумента.

(defun first-even (num)
    (if (evenp num) num (+ num 1)))

;; (FIRST-EVEN 1) -> 2
;; (FIRST-EVEN 2) -> 2


;; 2. Написать функцию, которая принимает число и возвращает число того же знака, но с модулем на 1 больше модуля аргумента.

(defun module-plus (num)
    (+ num (if (> num 0) 1 -1)))

;; (MODULE-PLUS 1) -> 2
;; (MODULE-PLUS -1) -> -2


;; 3. Написать функцию, которая принимает два числа и возвращает список из этих чисел, расположенный по возрастанию.

(defun ascending-list (num1 num2)
    (if (> num1 num2) 
        (list num2 num1) (list num1 num2)))

;; (ASCENDING-LIST 1 2) -> (1 2)
;; (ASCENDING-LIST 2 1) -> (1 2)


;; 4. Написать функцию, которая принимает три числа и возвращает Т только тогда, когда первое число расположено между вторым и третьим.

(defun between (num1 num2 num3)
    (or (and (> num1 num2) (< num1 num3))
        (and (< num1 num2) (> num1 num3))))

;; (BETWEEN 2 1 3) -> T
;; (BETWEEN 2 3 1) -> T
;; (BETWEEN 1 2 3) -> NIL
;; (BETWEEN 4 3 2) -> NIL


;; 5. Каков результат вычисления следующих выражений?

(and 'fee 'fie 'foe)         ;; FOE
(or nil 'fie 'foe)           ;; FIE
(and (equal 'abc 'abc) 'yes) ;; YES
(or 'fee 'fie 'foe)          ;; FEE
(and nil 'fie 'foe)          ;; NIL
(or (equal 'abc 'abc) 'yes)  ;; T


;; 6. Написать предикат, который принимает два числа-аргумента и возвращает Т, если первое число не меньше второго.

(defun predicate (num1 num2)
    (>= num1 num2))

;; (PREDICATE 1 2) -> NIL
;; (PREDICATE 2 1) -> T


;; 7. Какой из следующих двух вариантов предиката ошибочен и почему? 

(defun pred1 (x) 
    (and (numberp x) (plusp x))) ;; OK

(defun pred2 (x)
    (and (plusp x) (numberp x)))  ;; ERROR

;; (PRED1 1) -> T
;; (PRED2 1) -> T

;; (PRED1 'Hello) -> NIL
;; (PRED2 'Hello) -> The value HELLO is not of type NUMBER

;; 8. Решить задачу 4, используя для ее решения конструкции IF, COND, AND/OR.

;; Написать функцию, которая принимает три числа и возвращает Т только тогда, когда первое число расположено между вторым и третьим.

;; С использованием IF

(defun between (num1 num2 num3)
    (if (> num1 num2) 
        (< num1 num3)

        (if (< num1 num2) 
            (> num1 num3))))

;; С использованием COND

(defun between (num1 num2 num3)
    (cond ((> num1 num2) (< num1 num3))
          ((< num1 num2) (> num1 num3))))

;; С использованием AND/OR

(defun between (num1 num2 num3)
    (or (and (> num1 num2) (< num1 num3))
        (and (< num1 num2) (> num1 num3))))

;; (BETWEEN 2 1 3) -> T
;; (BETWEEN 2 3 1) -> T
;; (BETWEEN 1 2 3) -> NIL
;; (BETWEEN 4 3 2) -> NIL


;; 9. Переписать функцию how-alike, приведенную в лекции и использующую COND, используя только конструкции IF, AND/OR.

(defun how_alike(x y)
    (cond ((or  (= x y) (equal x y)) 'the_same)
          ((and (oddp x) (oddp y))   'both_odd) 
          ((and (evenp x) (evenp y)) 'both_even) 
          (t 'difference)))

;; С использованием IF

(defun how_alike(x y)
    (if (or  (= x y) (equal x y)) 'the_same 
    (if (and (oddp x) (oddp y))   'both_odd 
    (if (and (evenp x) (evenp y)) 'both_even 'difference))))

;; С использованием AND/OR

(defun how_alike(x y)
    (or (and (or  (= x y) (equal x y)) 'the_same)
        (and (and (oddp x) (oddp y))   'both_odd)
        (and (and (evenp x) (evenp y)) 'both_even)
        'difference))

;; (HOW_ALIKE 4 4) -> THE_SAME
;; (HOW_ALIKE 4 6) -> BOTH_EVEN
;; (HOW_ALIKE 1 3) -> BOTH_ODD
;; (HOW_ALIKE 4 5) -> DIFFERENCE
