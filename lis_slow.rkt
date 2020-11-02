;; Contract: sublists: list -> list(all possible sublists)
;; Purpose: to compute all sublists of a given list
;; Example: (sublists '(1 2) --> (() (1) (2) (1 2))
;; Definition:
(define (sublists lst)
  (if (null? lst)
      (list '())
      (let*
        ((remainder (sublists (cdr lst))))  
        (append remainder (map (lambda (x) (cons (car lst) x)) remainder)))
      )
  )

;; Contract: lis: list -> longest non-decreasing subsequence
;; Purpose: to compute the longest non-decreasing subsequence
;; from an inputted list
;; Example: (lis '(1 2) --> (() (1) (2) (1 2))
;; Definition:
(define (increasing lst)
      (cond ((null? lst) #f)
            ((= (length lst) 1) #t)
            ((>= (car (cdr lst)) (car lst))
             (increasing (cdr lst)))
            (else #f))
     )

(define (determineTrue lst maxlen lststore)
  ;(display (car lst)) (newline)
  (define nmaxlen (length (car lst)))
  (define nlststore (car lst))
  (cond ((and (>= (length(car lst)) maxlen) (increasing (car lst))) (iterate (cdr lst) nmaxlen nlststore))
        (else (iterate (cdr lst) maxlen lststore)))
  )

(define (iterate lst maxlen lststore)
  ;(display maxlen) (newline)
  (if (not(null? lst)) (determineTrue lst maxlen lststore))
  (if (null? lst) (display lststore))
  )
 

;; Contract: lis: list -> longest non-decreasing subsequence
;; Purpose: to compute the longest non-decreasing subsequence
;; from an inputted list
;; Example: (lis '(1 2) --> (() (1) (2) (1 2))
;; Definition:
(define (lis lst)
  (define all-sublists (sublists lst))
  (define lststore '())
  (iterate (cdr all-sublists) 0 lststore)
  )
  
  
 
(lis '(1 2 2 4 4))




