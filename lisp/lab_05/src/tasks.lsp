;; мои функции

;; 1) my-reverse

(defun my-reverse-rec (lst rev-lst)
    (cond 
        ((null lst)
            rev-lst)
        (T 
            (my-reverse-rec (cdr lst) (cons (car lst) rev-lst)))
    )
)

(defun my-reverse (lst)
    (my-reverse-rec lst nil))

;; (MY-REVERSE '(1 2 3 4 5)) -> (5 4 3 2 1)

;; 2) my-length

(defun my-length-rec (set len)
    (cond 
        ((null set)
            len)
        (T 
            (my-length-rec (cdr set) (+ len 1)))
    )
)

(defun my-length (set)
    (my-length-rec set 0))

;; (MY-LENGTH '(1 2 3 4)) -> 4

;; 3) my-last

(defun my-last (lst)
    (cond 
        ((null (cdr lst))
            (list (car lst)))
        (T 
            (my-last (cdr lst)))
    )
)

;; (MY-LAST '(1 2 4 5)) -> (5)

;; 4) my-append

(defun my-append (lst1 lst2)
    (cond 
        ((null lst1)
            lst2)
        (T 
            (cons (car lst1) (my-append (cdr lst1) lst2)))
    )
)

;; (MY-APPEND '(1 2 3) '(4 5 6)) -> (1 2 3 4 5 6)

;; 4) my-sort

(defun find-min-elem-rec (lst cur_min)
    (cond 
        ((null lst)
            cur_min)
        (T 
            (find-min-elem-rec (cdr lst) 
                (cond 
                    ((< (car lst) cur_min)
                        (setf cur_min (car lst)))
                    (T 
                        cur_min))))
    )
)

(defun find-min-elem (lst)
    (find-min-elem-rec lst (car lst)))

(defun insert (lst elem elem_instead)
    (cond 
        ((null lst)
            elem_instead)
        ((eql (car lst) elem_instead)
            (setf (car lst) elem))
        (T 
            (insert (cdr lst) elem elem_instead))
    )
)

(defun my-sort-rec (res_lst lst)
    (let* ((min_elem (find-min-elem lst)))
        (cond 
            ((null lst)
                res_lst)
            (T 
                (insert lst (car lst) min_elem)
                (my-sort-rec 
                    (my-append res_lst (list min_elem))
                    (cdr lst)))
        )
    )
)

(defun my-sort (lst)
    (let* ((res_lst NIL))
        (my-sort-rec res_lst lst)
    )
)

