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

;; Smooth
(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

;; Repeated-smooth
(define (repeated-smooth f n)
  ((repeated smooth n) f))

;; Test
(newline)
(display ((repeated-smooth square 10) 5)) ; 25
(newline)
