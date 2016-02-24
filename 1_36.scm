(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (close-enought? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (display-guess guess step)
    (display "Step: ")
    (display step)
    (display " Guess: ")
    (display guess)
    (newline))

  (define (try guess step)
    (display-guess guess step)
    (let ((next (f guess)))
      (if (close-enought? guess next)
          (begin
            (display-guess next (+ 1 step))
            next)
          (try next (+ 1 step)))))

  (try first-guess 1))

;; 平均阻尼的思想
(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda(x) (average x
                      (f x))))

;; x |-> log(1000)/log(x)
(define fx
  (lambda (x)
    (/ (log 1000)
       (log x))))

;; 显示结果
(newline)
(display (fixed-point fx 5.0))
(newline)
(display (fixed-point (average-damp fx) 5.0))
(newline)

