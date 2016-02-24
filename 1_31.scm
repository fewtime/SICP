;; Product's recursion
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term
                  (next a)
                  next
                  b))))

;; Product's iteration

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a) result))))
  (iter a 1))

;; Factorial
(define (factorial a b)
  (product (lambda (x) x)
           a
           (lambda(x) (+ x 1))
           b))

;; Accurancy
(define big-number 100000000)

;; pi/4(method 1)
;; Define:
;; x = 2y + 1 (y = 1, 2, 3 ...)
;; f(x) = (x-1) / x + (x+1) / x
;; n: Accurancy
(define (pi n)
  (define (next-odd x)
    (+ x 2.0))

  (define (f x)
    (* (/ (- x 1) x)
       (/ (+ x 1) x)))

  (* 4
     (product f 3 next-odd n)))

;; Test
(newline)
(display (pi big-number))
(newline)
