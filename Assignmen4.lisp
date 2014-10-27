;;;;Assignment4.lisp
;;;;Group: John Gordon, Trevor Braden, Joseph Peterson, Kendal Reed

;;; Infix Equation

(de infix (E)
    (if (atom E)  ;Takes in the atom E
        E
      (list  ;Creates a list to put in the different equation parts
       (infix (cadr E))  ;Recursively calls itself with last element in E
       (car E)  ;Gets first element of E
       (infix (caddr E)) ) ) )  ;Recursively calls itself with the car of the
                                ;cdr of the cdr

;;;Expressions

(de expressions (X)
    (if (cdr X)  ;Checks for the list without the first element
        (mapcan
         '((I)
           (mapcan
         '((I)
           (mapcan
            '((A)
              (mapcan
               '((B)
                 (mapcar
                  '((Op) (list Op A B))
                  '(+ - * /) ) )  ;List of possible operations
               (expressions (tail (- I) X)) ) )
            (expressions (head I X)) ) )
         (range 1 (dec (length X))) )
      (list (car X)) ) )

(de equations (Lst)
    (use /
         (redef / (A B)
                (and (n0 B) (=0 (% A B)) (/ A B)) )
         (for (I 1  (> (length Lst) I)  (inc I))  ;For loop to go through list
              ;;Starts at head of list and calls expressions
              (for A (expressions (head I Lst))
              (for A (expressions (head I Lst))

                   ;;Starts at end of list and calls expressions
                   (for B (expressions (tail (- I) Lst))
                        (let? N (eval A)
                              (when (= N (eval B))
                                ;Prints the equation
                                (println (infix A) '= (infix B)) ) ) ) ) ) ) )

