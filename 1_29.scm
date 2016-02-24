;; Sum function
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a)
              next
              b))))

;; Book's function
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f
          (+ a (/ dx 2.0))
          add-dx
          b)
     dx))

;; ;; Simpson's function
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define h/3 (/ h 3.0))

  (define (y k)
    (f (+ a (* k h))))

  (define (c k)
    (cond ((or (= k 0)
               (= k n))
           1)
          ((odd? k) 4)
          ((even? k) 2)))

  (define (term k)
    (* (c k)
       (y k)))

  (define (next k)
    (+ 1 k))

  (if (odd? n)
      (error "N should be even.")
      (* h/3
         (sum term (exact->inexact 0) next n)))
  )

;; New simpson's function
;; From: [[http://a.disquscdn.com/uploads/mediaembed/images/1299/321/original.jpg?w=800&h][new soluction]]
(define (new-simpson f a b n)
  (define h (/ (- b a) n))
  (define h/3 (/ h 3.0))

  (define (add-2dx x)
    (+ x h h))

  (* h/3
     (+ (f a)
        (* 2 (sum f (+ a h h) add-2dx (- b h h)))
        (* 4 (sum f (+ a h) add-2dx (- b h)))))
  )

;; Test
(define (cube n)
  (* n n n))

(newline)
(display "n = 100:")
(newline)
(display "Integral: ")
(display (integral cube 0 1 0.01))
(display " Simpson: ")
(display (simpson cube 0 1 100))
(display " New Simpson: ")
(display (new-simpson cube 0 1 100))
(newline)
(display "n = 1000:")
(newline)
(display "Integral: ")
(display (integral cube 0 1 0.001))
(display " Simpson: ")
(display (simpson cube 0 1 1000))
(display " New Simpson: ")
(display (new-simpson cube 0 1 1000))
