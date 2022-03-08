;; Задачи

;; 1. Составить диаграмму вычисления следующих выражений:

(equal 3 (abs - 3)) 
(equal (+ 1 2) 3) 
(equal (* 4 7) 21)
(equal (* 2 3) (+ 7 2)) 
(equal (- 7 3) (* 3 2)) 
(equal (abs (- 2 4)) 3))

;; 2. Написать функцию, вычисляющую гипотенузу прямоугольного треугольника по заданным катетам и составить диаграмму её вычисления.

(defun hypotenuse(a b) (sqrt (+ (* a a) (* b b))))
;; (HYPOTENUSE 3 4) -> 5.0

;; 3. Написать функцию, вычисляющую объем параллелепипеда по 3-м его сторонам, и составить диаграмму ее вычисления.

(defun volume(a b c) (* a b c))
;; (VOLUME 2 3 4) -> 24

;; 4. Каковы результаты вычисления следующих выражений? (объяснить возможную ошибку и варианты ее устранения)

(list 'a c)         ;; The variable C is unbound.
(cons 'a (b c))     ;; The variable C is unbound
(cons 'a '(b c))    ;; (A B C)
(caddy (1 2 3 4 5)) ;; Execution of a form compiled with errors.
(cons 'a 'b 'c)     ;; invalid number of arguments: 3
(list 'a (b c))     ;; The variable C is unbound.
(list a '(b c))     ;; The variable A is unbound.
(list (+ 1 '(length '(1 2 3)))) ;; The value (LENGTH '(1 2 3)) is not of type NUMBER

;; Варианты следующих выражений с устраненными ошибками

(list 'a 'c)         ;; (A C)
(cons 'a '(b c))     ;; (A B C)
(cons 'a '(b c))     ;; (A B C)
(caddr '(1 2 3 4 5)) ;; 3
(cons 'a 'b)         ;; (A . B)
(list 'a '(b c))     ;; (A (B C))
(list 'a '(b c))     ;; (A (B C))
(list (+ 1 (length '(1 2 3)))) ;; (4)

;; 5. Написать функцию longer_then от двух списков-аргументов, которая возвращает Т, если первый аргумент имеет большую длину.

(defun longer_then(list1 list2) 
    (> (length list1) (length list2)))
;; (LONGER_THEN '(1 2 3) '(1 2)) -> T
;; (LONGER_THEN '(1 2 3) '(1 2 3)) -> NIL
;; (LONGER_THEN '(1 2 3) '(1 2 3 4)) -> NIL

;; 6. Каковы результаты вычисления следующих выражений?

(cons 3 (list 5 6))             ;; (3 5 6)
(cons 3 '(list 5 6))            ;; (3 LIST 5 6)
(list 3 'from 9 'lives (- 9 3)) ;; (3 FROM 9 LIVES 6)
(+ (length '(for 2 too)) (car '(21 22 23))) ;; 24
(cdr '(cons is short for ans))  ;; (IS SHORT FOR ANS)
(car (list one two))            ;; The variable ONE is unbound.
(car (list 'one 'two))          ;; ONE

;; 7. Дана функция (defun mystery (x) (list (second x) (first x))). Какие результаты вычисления следующих выражений?

(mystery (one two))      ;; The variable TWO is unbound. 
(mystery one 'two))      ;; The variable ONE is unbound.
(mystery (last one two)) ;; The variable ONE is unbound.
(mystery free)           ;; The variable FREE is unbound.

;; Варианты следующих выражений с устраненными ошибками

(mystery '(one two))        ;; (TWO ONE) 
(mystery '(one 'two))       ;; ('TWO ONE) 
(mystery (last '(one two))) ;; (NIL TWO)
(mystery '(free))           ;; (NIL FREE)

;; 8. Написать функцию, которая переводит температуру в системе Фаренгейта температуру по Цельсию (defun f-to-c (temp)...).
;; Формулы: c = 5/9*(f-32.0); f= 9/5*c+32.0.
;; Как бы назывался роман Р.Брэдбери "+451 по Фаренгейту" в системе по Цельсию?

 (defun f-to-c (temp) (* (/ 5 9) (- temp 32.0)))
 ;; (F-TO-C 451) -> 232.77779

;; 9. Что получится при вычисления каждого из выражений?

(list 'cons t NIL)               ;; (CONS T NIL)
(eval (list 'cons t NIL))        ;; (T)
(eval (eval (list 'cons t NIL))) ;; The function T is undefined, and its name is reserved by ANSI CL.
(apply #'cons '(t NIL))          ;; (T)
(eval NIL)                       ;; NIL
(list 'eval NIL)                 ;; (EVAL NIL)
(eval (list 'eval NIL))          ;; NIL

;; Дополнительно:

;; 1. Написать функцию, вычисляющую катет по заданной гипотенузе и другому катету прямоугольного треугольника, и составить диаграмму ее вычисления.

(defun calc_cathet (hypotenuse cathet)
    (sqrt (- (* hypotenuse hypotenuse) (* cathet cathet))))
;; (CALC_CATHET 5 4) -> 3.0

;; 2. Написать функцию, вычисляющую площадь трапеции по ее основаниям и высоте, и составить диаграмму ее вычисления.

(defun trapezoid_area (h a b) 
    (* (/ (+ a b) 2) h))
;; (TRAPEZOID_AREA 2 3 4) -> 7
