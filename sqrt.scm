(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enought? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enought? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Test
;; (sqrt 9) ;; 3.00009155413138
;; (sqrt (+ 100 37)) ;; 11.704699917758145
;; (sqrt (+ (sqrt 2) (sqrt 3))) ;; 1.773827902307892
;; (square (sqrt 1000)) ;; 1000.000369924366

