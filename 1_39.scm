;; Recursion
(define (cont-frac N D k)
  (define (f i)
    (if (= k i)
        (/ (N k) (D k))
        (/ (N i)
           (+ (D i) (f (+ i 1))))))
  (f 1))

(define (tan-cf x k)
  (define (N i)
    (if (= i 1)
        x
        (- (square x))))

  (define (D i)
    (- (* 2 i) 1))

  (exact->inexact (cont-frac N D k)))

;; Test part
(define CONSTANT 1000)
(define K 100)

(define (display-result f i k)
  (newline)
  (display "i-th: ")
  (display i)
  (display " result: ")
  (display (f i k))
  (newline))

(define (test-function f k end-point)
  (define (iter i)
    (if (> i end-point)
        i
        (begin
          (display-result f i k)
          (iter (+ i 1)))))
  (iter 1))

(test-function tan-cf K CONSTANT)

;; Iteration
(define (cont-frac N D k)
  (define (iter i result)
    (let ((iterm (/ (N i)
                    (+ (D i) result))))
      (if (= i 1)
          iterm
          (iter (- i 1) iterm))))

  (iter k 0))

(test-function tan-cf K CONSTANT)
