;; 参考 P46 =fixed-point= 程序，与其类似
(define (iterative-improve close-enought? improve)

  (lambda (first-guess)

    (define (try guess)
      (let ((next (improve guess)))
        (if (close-enought? guess next)
            next
            (try next))))

    (try first-guess)))

;; Sqrt
(define tolerance 0.00001)

(define (sqrt x)

  (define (close-enought? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (improve guess)

    (define (average x y)
      (/ (+ x y) 2))

    (average guess (/ x guess)))

  ((iterative-improve close-enought? improve) 1.0))

;; Sqrt test
(newline)
(display (sqrt (* 2 2)))
(newline)
(display (sqrt (* 3 3)))
(newline)

;; Fixed-point
(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (close-enought? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (improve next)
    (f next))

  ((iterative-improve close-enought? improve) first-guess))

;; Fixed-point test
(newline)
(display (fixed-point cos 1.0))
(newline)
(display (fixed-point (lambda (y)
                        (+ (sin y)
                           (cos y)))
                      1.0))
(newline)
