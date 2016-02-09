(define (cube-root x)
  (cube-iter 1.00 x))

(define (cube-iter guess x)
  (if (good-enought? guess x)
      guess
      (cube-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enought? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube x)
  (* x x x))

;; Test
(cube-root 27) ;; 3
(cube-root 8) ;; 2
(cube-root 1) ;; 1
(cube-root -8) ;; -2
