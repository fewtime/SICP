;; Golden-ratio
(define tolerance 0.00001)
(define (close-enought? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enought? guess next)
          next
          (try next))))
  (try first-guess))

(define golden-ratio
  (fixed-point (lambda(x) (+ 1 (/ 1 x)))
               1.0))

;; Recursion
(define (cont-frac N D k)
  (define (f i)
    (if (= k i)
        (/ (N k) (D k))
        (/ (N i)
           (+ (D i) (f (+ i 1))))))
  (f 1))

;; Test
(define (new-golden-ratio k)
  (+ 1
     (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))

(define (display-result k result)
  (newline)
  (display "Golden ratio: ")
  (display golden-ratio)
  (display " k-th: ")
  (display k)
  (display " result: ")
  (display result)
  (newline))

(define (test-function f)
  (define (test-iter k)
    (let ((result (f k)))
      (display-result k result)
      (if (close-enought? result golden-ratio)
          k
          (test-iter (+ k 1)))))
  (test-iter 1))

;; Begin recursion test
(test-function new-golden-ratio)

;; Iteration
(define (cont-frac N D k)
  (define (iter i result)
    (let ((iterm (/ (N i)
                    (+ (D i) result))))
      (if (= i 1)
          iterm
          (iter (- i 1) iterm))))

  (iter k 0))

;; Begin iteration test
(test-function new-golden-ratio)

;; 当 k = 11/12, 近似值具有十进制的4位精确度
