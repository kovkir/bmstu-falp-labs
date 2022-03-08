;; Номер 5

;; 1) Написать функцию (f arl ar2 ar3 ar4), возвращающую список ((arl ar2) (ar3 ar4))

(defun f(arl ar2 ar3 ar4) (list (list arl ar2) (list ar3 ar4)))
(defun f(arl ar2 ar3 ar4) (cons (cons arl (cons ar2 nil))
                                (cons (cons ar3 (cons ar4 nil)) nil)))

;; 2) Написать функцию (f arl ar2), возвращающую список ((arl) (ar2))

(defun f(arl ar2) (list (list arl) (list ar2)))
(defun f(arl ar2) (cons (cons arl nil)
                        (cons (cons ar2 nil) nil)))

;; 3) Написать функцию (f arl), возвращающую список (((arl)))

(defun f(arl) (list (list (list arl))))
(defun f(arl) (cons (cons (cons arl nil) nil) nil))

