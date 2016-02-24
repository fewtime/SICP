(define (compose f g)
  (lambda (x)
    (f (g x))))

;; Recursion
(define (repeated f n)
  (cond ((= n 0)
        0)
        ((= n 1)
        f)
        (else
         (compose f
                  (repeated f (- n 1))))))

;; Recursion test
(newline)
(display ((repeated square 2) 5)) ; 625
(newline)

;; Iteration
(define (repeated f n)

  (define (iter i repeated-f)
    (cond ((= i 0)
           0)
          ((= i 1)
           repeated-f)
          (else
           (iter (- i 1)
                 (compose f repeated-f)))))

    (iter n f))

;; Iteration test
(newline)
(display ((repeated square 2) 5)) ; 625
(newline)
