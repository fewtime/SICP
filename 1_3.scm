;; 翻译有误，原意为：“返回其中较大的两个数的平方和”

(define (bigger-sum-of-square x y z)
  (sum-of-square (bigger x y)
                 (bigger (smaller x y) z)))

(define (sum-of-square x y)
  (+ (square x)
     (square y)))

(define (square x)
  (* x x))

(define (bigger x y)
  (if (> x y)
      x
      y))

(define (smaller x y)
  (if (< x y)
      x
      y))

(bigger-sum-of-square 0 0 0) ;; Return 0
(bigger-sum-of-square 2 1 1) ;; Return 5
(bigger-sum-of-square 1 2 3) ;; Return 13
