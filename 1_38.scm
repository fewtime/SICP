;; Recursion
(define (cont-frac N D k)
  (define (f i)
    (if (= k i)
        (/ (N k) (D k))
        (/ (N i)
           (+ (D i) (f (+ i 1))))))
  (f 1))

(define (e k)
  (define (N i)
    1)

  (define (D i)
    (if (= 0 (remainder (+ i 1) 3))
        (* 2 (/ (+ i 1) 3))
        1))

  (+ 2.0
     (cont-frac N D k)))

;; Test part
(define CONSTANT 10000)

(define (display-result f i)
  (newline)
  (display "i-th: ")
  (display i)
  (display " result: ")
  (display (f i))
  (newline))

(define (test-function f end-point)
  (define (iter i)
    (if (> i end-point)
        i
        (begin
          (display-result f i)
          (iter (+ i 1))
          )))
  (iter 1))

(test-function e CONSTANT)

;; Iteration
(define (cont-frac N D k)
  (define (iter i result)
    (let ((iterm (/ (N i)
                    (+ (D i) result))))
      (if (= i 1)
          iterm
          (iter (- i 1) iterm))))

  (iter k 0))

(test-function e CONSTANT)
