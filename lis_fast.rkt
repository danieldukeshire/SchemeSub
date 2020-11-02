
;; Contract: create_initial: list dynamic -> a list of 1's
;; Purpose: to compute a list of ones of the same length as lst
;; from an inputted list.
;; Example: (lis '(1 2) --> (1 1)
;; Definition:
(define (create_initial lst dynamic)
    (if (null? lst)
      '(1)
      (let*
        ((ndynamic (create_initial (cdr lst) dynamic))) 
        (append ndynamic '(1)))
      )
  )

;; Contract: lis_fast: list -> longest non-decreasing subsequence in polynomial tim
;; Purpose: to compute the longest non-decreasing subsequence dynamically
;; from an inputted list
;; Example: (lis '(1 2) --> (() (1) (2) (1 2))
;; Definition:
(define (lis_fast lst)
  (define dynamic (create_initial (cdr lst) '()))
  (write dynamic)
  )

(lis_fast '(1 2 3 4 5))