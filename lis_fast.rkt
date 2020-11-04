
;; Contract: create_initial: list dynamic -> a list of 1's
;; Purpose: to compute a list of ones of the same length as lst
;; from an inputted list.
;; Example: (create_initial '(1 2)) --> (1 1)
;; Definition:
(define (create_initial lst dynamic)
    (if (null? lst)
      '(1)
      (let*
        ((ndynamic (create_initial (cdr lst) dynamic))) 
        (append ndynamic '(1)))
      )
  )

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
         (ret (append first_vals (list val)))
         )
    (append ret tail)  
    )
  )

;; lessThanJ: i j list(t) list(og) -> longest non decreasing subsequence
;; Purpose: to determine if og[j] > og[i], and change the t list accordingly
;; by adding the t[i] value to the t[j] value
;; Example: 
;; Definition:

(define (lessThanJ i j t og)
  (define (changeT i j t og)
    (define iTval (list-ref t i))
    (define jTval (list-ref t j))
    (define njTVal (+ iTval jTval ))
    (define nTlist (myLet t njTVal j))
    (recurse (+ i 1) j nTlist og)
   )
  (define iOGval (list-ref og i))
  (define jOGval (list-ref og j))
  (if (>= jOGval iOGval)
      (changeT i j t og)
      ((recurse (+ i 1) j t og))
      )
  )

(define (rev lststore)
  (define lst (reverse lststore))
  (reverse lst)
  )

;; Contract: recurse: i j list(t) list(og) -> longest non-decreasing subsequence
;; Purpose: to compute the longest non-decreasing subsequence dynamically
;; from an inputted list for each possible adj subsequence.
;; Example: 
;; Definition:
(define (recurse i j t og)
  (cond ((= i (length og)) (rev t))
        ((= i j) (recurse 0 (+ j 1) t og))
        (else (lessThanJ i j t og)))
  
  )

;; Contract: lis_fast: list -> longest non-decreasing subsequence in polynomial tim
;; Purpose: to compute the longest non-decreasing subsequence dynamically
;; from an inputted list
;; Example: (lis_fast '(1 2 4 3)) --> (1 2 4)
;; Definition:
(define (lis_fast lst)
  (let* (
          (tmp (create_initial (cdr lst) '()))
          (i 0)
          (j 1)
          (value_list (recurse i j tmp lst))
          )
        
    )
  )

(lis_fast '(1 2 3 4 5))



;(substring "Racecar" 0 3)
;(list-tail '(1 2 3 4 5) 2)
(myLet '(1 2 3 8 7 9) 100 5)
