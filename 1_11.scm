(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f-it n)
  (define (f-iter a b c n)
    (cond ((= n 0) a)
          (else (f-iter b
                        c
                        (+ c
                           (* 2 b)
                           (* 3 a))
                        (- n 1)))))
  (f-iter 0 1 2 n)
  )
