;; Contract: sublists: lst -> list(all possible sublists)
;; Purpose: to compute all sublists of a given list
;; Example: (sublists '(1 2)) --> (() (1) (2) (1 2))
;; Definition:
(define (sublists lst)
  (if (null? lst)
      (list '())
      (let*
        ((remainder (sublists (cdr lst))))  
        (append remainder (map (lambda (x) (cons (car lst) x)) remainder)))
      )
  )

;; Contract: increasing: lst -> #t / #f if it is an increasing subsequence
;; Purpose: to compute if the input is an increasing array
;; Example: (increasing '(1 2)) --> #t
;; Definition:
(define (increasing lst)
      (cond ((null? lst) #f)
            ((= (length lst) 1) #t)
            ((>= (car (cdr lst)) (car lst))
             (increasing (cdr lst)))
            (else #f))
     )

;; Contract: determineTrue: lst maxlen lststore --> longest increasing subsequence
;; Purpose: Used as a helper function for 'iterate' for definition and conditin statements
;; Example: (determineTrue '((1) (1 2 3) (1 2)))) --> (1 2 3)
;; Definition:
(define (determineTrue lst maxlen lststore)
  (define nmaxlen (length (car lst)))
  (define nlststore (car lst))
  (cond ((and (>= (length(car lst)) maxlen) (increasing (car lst))) (iterate (cdr lst) nmaxlen nlststore))
        (else (iterate (cdr lst) maxlen lststore)))
  )

(define (rev lststore)
   (define lst (reverse lststore))
   (reverse lst)
   )

;; Contract: iterate: lst maxlen lststore --> longest increasing subsequence
;; Purpose: To compute the longest increasing subsequence of a passed set of
;; sublists. I.e., which sublist is the longest increasing subsequence?
;; Example: (iterate '((1) (1 2 3) (1 2)))) --> (1 2 3)
;; Definition: 
(define (iterate lst maxlen lststore)
  (if (not(null? lst)) (determineTrue lst maxlen lststore) (rev lststore))
 
  )
 

;; Contract: lis_slow: list -> longest non-decreasing subsequence
;; Purpose: to compute the longest non-decreasing subsequence
;; from an inputted list
;; Example: (lis '(1 2 4 3)) --> (1 2 4)
;; Definition:
(define (lis_slow lst)
  (define all-sublists (sublists lst))
  (define lststore '())
  (iterate (cdr all-sublists) 0 lststore)
  )
  
(lis_slow '(1 2 3 2 4 1 2))




