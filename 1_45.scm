;; Fixed-point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enought? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enought? guess next)
          next
          (try next))))
  (try first-guess))

;; Average-damp
(define (average x y)
  (/ (+ x y)
     2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

;; Compose
(define (compose f g)
  (lambda (x)
    (f (g x))))

;; Recursion
(define (repeated f n)
  (cond ((= n 0)
        0)
        ((= n 1)
        f)
        (else
         (compose f
                  (repeated f (- n 1))))))

;; Iteration
(define (repeated f n)

  (define (iter i repeated-f)
    (cond ((= i 0)
           0)
          ((= i 1)
           repeated-f)
          (else
           (iter (- i 1)
                 (compose f repeated-f)))))

    (iter n f))

;; Expt
;; return: base^n
(define (expt base n)
  (if (= n 0)
      1
      ((repeated (lambda (x)
                   (* base x))
                 n)
       1)))

;; Repeat-average-damp
(define (repeat-average-damp f n)
  ((repeated average-damp n) f))

;; Damped-nth-root
(define (damped-nth-root n damped-time)
  (lambda (x)
    (fixed-point
     (repeat-average-damp
      (lambda (y)
        (/ x (expt y (- n 1))))
      damped-time)
     1.0)))

;; 要使得计算 n 次方根的不动点收敛，最少需要 ⌊lg⁡n⌋ 次平均阻尼。
(define (lg n)
  (cond ((> (/ n 2) 1)
         (+ 1 (lg (/ n 2))))
        ((< (/ n 2) 1)
         0)
        (else
         1)))

;; Nth-root
(define (nth-root n)
  (damped-nth-root n (lg n)))

;; Test
(define square
  (nth-root 2))
(newline)
(display (square (* 2 2))) ; 2^(2*1/2)
(newline)

(define cube
  (nth-root 3))
(newline)
(display (cube (* 3 3 3))) ; 3^(3*1/3)
(newline)

(define 5th-root
  (nth-root 5))
(newline)
(display (5th-root (* 5 5 5 5 5))) ; 5^(3*1/5)
(newline)