;; (MY-SORT '(4 7 2 2 8 1 3)) -> (1 2 2 3 4 7 8)


;; 1. Написать функцию, которая по своему списку-аргументу lst определяет является ли он палиндромом (то есть равны ли lst и (reverse lst)).

(defun compare (lst1 lst2)
    (cond 
        ((null lst1)
            T)
        ((eql (car lst1) (car lst2)) 
            (compare (cdr lst1) (cdr lst2)))
    )
)

(defun palindrome (lst)
    (compare lst (my-reverse lst)))

;; (palindrome '(1 2 3 2 1)) -> T
;; (palindrome '(1 2 3 2)) -> NIL


;; 2. Написать предикат set-equal, который возвращает t, если два его множества-аргумента содержат одни и те же элементы, порядок которых не имеет значения.

(defun elem-in-set (elem set)
    (cond 
        ((null set)
            NIL)
        ((eql elem (car set)) 
            T)
        (T
            (elem-in-set elem (cdr set)))
    )
)

(defun check-set-equal (set1 set2)
    (cond 
        ((null set1)
            T)
        ((elem-in-set (car set1) set2) 
            (check-set-equal (cdr set1) set2))
    )
)


(defun set-equal (set1 set2)
    (if (eql (my-length set1) (my-length set2))
        (check-set-equal set1 set2)
    )
)

;;(SET-EQUAL '(1 2 3 4 5) '(4 2 5 1 3)) -> T
;;(SET-EQUAL '(1 2 3 4 5) '(4 2 5 1 7)) -> NIL


;; 3. Напишите свои необходимые функции, которые обрабатывают таблицу из 4-х точечных пар:
;; (страна . столица), и возвращают по стране - столицу, а по столице — страну .

(defun find-capital (country table) 
    (cond 
        ((null table) 
            Nil)
        ((eql country (caar table)) 
            (cdar table)) 
        (T 
            (find-capital country (cdr table)))
    )
)

(defun find-country (capital table) 
    (cond 
        ((null table) 
            Nil)
        ((eql capital (cdar table)) 
            (caar table)) 
        (T 
            (find-country capital (cdr table)))
    )
)

;; (find-capital
;;     'Russia
;;     '((USA . Washington)
;;       (Russia . Moscow)
;;       (Germany . Berlin)))
;; -> MOSCOW

;; (find-country
;;     'Moscow
;;     '((USA . Washington)
;;       (Russia . Moscow)
;;       (Germany . Berlin)))
;; -> RUSSIA


;; 4. Напишите функцию swap-first-last, которая переставляет в списке-аргументе первый и последний элементы.

(defun swap-first-last (lst)
    (my-append
        (my-append (my-last lst) 
                  (my-reverse (cdr (my-reverse (cdr lst))))
        )
        (list (car lst))
    )
) 



(defun swap-first-last (lst)
    (my-append 
        (cons (car (my-reverse lst)) (my-reverse (cdr (my-reverse (cdr lst)))))
        (list (car lst))
    )
)

;; (SWAP-FIRST-LAST '(1 2 3 4 5)) -> (5 2 3 4 1)


;; 5. Напишите функцию swap-two-ellement, которая переставляет в списке-аргументе два указанных своими порядковыми номерами элемента в этом списке.

(defun get-elem (lst i)
    (cond
        ((null lst)
            NIL)
        ((eql i 0)
            (car lst))
        (T 
            (get-elem (cdr lst) (- i 1)))
    )
)

(defun set-elem (lst elem i)
    (cond
        ((null lst)
            NIL)
        ((eql i 0)
            (setf (car lst) elem))
        (T 
            (set-elem (cdr lst) elem (- i 1)))
    )
)

(defun swap-two-ellement (lst i j)
    (let* ((tmp_elem (get-elem lst i)))
        (set-elem lst (get-elem lst j) i)
        (set-elem lst tmp_elem j)
        lst
    )
)

;;(SWAP-TWO-ELLEMENT '(1 2 3 4 5) 1 4) -> (1 5 3 4 2)


;; 6. Напишите две функции, swap-to-left и swap-to-right, которые производят одну круговую перестановку в списке-аргументе влево и вправо, соответственно.

(defun swap-to-left (lst)
    (my-append (cdr lst) (list (car lst))))

;; (SWAP-TO-LEFT '(1 2 3 4)) -> (2 3 4 1)

(defun swap-to-right (lst)
    (my-append (my-last lst) (my-reverse (cdr (my-reverse lst)))))

;; (SWAP-TO-RIGHT '(1 2 3 4)) -> (4 1 2 3)


;; 7. Напишите функцию, которая добавляет к множеству двухэлементных списков новый двухэлементный список, если его там нет.

(defun check-set-equal (set1 set2)
    (cond 
        ((null set1)
            T)
        ((eql (car set1) (car set2)) 
            (check-set-equal (cdr set1) (cdr set2)))
        (T 
            NIL)
    )
)

(defun set-equal (set1 set2)
    (if (eql (my-length set1) (my-length set2))
        (check-set-equal set1 set2)
    )
)

(defun is-sublist (lst sublist)
    (cond 
        ((null lst)
            NIL)
        ((set-equal (car lst) sublist) 
            T)
        (T 
            (is-sublist (cdr lst) sublist))
    )
)

(defun add-list (lst new_lst)
    (if (is-sublist lst new_lst)
        lst
        (my-append lst (list new_lst))
    )
)

;; (ADD-LIST '((1 2) (3 4) (1 1)) '(5 5)) -> ((1 2) (3 4) (1 1) (5 5))
;; (ADD-LIST '((1 2) (3 4) (1 1)) '(1 1)) -> ((1 2) (3 4) (1 1))


;; 8. Напишите функцию, которая умножает на заданное число-аргумент первый числовой элемент списка из заданного 3-х элементного списка-аргумента, когда a) все элементы списка -- числа, b) элементы списка -- любые объекты.

;; a) все элементы списка -- числа
(defun mult-first-num-arg (lst num)
    (setf (car lst) (* (car lst) num))
    lst
)

;; (MULT-FIRST-NUM-ARG '(1 2 3 4) 5) -> (5 2 3 4)

;; b) элементы списка -- любые объекты
(defun mult-first-num-arg (lst num)
    (cond 
        ((null lst)
            NIL)
        ((numberp (car lst)) 
            (setf (car lst) (* (car lst) num)))
        (T 
            (mult-first-num-arg (cdr lst) num))
    )
    lst
)

;; (MULT-FIRST-NUM-ARG '(a (1 2) 3 4) 5) -> (A (1 2) 15 4)
;; (MULT-FIRST-NUM-ARG '(a (1 2)) 5) -> (A (1 2))


;; 9. Напишите функцию, select-between, которая из списка-аргумента из 5 чисел выбирает только те, которые расположены между двумя указанными границами-аргументами и возвращает их в виде списка (упорядоченного по возрастанию чисел списка (+ 2 балла)).

(defun find-right-numbers (res_lst lst b1 b2)
    (let* ((cur_elem (car lst)))
        (cond
            ((null lst)
                res_lst)
            ((and (numberp cur_elem) 
                    (> cur_elem b1)
                    (< cur_elem b2))
                (find-right-numbers 
                    (my-append res_lst (list cur_elem))
                    (cdr lst) b1 b2))
            (T 
                (find-right-numbers res_lst (cdr lst) b1 b2))
        )
    )
)

(defun select-between (lst b1 b2)
    (let* ((res_lst NIL))
        (my-sort (find-right-numbers res_lst lst b1 b2))
    )
)

;; (SELECT-BETWEEN '(1 5 4 2 3) 2 5) -> (3 4)
;; (SELECT-BETWEEN '(1 5 4 2 3) 0 6) -> (1 2 3 4 5)
;; (SELECT-BETWEEN '(1 5 4 2 3) 7 9) -> NIL
