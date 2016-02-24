;; Recursion
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            term
                            (next a)
                            next
                            b))))

;; Sum and product helper function
(define (sum term a next b)
  (accumulate +
              0
              term
              a
              next
              b))

(define (product term a next b)
  (accumulate *
              1
              term
              a
              next
              b))

;; Test function
(define (test-function)
  (define big-number 10000)
  (newline)
  (display (sum (lambda(x) x)
                1
                (lambda(x) (+ x 1))
                big-number))
  (newline)
  (display (product (lambda(x) x)
                    1
                    (lambda(x) (+ x 1))
                    big-number))
  (newline))

;; Recursion test
(test-function)

;; Iteration
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a) result))))
  (iter a null-value))

;; Iteration test
(test-function)
