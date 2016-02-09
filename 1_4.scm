(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 0) ;; Return 1
(a-plus-abs-b 1 1) ;; Return 2
(a-plus-abs-b 1 -1) ;; Return 2
