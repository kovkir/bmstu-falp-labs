;; Задачи


;; 1. Чем принципиально отличаются функции cons, list, append?

;; Пусть (setf lst1 '(a b)) 
;;       (setf lst2 '(c d)).
;; Каковы результаты вычисления следующих выражений?

(cons lst1 lst2)   ;; ((A B) C D)
(list lst1 lst2)   ;; ((A B) (C D))
(append lst1 lst2) ;; (A B C D)


;; 2. Каковы результаты вычисления следующих выражений, и почему?

(reverse ())         ;; NIL
(last ())            ;; NIL
(reverse '(a))       ;; (A)
(last '(a))          ;; (A)
(reverse '((a b c))) ;; ((A B C))
(last '((a b c)))    ;; ((A B C))


;; 3. Написать, по крайней мере, два варианта функции, которая возвращает последний элемент своего списка-аргумента.

(defun last-elem (lst)
    (car (reverse lst)))

;; (LAST-ELEM '(1 2 3)) -> 3

(defun last-elem-2 (lst)
    (if (eq (cdr lst) nil) 
        (car lst) 
        (last-elem-2 (cdr lst))))

;; (LAST-ELEM-2 '(1 2 3)) -> 3

(defun last-elem-3 (lst)
    (car (last lst)))

;; (LAST-ELEM-3 '(1 2 3)) -> 3


;; 4. Написать, по крайней мере, два варианта функции, которая возвращает свой список-аргумент без последнего элемента.

(defun without-last-elem (lst)
    (reverse (cdr (reverse lst))))

;; (WITHOUT-LAST-ELEM '(1 2 3)) -> (1 2)

(defun without-last-elem-2 (lst)
    (if (cdr lst)
        (cons (car lst) (without-last-elem-2 (cdr lst)))))

;; (WITHOUT-LAST-ELEM-2 '(1 2 3)) -> (1 2)
