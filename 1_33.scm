;; Recursion
(define (filtered-accumulate combiner null-value term a next b valid?)
  (if (> a b)
      null-value
      (let ((rest-terms (filtered-accumulate combiner
                                             null-value
                                             term
                                             (next a)
                                             next
                                             b
                                             valid?)))
        (if (valid? a)
            (combiner (term a) rest-terms)
            (rest-terms)))))

;; Problem a
(define (prime? n)
  (define times 100000)
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))
  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
  (cond ((= times 0) true
         ((fermat-test n) (prime? n (- times 1)))
         (else false))))

(define (prime-sum a b)
  (filtered-accumulate +
                       0
                       (lambda(x) x)
                       a
                       (lambda(x) (+ x 1))
                       b
                       prime?))

;; Problem b
(define (coprime? i n)
  (and (< i n)
       (= 1 (gcd i n))))

;; Test function
(define (test-function)
  (newline)
  (display (prime-sum 1 10)) ; 1+2+3+5+7=18
  (newline)
  (display (coprime? 2 7)) ; true
  (display (coprime? 2 4)) ; false
  (newline))

;; Recursion test
(test-function)

;; Iteration
(define (filtered-accumulate combiner null-value term a next b valid?)
  (define (iter a result)
    (if (> a b)
        result
        (if (valid? a)
            (iter (next a) (combiner result (term a)))
            (iter (next a) result))))
  (iter a null-value))

;; Iteration test
(test-function)
