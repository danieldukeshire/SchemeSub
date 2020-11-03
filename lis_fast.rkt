
;; Contract: create_initial: list dynamic -> a list of 1's
;; Purpose: to compute a list of ones of the same length as lst
;; from an inputted list.
;; Example: (lis '(1 2)) --> (1 1)
;; Definition:
(define (create_initial lst dynamic)
    (if (null? lst)
      '(1)
      (let*
        ((ndynamic (create_initial (cdr lst) dynamic))) 
        (append ndynamic '(1)))
      )
  )

(define (numberToList number)
   (if (< number 10) (list number)
       (append (numberToList (quotient number 10))
               (list (- number (* 10 (quotient number 10)))))))


;; Contract: myLet: list add index -> a list with value inserted at i
;; Purpose: to swap an element in the list witout using set!
;; Example: (myLet '(1 1 1) 2 0) --> (2 1 1)
;; Definition:
(define(myLet lst val i)
  (let* (
         (tail (list-tail lst (+ i 1)))
         (rev_lst (reverse lst))
         (rev_tail (list-tail rev_lst (- (length lst) i)))
         (first_vals (reverse rev_tail))
         (ret (append first_vals (numberToList val)))
         )
    (append ret tail)  
    )
  )


;; Contract: recurse: i j list(t) list(t) -> longest non-decreasing subsequence
;; Purpose: to compute the longest non-decreasing subsequence dynamically
;; from an inputted list for each possible adj subsequence.
;; Example: (lis '(1 2)) --> (() (1) (2) (1 2))
;; Definition:
(define (recurse i j t og)
  #t
  )

;; Contract: lis_fast: list -> longest non-decreasing subsequence in polynomial tim
;; Purpose: to compute the longest non-decreasing subsequence dynamically
;; from an inputted list
;; Example: (lis '(1 2 4 3)) --> (1 2 4)
;; Definition:
(define (lis_fast lst)
  (let* (
          (tmp (create_initial (cdr lst) '()))
          (i (car tmp))
          (j (car (cdr tmp)))
          )
    (recurse i j tmp tmp)
    )
  )

(lis_fast '(1 2 3 4 5))



;(substring "Racecar" 0 3)
;(list-tail '(1 2 3 4 5) 2)
(myLet '(1 2 3 8 7 9) 5 5)
