(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(newline)
;; (display (((double (double double)) inc) 5)) ; 21
(display (((double (double double)) 1+) 5))
(newline)

;; (define (quadruple f)
;;   (lambda (x) (f (f (f (f x))))))

;; (double double) -> quadruple
;;    (((double quadruple) inc) 5)
;; -> ((quadruple (quadruple inc)) 5)
;; -> 16 * inc(5) + 5 = 21

;; (double f) -> 2^1 * f
;; (double (double f)) -> 2^1 *2^1 *f
;; (double (double (double f))) -> 2^1 *2^1 *2^1 *f
;; ((double double) f) -> (2^1 * 2^1) * f
;; (double (double double) f) -> (2^1 * 2^1)^2 * f
