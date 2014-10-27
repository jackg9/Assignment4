;;;; Assignment4.lisp
;;;; Group: John Gordon, Trevor Braden, Joseph Peterson, Kendal Reed

;;; Current version does not work specifically for the output requirements.
(de infix (E)
   (if (atom E)
      E
      (list
         (infix (cadr E))
         (car E)
         (infix (caddr E)) ) ) )

(de expressions (X)
   (if (cdr X)
      (mapcan
         '((I)
            (mapcan
               '((A)
                  (mapcan
                     '((B)
                        (mapcar
                           '((Op) (list Op A B))
                           '(+ - * /) ) )
                     (expressions (tail (- I) X)) ) )
               (expressions (head I X)) ) )
         (range 1 (dec (length X))) )
      (list (car X)) ) )

(de equations (Lst)
   (use /
      (redef / (A B)
         (and (n0 B) (=0 (% A B)) (/ A B)) )
      (for (I 1  (> (length Lst) I)  (inc I))
         (for A (expressions (head I Lst))
            (for B (expressions (tail (- I) Lst))
               (let? N (eval A)
                  (when (= N (eval B))
                     (println (infix A) '= (infix B)) ) ) ) ) ) ) )
