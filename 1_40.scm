;; Constant
(define dx 0.00001)

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

;; Newtons-method
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newtons-method g guess)

  (define (newton-transform g)
    (lambda (x)
      (- x (/ (g x) ((deriv g) x)))))

  (fixed-point (newton-transform g) guess))

;; cubie
(define (cube x)
  (* x x x))

(define (cubie a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(newline)
(display (newtons-method (cubie 3 2 1) 1.0)) ; -2.3247179572447267
(newline)
(display (newtons-method (cubie 2 5 5) 1.0)) ; -1.2332293376819243
(newline)
