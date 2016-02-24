(define (f g)
  (g 2))

(newline)
(display (f square)) ; 4
(newline)
(display (f (lambda(z) (* z (+ z 1))))) ;; 6
(newline)
(display (f f))
(newline)

;; 展开(f f)
;; (f f)
;; -> (f (g 2))
;; -> ((g 2) (g 2))
;; -> ((g 2) 2)
;; -> (2 2)
;; 2 不是一个函数， 所以报错： =The object 2 is not applicable=
